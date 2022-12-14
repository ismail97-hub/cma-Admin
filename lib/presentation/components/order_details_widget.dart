import 'package:cma_admin/app/enum.dart';
import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/presentation/components/image_column.dart';
import 'package:cma_admin/presentation/resources/color_manager.dart';
import 'package:cma_admin/presentation/resources/strings_manager.dart';
import 'package:cma_admin/presentation/resources/styles_manager.dart';
import 'package:cma_admin/presentation/resources/values_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class DetailsOrderWidget extends StatelessWidget {
  final OrderModel order;
  final Function print;
  const DetailsOrderWidget(this.order, {Key? key,required this.print}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<OrderProdcut>? items = order.items;

    return  items == null
          ? Container()
          : Container(
              padding: EdgeInsets.all(AppPadding.p20),
              // height: AppSize.s500,
              width: AppSize.s500,
              child: Scaffold(
                backgroundColor: ColorManager.white,
                body: SingleChildScrollView(
                  child: Column(children: [
                    Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("${AppStrings.orderN.tr()}${order.id}",style: getBoldStyle(color: ColorManager.black)),
                            Text("${order.waiter!.name}",style: getBoldStyle(color: ColorManager.black)),
                            Text("${order.totalAmount} ${AppStrings.dh.tr()}",style: getBoldStyle(color: ColorManager.black))
                          ],
                        ),
                        order.assignedBy==null?Container():SizedBox(height: AppSize.s12),
                        order.assignedBy==null?Container():Row(
                          children: [
                            Text(AppStrings.assignedBy,style: getBoldStyle(color: ColorManager.lightGrey)).tr(),
                            Text(order.assignedBy!.name,style: getBoldStyle(color: ColorManager.black)),
                          ],
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: AppPadding.p10),
                      child: Divider(thickness: 0.5),
                    ),
                    ListView(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      children: items
                          .map((item) => Column(
                                children: [
                                  ListTile(
                                    leading: ImageColumn(item.product!.image,width: AppSize.s70,height: AppSize.s70),
                                    title: Text(item.product!.title,style: getSemiBoldStyle(color: ColorManager.black)),
                                    subtitle: Text(item.supplementsString(),style: getMediumStyle(color: ColorManager.lightGrey)),
                                    contentPadding: EdgeInsets.symmetric(horizontal: AppPadding.p8),
                                    trailing: Column(
                                      children: [
                                        Text("${item.quantity} x",style: getSemiBoldStyle(color: ColorManager.black)),
                                        SizedBox(height: AppSize.s14),
                                        Text("${item.amount} ${AppStrings.dh.tr()}",style: getSemiBoldStyle(color: ColorManager.black)),
                                      ],
                                    ),
                                  ),
                                  Divider(thickness: 0.5),
                                ],
                              ))
                          .toList(),
                    ),
                    SizedBox(height: AppSize.s50)
                  ]),
                ),
                floatingActionButton: order.status!=OrderStatus.DONE?null:_getPrintButton(),
                floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
              ),      
    );
  }

  Widget _getPrintButton(){
    return Container(
      width: double.infinity,
      height: AppSize.s40,
      child: ElevatedButton(onPressed: (){
          print.call();
      }, child: Icon(Icons.print)),
    );
  }
}
