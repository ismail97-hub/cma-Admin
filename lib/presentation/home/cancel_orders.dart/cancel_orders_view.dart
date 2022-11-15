import 'package:cma_admin/app/di.dart';
import 'package:cma_admin/data/mapper/mapper.dart';
import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/presentation/common/state_renderer/state_render_impl.dart';
import 'package:cma_admin/presentation/components/action_button.dart';
import 'package:cma_admin/presentation/components/custom_data_table.dart';
import 'package:cma_admin/presentation/components/headar_text.dart';
import 'package:cma_admin/presentation/components/not_found_widget.dart';
import 'package:cma_admin/presentation/home/cancel_orders.dart/cancel_orders.viewmodel.dart';
import 'package:cma_admin/presentation/resources/color_manager.dart';
import 'package:cma_admin/presentation/resources/strings_manager.dart';
import 'package:cma_admin/presentation/resources/values_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../app/functions.dart';
import '../../components/order_details_widget.dart';
import '../../components/popup_menu_column.dart';

class CancelOrdersView extends StatefulWidget {
  const CancelOrdersView({Key? key}) : super(key: key);

  @override
  State<CancelOrdersView> createState() => _CancelOrdersViewState();
}

class _CancelOrdersViewState extends State<CancelOrdersView> {
  CancelOrdersViewModel _viewModel = instance<CancelOrdersViewModel>();
  List<String> columns = [
    AppStrings.num,
    AppStrings.waiter,
    AppStrings.createdAt,
    AppStrings.itemsCount,
    AppStrings.amount,
    AppStrings.decision,
    AppStrings.actions
  ];

  _bind() {
    _viewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<FlowState>(
            stream: _viewModel.outputState,
            builder: (context, snapshot) {
              return snapshot.data?.getScreenWidget(
                      context, _getContentScreenWidget(), () => _bind()) ??
                  _getContentScreenWidget();
            }));
  }

  Widget _getContentScreenWidget() {
    return StreamBuilder<List<OrderModel>>(
        stream: _viewModel.outputPreCanceledOrders,
        builder: (context, snapshot) {
          List<OrderModel> preCanceledOrders = snapshot.data ?? [];
          return SingleChildScrollView(
            controller: ScrollController(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: AppSize.s20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppPadding.p20),
                  child: HeaderText(AppStrings.cancelOrders.tr()),
                ),
                SizedBox(height: AppSize.s20),
                _getDataTable(preCanceledOrders),
              ],
            ),
          );
        });
  }

  _getDataTable(List<OrderModel> preCanceledOrders) {
    return preCanceledOrders.isEmpty
        ? NotfoundWidget(AppStrings.noPreCanceledOrdersAvailable)
        : CustomDataTable(
            padding: EdgeInsets.symmetric(horizontal: AppPadding.p20),
            columns: columns
                .map((column) => DataColumn(label: Text(column).tr()))
                .toList(),
            rows: preCanceledOrders.reversed
                .map((order) => DataRow(cells: [
                      DataCell(Text(order.id.toString())),
                      DataCell(Text(order.waiter?.name ?? EMPTY)),
                      DataCell(Text(dateFormat(order.createdAt))),
                      DataCell(Text(order.itemsNumber.toString())),
                      DataCell(Text(order.totalAmount.toString())),
                      DataCell(Row(
                        children: [
                          ActionButton(
                              onTap: () => _viewModel.acceptCancelOrder(
                                  context, order.id),
                              title: AppStrings.accept,
                              color: ColorManager.green),
                          SizedBox(width: AppSize.s10),
                          ActionButton(
                              onTap: () => _viewModel.rejectCancelOrder(
                                  context, order.id),
                              title: AppStrings.reject,
                              color: ColorManager.red),
                        ],
                      )),
                      DataCell(PopUpMenuColumn(view: () {showDetails(order);}))
                    ]))
                .toList());
  }

  showDetails(OrderModel order) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(child: DetailsOrderWidget(order, print: () {}));
        });
  }
}
