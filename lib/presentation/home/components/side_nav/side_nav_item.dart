import 'package:cma_admin/data/mapper/mapper.dart';
import 'package:cma_admin/presentation/resources/color_manager.dart';
import 'package:cma_admin/presentation/resources/font_manager.dart';
import 'package:cma_admin/presentation/resources/styles_manager.dart';
import 'package:flutter/material.dart';

import '../../../resources/values_manager.dart';

class SideNavItem extends StatelessWidget {
  SideNavItem(
      {Key? key,
      required this.isSelected,
      bool? showBadge,
      Color? selectedItemColor,
      Color? unSelectedItemColor,
      Color? selectedIconColor,
      Color? unSelectedIconColor,
      Color? selectedTextColor,
      Color? unSelectedTextColor,
      Color? hoverColor,
      double? iconSize,
      double? textSize,
      this.badgeWidget,
      required this.onTap,
      required this.icon,
      required this.label,
      this.badgeContent})
      : this.showBadge = showBadge ?? false,
        this.selectedItemColor = selectedItemColor ?? ColorManager.white,
        this.unSelectedItemColor = unSelectedItemColor ?? ColorManager.primary,
        this.selectedIconColor = selectedIconColor ?? ColorManager.primary,
        this.unSelectedIconColor = unSelectedIconColor ?? ColorManager.white,
        this.selectedTextColor = selectedTextColor ?? ColorManager.primary,
        this.unSelectedTextColor = unSelectedTextColor ?? ColorManager.white,
        this.hoverColor = hoverColor ?? ColorManager.lightGrey.withOpacity(0.3),
        this.textSize = textSize ?? FontSize.s13,
        this.iconSize = iconSize ?? AppSize.s22,
        super(key: key);

  final bool isSelected;
  final bool showBadge;
  final IconData icon;
  final String label;
  final String? badgeContent;
  final Function onTap;
  final Color selectedItemColor;
  final Color unSelectedItemColor;
  final Color selectedIconColor;
  final Color unSelectedIconColor;
  final Color hoverColor;
  final double iconSize;
  final Color selectedTextColor;
  final Color unSelectedTextColor;
  final double textSize;
  final Widget? badgeWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected?selectedItemColor:unSelectedItemColor,
        borderRadius: BorderRadius.circular(AppSize.s4)     
      ),
      child: ListTile(
        horizontalTitleGap: AppSize.s0,
        style: ListTileStyle.drawer,
        selected: isSelected,
        iconColor: unSelectedIconColor,
        selectedColor: selectedIconColor,
        hoverColor: hoverColor,
        onTap: ()=>onTap.call(),
        leading: Icon(icon,size: iconSize),
        title: Text(label,style:getMediumStyle(color: isSelected?selectedTextColor:unSelectedTextColor,fontSize: textSize)),
        trailing: !showBadge
            ? null
            : badgeWidget??CircleAvatar(
                radius: 10,
                backgroundColor:isSelected ? ColorManager.primary : ColorManager.white,
                child: Text(badgeContent??EMPTY,
                  style: getSemiBoldStyle(color: isSelected ? ColorManager.white : ColorManager.primary)), 
              ),
      ),
    );
  }
}
