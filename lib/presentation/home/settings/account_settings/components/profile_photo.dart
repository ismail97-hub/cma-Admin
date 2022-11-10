import 'package:cma_admin/presentation/resources/color_manager.dart';
import 'package:cma_admin/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import '../../../../../app/constant.dart';
import '../../../../../data/mapper/mapper.dart';
import '../../../../../domain/model/model.dart';
import '../../../../resources/assets_manager.dart';

class ProfilePhoto extends StatelessWidget {
  final Function(PickerFile) setImage;
  final Stream<PickerFile?> imageStream;
  final String imageUrl;
  const ProfilePhoto({ Key? key,required this.setImage,required this.imageStream,String? imageUrl}) 
    :this.imageUrl = imageUrl??EMPTY,    
    super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PickerFile?>(
      stream: imageStream,
      builder: (context, snapshot) {
        PickerFile? pickerFile = snapshot.data;
        return CircleAvatar(
          radius: AppSize.s24,
          backgroundColor: ColorManager.lightGrey,
          backgroundImage: pickerFile!=null
                ? MemoryImage(pickerFile.byte)
                : imageUrl.isNotEmpty&&imageUrl!=Constant.ImageUrl
                    ? NetworkImage(imageUrl)
                    : AssetImage(ImageAssets.profile) as ImageProvider);
      }
    );
  }

}