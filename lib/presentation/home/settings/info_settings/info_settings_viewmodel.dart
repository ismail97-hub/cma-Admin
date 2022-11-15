
import 'dart:async';
import 'package:cma_admin/data/mapper/mapper.dart';
import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/domain/usecase/info_settings_usecase.dart';
import 'package:cma_admin/presentation/common/state_renderer/state_render_impl.dart';
import 'package:cma_admin/presentation/common/state_renderer/state_renderer.dart';
import 'package:cma_admin/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:cma_admin/presentation/base/baseviewmodel.dart';
import '../../../../app/hive_helper.dart';
import '../../../common/freezed_data_classes.dart';


class InfoSettingsViewModel extends BaseViewModel with UpdateInfoViewModelInput,UpdateInfoViewModelOutput {
  StreamController _telephoneStreamController = BehaviorSubject<String>();
  StreamController _adressStreamController = BehaviorSubject<String>();
  StreamController _wifiPasswordStreamController = BehaviorSubject<String>();
  StreamController _isValidToUpdateStreamController = BehaviorSubject<void>();

  InfoSettingsUseCase _useCase;
  InfoSettingsViewModel(this._useCase);

  InfoObject _viewObject = new InfoObject(EMPTY,EMPTY,EMPTY);


  @override
  void start() {
    Info info = HiveHelper.getInfo()!; 
    setAddress(info.address);
    setTelephone(info.telephone);
    setWifiPassword(info.wifiPassword);
  }

  @override
  void dispose() {
    _adressStreamController.close();
    _telephoneStreamController.close();
    _wifiPasswordStreamController.close();
    super.dispose();
  }

  @override
  updateInfo(BuildContext context) async{
    inputState.add(LoadingState(stateRendererType: StateRendererType.POPUP_LOADING_STATE));
    (await _useCase.execute(InfoSettingsUseCaseInput(
      _viewObject.telephone, 
      _viewObject.address, 
      _viewObject.wifiPassword))).fold(
        (failure) => inputState.add(ErrorState(StateRendererType.POPUP_ERROR_STATE, failure.message)), 
        (info) {
          HiveHelper.updateInfo(info);
          Navigator.of(context).pop();
          inputState.add(SuccessState(AppStrings.successUpdateInfo));
        });
  }

  @override
  setAddress(String adress) {
    inputAddress.add(adress);
    if (_isAdressValid(adress)) {
      _viewObject = _viewObject.copyWith(address: adress);
    } else {
      _viewObject = _viewObject.copyWith(address: EMPTY);
    }
    _validate();
  }

  @override
  setTelephone(String telephone) {
    inputTelephone.add(telephone);
    if (_isTelephoneValid(telephone)) {
      _viewObject = _viewObject.copyWith(telephone: telephone);
    } else {
      _viewObject = _viewObject.copyWith(telephone: EMPTY);
    }
    _validate();
  }

  @override
  setWifiPassword(String wifiPassword) {
    inputWifiPassword.add(wifiPassword);
    if (_isWifiPasswordValid(wifiPassword)) {
      _viewObject = _viewObject.copyWith(wifiPassword: wifiPassword);
    } else {
      _viewObject = _viewObject.copyWith(wifiPassword: EMPTY);
    }
    _validate();
  }
  
  @override
  Sink get inputAddress => _adressStreamController.sink;
  
  @override
  Sink get inputTelephone => _telephoneStreamController.sink;
  
  @override
  Sink get inputWifiPassword => _wifiPasswordStreamController.sink;

  @override
  Sink get inputIsValidToUpdate => _isValidToUpdateStreamController.sink;
  
  @override
  Stream<String?> get outputErrorAddress => 
        outputIsAddressValid.map((isAdressValid) => isAdressValid?null:AppStrings.addressError);
  
  @override
  Stream<String?> get outputErrorTelephone => 
        outputIsTelephoneValid.map((isTelephoneValid) => isTelephoneValid?null:AppStrings.telephoneError);
  
  @override
  Stream<String?> get outputErrorWifiPassword => 
        outputIsWifiPasswordValid.map((isWifiPassword) => isWifiPassword?null:AppStrings.wifiPasswordError);
  
  @override
  Stream<bool> get outputIsAddressValid => _adressStreamController.stream.map((adress) => _isAdressValid(adress));
  
  @override
  Stream<bool> get outputIsTelephoneValid => _telephoneStreamController.stream.map((telephone) => _isTelephoneValid(telephone));
  
  @override
  Stream<bool> get outputIsWifiPasswordValid => _wifiPasswordStreamController.stream.map((wifiPassword) => _isWifiPasswordValid(wifiPassword));  
  
  @override
  Stream<bool> get outputIsValidToUpdate => _isValidToUpdateStreamController.stream.map((_) => _isValidToUpdate());

  //private fun

  bool _isAdressValid(String adress){
    return adress.length>6;
  }
  bool _isTelephoneValid(String telephone){
    return telephone.length>=10;
  }
  bool _isWifiPasswordValid(String wifiPassword){
    return wifiPassword.length>6;
  }

  bool _isValidToUpdate(){
    return _viewObject.telephone.isNotEmpty && 
           _viewObject.wifiPassword.isNotEmpty && 
           _viewObject.address.isNotEmpty; 
  } 

  _validate(){
    inputIsValidToUpdate.add(null);
  }
}

abstract class UpdateInfoViewModelInput {
  updateInfo(BuildContext context);
  setTelephone(String telephone);
  setAddress(String adress);
  setWifiPassword(String wifiPassword);
  Sink get inputAddress;
  Sink get inputTelephone;
  Sink get inputWifiPassword;
  Sink get inputIsValidToUpdate;
}


abstract class UpdateInfoViewModelOutput {
  Stream<bool> get outputIsAddressValid;
  Stream<String?> get outputErrorAddress;
  Stream<bool> get outputIsTelephoneValid;
  Stream<String?> get outputErrorTelephone;
  Stream<bool> get outputIsWifiPasswordValid;
  Stream<String?> get outputErrorWifiPassword;
  Stream<bool> get outputIsValidToUpdate;
}