import 'package:cma_admin/domain/model/model.dart';
import 'package:flutter/material.dart';
import '../../app/functions.dart';
import '../home/settings/account_settings/components/profile_photo.dart';
import '../resources/color_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/values_manager.dart';
import 'action_button.dart';
import 'field_label.dart';

class CustomUploadImage extends StatelessWidget {
  final String? imageUrl;
  final Function(PickerFile image) setImage;
  final Stream<PickerFile?> imageStream;
  const CustomUploadImage({Key? key, 
    this.imageUrl, 
    required this.setImage, 
    required this.imageStream}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FieldLabel(AppStrings.photo),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ProfilePhoto(
              imageUrl: imageUrl,
              setImage: (image)=> setImage.call(image), 
              imageStream: imageStream),
            SizedBox(width: AppSize.s24),
            ActionButton(onTap: () {
              startFilePicker((image)=>setImage.call(image));
            }, title: AppStrings.change, color: ColorManager.primary)
          ],
        )
      ],
    );
  }
}