import 'package:cma_admin/app/enum.dart';
import 'package:cma_admin/presentation/resources/color_manager.dart';
import 'package:cma_admin/presentation/resources/font_manager.dart';
import 'package:cma_admin/presentation/resources/strings_manager.dart';
import 'package:cma_admin/presentation/resources/styles_manager.dart';
import 'package:cma_admin/presentation/resources/values_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';



class OrderStatusItem extends StatelessWidget {
  final OrderStatus status;
  const OrderStatusItem({Key? key, required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StatusObjectView statusObjectView = status.getObject(); 
    return Container(
      width: AppSize.s80,
      height: AppSize.s30,
      decoration: BoxDecoration(
        color: statusObjectView.color.withOpacity(0.3),
        borderRadius: BorderRadius.circular(AppSize.s10),
      ),
      child: Center(
        child: Text(statusObjectView.status,
            style:getBoldStyle(color: statusObjectView.color,fontSize: FontSize.s11)).tr(),
      ),
    );
  }
  
}

extension OrderStatusExtension on OrderStatus{
  StatusObjectView getObject(){
    switch (this) {
      case OrderStatus.INPROGRESS :
        return StatusObjectView(ColorManager.orange,AppStrings.pending);
      case OrderStatus.PRE_CANCELED:
        return StatusObjectView(ColorManager.blue,AppStrings.pre_canceled);
      case OrderStatus.CANCELED:
        return StatusObjectView(ColorManager.red,AppStrings.canceled);
      case OrderStatus.DONE:
        return StatusObjectView(ColorManager.green,AppStrings.completed);
      default:
        return StatusObjectView(ColorManager.orange,AppStrings.pending);
    }
  }
}

class StatusObjectView {
  Color color;
  String status;

  StatusObjectView(
    this.color,
    this.status,
  );
}
