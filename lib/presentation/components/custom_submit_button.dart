import 'package:flutter/material.dart';
import '../resources/values_manager.dart';

class CustomSubmitButton extends StatelessWidget {
  final Stream<bool> isAllInputValidStream;
  final Function onTap; 
  final String buttonText;
  const CustomSubmitButton({Key? key, 
    required this.isAllInputValidStream, required this.onTap, required this.buttonText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return StreamBuilder<bool>(
      stream: isAllInputValidStream,
      builder: (context, snapshot) {
        return SizedBox(
          width: AppSize.s100,
          height: AppSize.s40,
          child: ElevatedButton(
              onPressed: (snapshot.data ?? false)? () =>onTap.call(): null,
              child: Text(buttonText)),
        );
      },
    );
  }
}