
import 'dart:async';

import 'package:cma_admin/data/mapper/mapper.dart';
import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/domain/usecase/cancel_orders_usecase.dart';
import 'package:cma_admin/presentation/base/baseviewmodel.dart';
import 'package:cma_admin/presentation/common/state_renderer/state_render_impl.dart';
import 'package:cma_admin/presentation/common/state_renderer/state_renderer.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/subjects.dart';

import '../../resources/strings_manager.dart';

class CancelOrdersViewModel extends BaseViewModel with CancelOrdersViewModelInput,CancelOrdersViewModelOutput {
  StreamController _preCanceledOrdersStreamController = BehaviorSubject<List<OrderModel>>();
  CancelOrdersUseCase _useCase;
  CancelOrdersViewModel(this._useCase);

  @override
  void start() {
    _getPreCanceledOrders();
  }

  _getPreCanceledOrders()async{
    inputState.add(LoadingState(stateRendererType: StateRendererType.FULL_SCREEN_LOADING_STATE));
    (await _useCase.execute(EMPTY)).fold(
      (failure) => inputState.add(ErrorState(StateRendererType.POPUP_ERROR_STATE, failure.message)), 
      (preCanceledOrders) {
        inputPreCanceledOrders.add(preCanceledOrders);
        inputState.add(ContentState());
      });
  }


  @override
  void dispose() {
    _preCanceledOrdersStreamController.close();
    super.dispose();
  }

  @override
  acceptCancelOrder(BuildContext context,int id) async{
    inputState.add(LoadingState(stateRendererType: StateRendererType.POPUP_LOADING_STATE));
    (await _useCase.acceptCancelOrder(id)).fold(
      (failure) => inputState.add(ErrorState(StateRendererType.POPUP_ERROR_STATE, failure.message)), 
      (succes){
        start();
        inputState.add(ContentState());
        Navigator.of(context).pop();
      });
  }

  @override
  rejectCancelOrder(BuildContext context,int id) async{
    inputState.add(LoadingState(stateRendererType: StateRendererType.POPUP_LOADING_STATE));
    (await _useCase.rejectCancelOrder(id)).fold(
      (failure) => inputState.add(ErrorState(StateRendererType.POPUP_ERROR_STATE, failure.message)), 
      (succes) {
        start();
        inputState.add(ContentState());
        Navigator.of(context).pop();
      });
  
  }
  
  @override
  Sink get inputPreCanceledOrders => _preCanceledOrdersStreamController.sink;
  
  @override
  Stream<List<OrderModel>> get outputPreCanceledOrders => 
    _preCanceledOrdersStreamController.stream.map((preCanceledOrders) => preCanceledOrders);
  
}

abstract class CancelOrdersViewModelInput {
  acceptCancelOrder(BuildContext context,int id);
  rejectCancelOrder(BuildContext context,int id);
  Sink get inputPreCanceledOrders;
}

abstract class CancelOrdersViewModelOutput {
  Stream<List<OrderModel>> get outputPreCanceledOrders; 
}