import 'package:cma_admin/presentation/home/components/side_nav/side_nav.dart';
import 'package:cma_admin/presentation/home/components/side_nav/side_nav_item.dart';
import 'package:cma_admin/presentation/resources/color_manager.dart';
import 'package:cma_admin/presentation/resources/font_manager.dart';
import 'package:cma_admin/presentation/resources/icon_manager.dart';
import 'package:cma_admin/presentation/resources/strings_manager.dart';
import 'package:cma_admin/presentation/resources/styles_manager.dart';
import 'package:cma_admin/presentation/resources/values_manager.dart';
import 'package:flutter/cupertino.dart';

class SettingsSideNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  const SettingsSideNav({Key? key,required this.currentIndex,required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SideNav(
      color: ColorManager.white,
      width: AppSize.s200,
      header: _getHeader(), 
      items: [
        _getSideNavItem(0, AppStrings.account, IconManger.account),
        _getSideNavItem(1, AppStrings.info, IconManger.info),
        _getSideNavItem(2, AppStrings.language, IconManger.language),
      ]);
  }

  Widget _getHeader(){
    return Padding(
      padding: EdgeInsets.symmetric(vertical:AppPadding.p14),
      child: Text(AppStrings.settings,style: getSemiBoldStyle(color: ColorManager.black,fontSize: FontSize.s18)),
    );
  }
  
  SideNavItem _getSideNavItem(int index,String label,IconData icon){
    return SideNavItem(
      onTap: ()=>onTap.call(index), 
      icon: icon, 
      label: label, 
      isSelected: currentIndex==index,     
      // selected Color
      selectedIconColor: ColorManager.black,
      selectedItemColor: ColorManager.lightGrey.withOpacity(0.1),
      selectedTextColor: ColorManager.black,
      // unselected Color
      unSelectedItemColor: ColorManager.white,
      unSelectedIconColor: ColorManager.lightGrey,
      unSelectedTextColor: ColorManager.lightGrey,
    );
  }

}