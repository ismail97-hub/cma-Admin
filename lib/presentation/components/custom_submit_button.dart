import 'package:flutter/material.dart';
import '../resources/values_manager.dart';

class CustomSubmitButton extends StatelessWidget {
  final Stream<bool> isAllInputValidStream;
  final Function onTap; 
  final String buttonText;
  final double width;
  const CustomSubmitButton({Key? key, double? width,
    required this.isAllInputValidStream, required this.onTap, required this.buttonText}) 
    : this.width = width ?? AppSize.s100, 
    super(key: key);

  @override
  Widget build(BuildContext context) {
     return StreamBuilder<bool>(
      stream: isAllInputValidStream,
      builder: (context, snapshot) {
        return SizedBox(
          width: width,
          height: AppSize.s40,
          child: ElevatedButton(
              onPressed: (snapshot.data ?? false)? () =>onTap.call(): null,
              child: Text(buttonText)),
        );
      },
    );
  }
}