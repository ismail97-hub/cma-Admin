
import 'dart:async';

import 'package:cma_admin/data/mapper/mapper.dart';
import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/domain/usecase/update_info_usecase.dart';
import 'package:cma_admin/presentation/common/state_renderer/state_render_impl.dart';
import 'package:cma_admin/presentation/common/state_renderer/state_renderer.dart';
import 'package:cma_admin/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import '../base/baseviewmodel.dart';
import '../common/freezed_data_classes.dart';

class UpdateInfoViewModel extends BaseViewModel with UpdateInfoViewModelInput,UpdateInfoViewModelOutput {
  StreamController _infoStreamController = BehaviorSubject<Info>();
  StreamController _telephoneStreamController = BehaviorSubject<String>();
  StreamController _adressStreamController = BehaviorSubject<String>();
  StreamController _wifiPasswordStreamController = BehaviorSubject<String>();
  StreamController _isValidToUpdateStreamController = BehaviorSubject<void>();

  UpdateInfoUseCase _useCase;
  UpdateInfoViewModel(this._useCase);

  InfoObject _viewObject = new InfoObject(EMPTY,EMPTY,EMPTY);
  TextEditingController addressEditingController = TextEditingController();
  TextEditingController telephoneEditingController = TextEditingController();
  TextEditingController wifiPasswordEditingController = TextEditingController();

  @override
  void start() {
    _getInfo();
    addressEditingController.addListener(() { 
      setAddress(addressEditingController.text);
    });
    
    telephoneEditingController.addListener(() { 
      setTelephone(telephoneEditingController.text);
    });
    
    wifiPasswordEditingController.addListener(() { 
      setWifiPassword(wifiPasswordEditingController.text);
    });
  }

  _getInfo()async{
    inputState.add(LoadingState(stateRendererType: StateRendererType.FULL_SCREEN_LOADING_STATE));
    (await _useCase.getInfo()).fold(
      (failure) => inputState.add(ErrorState(StateRendererType.FULL_SCREEN_ERROR_STATE, failure.message)), 
      (info) {
        setAddress(info.address);
        setTelephone(info.telephone);
        setWifiPassword(info.wifiPassword);
        addressEditingController.text = info.address;
        telephoneEditingController.text = info.telephone;
        wifiPasswordEditingController.text = info.wifiPassword;
        inputInfo.add(info);
        inputState.add(ContentState());
      });
  }

  @override
  void dispose() {
    _adressStreamController.close();
    _infoStreamController.close();
    _telephoneStreamController.close();
    _wifiPasswordStreamController.close();
    super.dispose();
  }

  @override
  updateInfo(BuildContext context) async{
    inputState.add(LoadingState(stateRendererType: StateRendererType.POPUP_LOADING_STATE));
    (await _useCase.execute(UpdateInfoUseCaseInput(
      _viewObject.telephone, 
      _viewObject.address, 
      _viewObject.wifiPassword))).fold(
        (failure) => inputState.add(ErrorState(StateRendererType.POPUP_ERROR_STATE, failure.message)), 
        (info) {
          Navigator.of(context).pop();
          inputState.add(SuccessState(AppStrings.successUpdateInfo));
          inputInfo.add(info);
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
  Sink get inputInfo => _infoStreamController.sink;  
  
  @override
  Sink get inputTelephone => _telephoneStreamController.sink;
  
  @override
  Sink get inputWifiPassword => _wifiPasswordStreamController.sink;

  @override
  Sink get inputIsValidToUpdate => _isValidToUpdateStreamController.sink;
  
  @override
  Stream<String?> get outputErrorAddress => 
        outputIsAddressValid.map((isAdressValid) => isAdressValid?null:"Invalid Address");
  
  @override
  Stream<String?> get outputErrorTelephone => 
        outputIsTelephoneValid.map((isTelephoneValid) => isTelephoneValid?null:"Invalid Telephone");
  
  @override
  Stream<String?> get outputErrorWifiPassword => 
        outputIsWifiPasswordValid.map((isWifiPassword) => isWifiPassword?null:"Invalid Wifi password");
  
  @override
  Stream<Info> get outputInfo => _infoStreamController.stream.map((info) => info);
  
  @override
  Stream<bool> get outputIsAddressValid => _infoStreamController.stream.map((adress) => _isAdressValid(adress));
  
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
  Sink get inputInfo;
  Sink get inputAddress;
  Sink get inputTelephone;
  Sink get inputWifiPassword;
  Sink get inputIsValidToUpdate;
}


abstract class UpdateInfoViewModelOutput {
  Stream<Info> get outputInfo;
  Stream<bool> get outputIsAddressValid;
  Stream<String?> get outputErrorAddress;
  Stream<bool> get outputIsTelephoneValid;
  Stream<String?> get outputErrorTelephone;
  Stream<bool> get outputIsWifiPasswordValid;
  Stream<String?> get outputErrorWifiPassword;
  Stream<bool> get outputIsValidToUpdate;
}