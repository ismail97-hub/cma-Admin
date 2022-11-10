import 'package:cma_admin/presentation/home/components/side_nav/side_nav_item.dart';
import 'package:cma_admin/presentation/resources/color_manager.dart';
import 'package:cma_admin/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

class SideNav extends StatelessWidget {
  SideNav({Key? key, 
    double? width,
    Color? color,
    this.height,
    EdgeInsets? padding,
    required this.header, 
    required this.items}) : 
      this.width=width??AppSize.s230,
      this.color=color??ColorManager.primary,
      this.padding = padding??EdgeInsets.all(AppPadding.p8),
      super(key: key);
  
  final Widget header;
  final Color color;
  final List<SideNavItem> items;
  final double width;
  final double? height;
  final EdgeInsets padding;


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: color),
      width: width,
      height: height??MediaQuery.of(context).size.height,
      padding: padding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          header,
          ListView(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            padding: EdgeInsets.zero,
            children: items,
          )
        ]
      ),
    );
  }
}