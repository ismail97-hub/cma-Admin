import 'package:ant_icons/ant_icons.dart';
import 'package:cma_admin/app/di.dart';
import 'package:cma_admin/data/mapper/mapper.dart';
import 'package:cma_admin/presentation/home/components/side_nav/side_nav.dart';
import 'package:cma_admin/presentation/resources/color_manager.dart';
import 'package:cma_admin/presentation/resources/font_manager.dart';
import 'package:cma_admin/presentation/resources/icon_manager.dart';
import 'package:cma_admin/presentation/resources/strings_manager.dart';
import 'package:cma_admin/presentation/resources/styles_manager.dart';
import 'package:cma_admin/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

import '../home_viewmodel.dart';
import 'side_nav/side_nav_item.dart';

// ignore: must_be_immutable
class SideNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  SideNavBar({Key? key,required this.currentIndex,required this.onTap}) : super(key: key);
  var _viewModel = instance<HomeViewModel>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: _viewModel.outputPreCanceledOrdersCount,
      builder: (context, snapshot) {
        int count = snapshot.data??ZERO;
        return SideNav(
                header: _getHeader(),
                items: [
                  _getSideNavItem(0,AppStrings.dashboard, IconManger.dashboard),
                  _getSideNavItem(1,AppStrings.orders, IconManger.orders),
                  _getSideNavItem(2,AppStrings.cancelOrders, IconManger.cancelOrders,showBadge: count!=ZERO,badgeContent: count.toString()),
                  _getSideNavItem(3,AppStrings.categories, IconManger.categories),
                  _getSideNavItem(4,AppStrings.products, IconManger.products),
                  _getSideNavItem(5,AppStrings.supplements, IconManger.supplements),
                  _getSideNavItem(6,AppStrings.users, IconManger.users),
                  _getSideNavItem(7,AppStrings.settings, IconManger.settings),
                  _getSideNavItem(8,AppStrings.logout, IconManger.logout),
                ]);        
      }
    );
  }

  Widget _getHeader() {
    return Container(
      height: AppSize.s80,
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
          Text("CMA-ADMIN",style: getBoldStyle(color: ColorManager.white, fontSize: FontSize.s20)),
        ],
      ),
    );
  }


  SideNavItem _getSideNavItem(int index,String label, IconData icon,{bool? showBadge,String? badgeContent}) {
    return SideNavItem(
        isSelected: index==currentIndex,
        icon: icon,
        label: label,
        badgeContent: badgeContent,
        showBadge: showBadge,
        onTap: () {
          onTap.call(index);
        });
  }
}
