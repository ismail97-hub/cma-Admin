import 'package:cma_admin/data/mapper/mapper.dart';
import 'package:cma_admin/presentation/resources/color_manager.dart';
import 'package:cma_admin/presentation/resources/font_manager.dart';
import 'package:cma_admin/presentation/resources/styles_manager.dart';
import 'package:flutter/material.dart';

import '../../../resources/values_manager.dart';

class SideNavItem extends StatelessWidget {
  const SideNavItem(
      {Key? key,
      bool? isSelected,
      bool? showBadge,
      required this.onTap,
      required this.icon,
      required this.label,
      this.badgeContent})
      : this.isSelected = isSelected ?? false,
        this.showBadge = showBadge ?? false,
        super(key: key);

  final bool isSelected;
  final bool showBadge;
  final IconData icon;
  final String label;
  final String? badgeContent;
  final Function onTap;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected?ColorManager.white:ColorManager.primary,
        borderRadius: BorderRadius.circular(AppSize.s4)     
      ),
      child: ListTile(
        horizontalTitleGap: AppSize.s0,
        style: ListTileStyle.drawer,
        selected: isSelected,
        iconColor: ColorManager.white,
        selectedColor: ColorManager.primary,
        hoverColor: ColorManager.lightGrey.withOpacity(0.3),
        onTap: ()=>onTap.call(),
        leading: Icon(icon,size: AppSize.s22),
        title: Text(label,style: getMediumStyle(color: isSelected?ColorManager.primary:ColorManager.white,fontSize: FontSize.s13)),
        trailing: !showBadge
            ? null
            : CircleAvatar(
                radius: 10,
                backgroundColor:isSelected ? ColorManager.primary : ColorManager.white,
                child: Text(badgeContent??EMPTY,
                  style: getSemiBoldStyle(color: isSelected ? ColorManager.white : ColorManager.primary)), 
              ),
      ),
    );
  }
}
