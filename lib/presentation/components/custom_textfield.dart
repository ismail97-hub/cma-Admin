import 'package:flutter/material.dart';

import '../resources/values_manager.dart';
import 'field_label.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final bool isRequired;
  final bool obscureText;
  final double width;
  final Stream<String?> errorStream;
  final TextEditingController textEditingController;
  const CustomTextField({Key? key,
    required this.label,
    required this.errorStream,
    required this.textEditingController,
    double? width,
    bool? obscureText,
    bool? isRequired}) 
  : this.isRequired = isRequired ?? true,
    this.obscureText = obscureText ?? false,
    this.width = width ?? AppSize.s250,
  super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FieldLabel(label,isRequired: isRequired),
          StreamBuilder<String?>(
            stream: errorStream,
            builder: (context, snapshot) {
              return TextFormField(
                  keyboardType: TextInputType.text,
                  obscureText: obscureText,
                  controller: textEditingController,
                  decoration: InputDecoration(
                      hintText: label,
                      errorText: snapshot.data));
            },
          ),
        ],
      ),
    );
  }
}