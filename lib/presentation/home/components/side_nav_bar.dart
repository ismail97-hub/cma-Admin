import 'package:ant_icons/ant_icons.dart';
import 'package:cma_admin/app/di.dart';
import 'package:cma_admin/data/mapper/mapper.dart';
import 'package:cma_admin/presentation/resources/color_manager.dart';
import 'package:cma_admin/presentation/resources/font_manager.dart';
import 'package:cma_admin/presentation/resources/icon_manager.dart';
import 'package:cma_admin/presentation/resources/strings_manager.dart';
import 'package:cma_admin/presentation/resources/styles_manager.dart';
import 'package:cma_admin/presentation/resources/values_manager.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:side_navigation/side_navigation.dart';

import '../home_viewmodel.dart';

// ignore: must_be_immutable
class SideNavBar extends StatelessWidget {
  final PageController page;
  SideNavBar({Key? key, required this.page}) : super(key: key);
  var _viewModel = instance<HomeViewModel>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: _viewModel.outputPreCanceledOrdersCount,
      builder: (context, snapshot) {
        int count = snapshot.data??ZERO;
        return StreamBuilder<int>(
          stream: _viewModel.outputCurrentIndex,
          builder: (context, snapshot) {
            int currentIndex = snapshot.data??0;
            return SideMenu(
                controller: page,
                title: _getHeader(),
                style: _getSideMenuStyle(),
                items: [
                  _getSideNavItem(context,0, AppStrings.dashboard, IconManger.dashboard),
                  _getSideNavItem(context,1, AppStrings.orders, IconManger.orders),
                  _getSideNavItem(context,2, AppStrings.cancelOrders, IconManger.cancelOrders,count: count,currentIndex: currentIndex),
                  _getSideNavItem(context,3, AppStrings.categories, IconManger.categories),
                  _getSideNavItem(context,4, AppStrings.products, IconManger.products),
                  _getSideNavItem(context,5, AppStrings.supplements, IconManger.supplements),
                  _getSideNavItem(context,6, AppStrings.users, IconManger.users),
                  _getSideNavItem(context,7, AppStrings.logout, IconManger.logout),
                ]);
          }
        );
      }
    );
  }

  Widget _getHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppPadding.p20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              margin: EdgeInsets.only(bottom: AppMargin.m8),
              child: Icon(
                AntIcons.account_book,
                color: ColorManager.white,
                size: AppSize.s30,
              )),
          SizedBox(width: AppSize.s10),
          Text("CMA-ADMIN",
              style: getBoldStyle(
                  color: ColorManager.white, fontSize: FontSize.s20)),
        ],
      ),
    );
  }

  SideMenuStyle _getSideMenuStyle() {
    return SideMenuStyle(
      itemInnerSpacing: AppPadding.p14,
      iconSize: AppSize.s22,
      openSideMenuWidth: AppSize.s230,
      unselectedTitleTextStyle: getMediumStyle(color: ColorManager.white,fontSize: FontSize.s13),
      unselectedIconColor: ColorManager.white,
      showTooltip: true,
      displayMode: SideMenuDisplayMode.auto,
      hoverColor: ColorManager.lightGrey.withOpacity(0.4),
      selectedColor: ColorManager.white,
      selectedTitleTextStyle: getMediumStyle(color: ColorManager.primary,fontSize: FontSize.s13),
      selectedIconColor: ColorManager.primary,
      backgroundColor: ColorManager.primary
    );
  }

  SideMenuItem _getSideNavItem(BuildContext context,int priority, String label, IconData icon,{int? count,int? currentIndex}) {
    return SideMenuItem(
        icon: Icon(icon),
        title: label,
        priority: priority,
        trailing: count==null||count==ZERO||currentIndex==null?null:CircleAvatar(
          radius: 10,
          backgroundColor: currentIndex==priority?ColorManager.primary:ColorManager.white,
          child: Text(count.toString(),style: getSemiBoldStyle(color: currentIndex==priority?ColorManager.white:ColorManager.primary)),
        ),
        onTap: () {
          if (priority!=7) {
            page.jumpToPage(priority);
            _viewModel.inputCurrentIndex.add(priority);
          }else{
            _viewModel.logout(context);
          }

        });
  }
}
