import 'package:flutter/material.dart';

import '../resources/color_manager.dart';
import '../resources/strings_manager.dart';
import 'color_picker_label.dart';
import 'field_label.dart';

class CustomColorPicker extends StatelessWidget {
  final Color initColor;
  final Stream<Color> stream;
  final Function(Color) onTap;
  CustomColorPicker({Key? key,Color? initColor ,required this.stream, required this.onTap}) 
  : this.initColor = initColor ?? ColorManager.grey,
  super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FieldLabel(AppStrings.color),
        StreamBuilder<Color?>(
          stream: stream,
          builder: (context, snapshot) {
            Color color = snapshot.data ?? initColor;
            return ColorPickerForm(
              color: color,
              setColor: (color)=>onTap.call(color),
            );
          },
        )
      ],
    );
  }
}