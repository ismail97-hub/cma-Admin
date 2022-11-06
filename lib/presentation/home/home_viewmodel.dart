import 'dart:async';

import 'package:cma_admin/app/app_prefs.dart';
import 'package:cma_admin/app/constant.dart';
import 'package:cma_admin/app/functions.dart';
import 'package:cma_admin/data/mapper/mapper.dart';
import 'package:cma_admin/data/network/web_socket.dart';
import 'package:cma_admin/domain/usecase/home_usecase.dart';
import 'package:cma_admin/presentation/base/baseviewmodel.dart';
import 'package:cma_admin/presentation/resources/routes_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';
import 'package:stomp_dart_client/stomp_frame.dart';

class HomeViewModel extends BaseViewModel with HomeViewModelInput,HomeViewModelOutput{
  StreamController _currentIndexStreamController = BehaviorSubject<int>();
  StreamController _preCanceledOrdersCountStreamController = BehaviorSubject<int>();
  AppPreferences _appPreferences;
  HomeUseCase _useCase;
  HomeViewModel(this._appPreferences,this._useCase);
  
  late StompWS websocket = StompWS(Constant.refresh_precanceled_orders_count_topic, (frame)=>callBack(frame));

  @override
  void start() {
    websocket.init();
    _getPreCanceledOrdersCount();
  }

  callBack(StompFrame frame){
    _getPreCanceledOrdersCount();
  }

  _getPreCanceledOrdersCount()async{
    (await _useCase.execute(EMPTY)).fold(
      (failue) => null, 
      (count) => inputPreCanceledOrdersCount.add(count));
  }

  @override
  void dispose() {
    websocket.dispose();
    _preCanceledOrdersCountStreamController.close();
    _currentIndexStreamController.close();
    super.dispose();
  }

  @override
  onTap(BuildContext context,int index) {
    inputCurrentIndex.add(index);
    if (isMobile(context)) {
      Navigator.of(context).pop();
    }
    if (index==8) {
      logout(context);
    }
  }

  logout(BuildContext context) {
    _appPreferences.logout();
    Navigator.pushNamedAndRemoveUntil(
        context, Routes.loginRoute, ModalRoute.withName('/'),
        arguments: 0);
  }

  @override
  Sink get inputCurrentIndex => _currentIndexStreamController.sink;

  @override
  Sink get inputPreCanceledOrdersCount => _preCanceledOrdersCountStreamController.sink;

  @override
  Stream<int> get outputCurrentIndex => _currentIndexStreamController.stream.map((currentIndex) => currentIndex);

  @override
  Stream<int> get outputPreCanceledOrdersCount => _preCanceledOrdersCountStreamController.stream.map((count) => count);
}

abstract class HomeViewModelInput {
  onTap(BuildContext context,int index);
  Sink get inputCurrentIndex;
  Sink get inputPreCanceledOrdersCount;
}


abstract class HomeViewModelOutput {
  Stream<int> get outputCurrentIndex;
  Stream<int> get outputPreCanceledOrdersCount;
}