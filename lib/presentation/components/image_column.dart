import 'package:cma_admin/app/constant.dart';
import 'package:cma_admin/presentation/resources/color_manager.dart';
import 'package:cma_admin/presentation/resources/styles_manager.dart';
import 'package:cma_admin/presentation/resources/values_manager.dart';
import 'package:cma_admin/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class ImageColumn extends StatelessWidget {
  final String image;
  final double height;
  final double width;
  const ImageColumn(this.image, {Key? key,double? height,double? width}) :
   height = height ?? AppSize.s50,
   width = width ?? AppSize.s50,  
   super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height,
        width: width,
        child: image == Constant.ImageUrl
            ? Center(
                child: Text(
                AppStrings.noImage,
                textAlign: TextAlign.center,
                style: getMediumStyle(color: ColorManager.lightGrey),
              ).tr())
            : Image.network(image));
  }
}
