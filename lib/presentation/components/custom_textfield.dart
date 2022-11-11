import 'package:flutter/material.dart';

import '../resources/values_manager.dart';
import 'field_label.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final bool isRequired;
  final bool obscureText;
  final Stream<String?> errorStream;
  final TextEditingController textEditingController;
  const CustomTextField({Key? key,
    required this.label,
    required this.errorStream,
    required this.textEditingController,
    bool? obscureText,
    bool? isRequired}) 
  : this.isRequired = isRequired ?? true,
    this.obscureText = obscureText ?? false,
  super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.s250,
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