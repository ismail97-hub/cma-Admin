import 'dart:typed_data';

import 'package:cma_admin/app/constant.dart';
import 'package:cma_admin/data/mapper/mapper.dart';
import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/presentation/resources/assets_manager.dart';
import 'package:cma_admin/presentation/resources/color_manager.dart';
import 'package:cma_admin/presentation/resources/strings_manager.dart';
import 'package:cma_admin/presentation/resources/values_manager.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../app/functions.dart';

class ImagePickerWidget extends StatelessWidget {
  final Function(PickerFile) setImage;
  final Stream<PickerFile?> imageStream;
  final String imageUrl;
  const ImagePickerWidget({ Key? key,required this.setImage,required this.imageStream,String? imageUrl}) 
    :this.imageUrl = imageUrl??EMPTY,    
    super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        startFilePicker((pickerFile) => setImage.call(pickerFile));
      },
      child: DottedBorder(
        borderType: BorderType.RRect,
        radius: Radius.circular(AppSize.s4),
        dashPattern: [5, 5],
        color: ColorManager.grey,
        strokeWidth: AppSize.s2,
        child: SizedBox(
          child: _getMediaWidget(),
          height: AppSize.s200,
          width: double.infinity,
        ),
      ),
    );
  }

   Widget _getMediaWidget() {
    return StreamBuilder<PickerFile?>(
      stream: imageStream,
      builder: (context, snapshot) {
        PickerFile? pickerFile = snapshot.data;
        return pickerFile != null
            ? _imagePickedByUser(pickerFile.byte)
            : imageUrl.isNotEmpty&&imageUrl!=Constant.ImageUrl?Image.network(imageUrl):Padding(
              padding: EdgeInsets.symmetric(vertical: AppPadding.p20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: AppSize.s120,
                      width: AppSize.s120,
                      child: Image.asset(
                        ImageAssets.gallery,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(AppStrings.uploadImage).tr(),
                  ],
                ),
            );
      },
    );
  }

  Widget _imagePickedByUser(Uint8List? image) {
    if (image != null) {
      return Image.memory(
        image,
        fit: BoxFit.contain,
      );
    } else {
      return Container();
    }
  }
  
}