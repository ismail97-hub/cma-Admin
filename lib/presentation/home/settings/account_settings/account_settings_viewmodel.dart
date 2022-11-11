
import 'dart:async';
import 'package:cma_admin/app/app_prefs.dart';
import 'package:cma_admin/app/enum.dart';
import 'package:cma_admin/app/functions.dart';
import 'package:cma_admin/app/hive_helper.dart';
import 'package:cma_admin/data/mapper/mapper.dart';
import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/presentation/base/baseviewmodel.dart';
import 'package:cma_admin/presentation/common/freezed_data_classes.dart';
import 'package:cma_admin/presentation/common/state_renderer/state_render_impl.dart';
import 'package:cma_admin/presentation/common/state_renderer/state_renderer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../app/di.dart';
import '../../../../domain/usecase/account_settings_usecase.dart';
import '../../../resources/routes_manager.dart';

class AccountSettingsViewModel extends BaseViewModel with AccountSettingsViewModelInput,AccountSettingsViewModelOutput{
  StreamController _rolesStreamController = BehaviorSubject<List<UserRole>>();
  StreamController _nameStreamController = BehaviorSubject<String>();
  StreamController _usernameStreamController = BehaviorSubject<String>();
  StreamController _selectedRoleStreamController = BehaviorSubject<UserRole>();
  StreamController _imageStreamController = BehaviorSubject<PickerFile>();
  StreamController _oldPasswordStreamController = BehaviorSubject<String>();
  StreamController _newPasswordStreamController = BehaviorSubject<String>();
  StreamController _confirmationNewPasswordStreamController = BehaviorSubject<String>();
  StreamController _isValidToUpdateStreamController = BehaviorSubject<void>(); 
  AccountSettingsUseCase _useCase;
  AppPreferences _appPreferences;
  AccountSettingsViewModel(this._useCase,this._appPreferences);
  AccountSettingsViewObject _viewObject = new AccountSettingsViewObject(null, EMPTY, UserRole.WAITER,EMPTY,EMPTY,EMPTY,EMPTY);

  @override
  void start() {
    inputState.add(ContentState());
    User user = HiveHelper.getCurrentUser();
    setName(user.name);
    setUsername(user.userName);
    setRole(user.role.toUserRoleEnum());
    _getRoles();
  }

   
  _getRoles()async{
    if (HiveHelper.getCurrentUser().role.toUserRoleEnum()==UserRole.OWNER) {
      inputRoles.add(UserRole.values);
    } else {
      inputRoles.add([UserRole.WAITER,UserRole.BARMAN]);
    }
  }

  @override
  void dispose() {
    _rolesStreamController.close();
    _selectedRoleStreamController.close();
    _imageStreamController.close();
    _nameStreamController.close();
    _usernameStreamController.close();
    _oldPasswordStreamController.close();
    _newPasswordStreamController.close();
    _confirmationNewPasswordStreamController.close();
    _isValidToUpdateStreamController.close();
    super.dispose();
  }

  @override
  updateMyAccount(BuildContext context,)async {
    inputState.add(LoadingState(stateRendererType: StateRendererType.POPUP_LOADING_STATE));
    (await _useCase.execute(AccountSettingsUseCaseInput(
      _viewObject.image,
      _viewObject.oldPassword,
      _viewObject.newPassword,
      _viewObject.name,
      _viewObject.username,
      _viewObject.role
    ))).fold(
      (failure) => inputState.add(ErrorState(StateRendererType.POPUP_ERROR_STATE, failure.message)), 
      (user)async{
        inputState.add(ContentState());
        logout(context, _appPreferences);
      });
  }
  
  @override
  setImage(PickerFile? image) {
    inputImage.add(image);
    _viewObject = _viewObject.copyWith(image: image);
    _validate();
  }
  
  @override
  setName(String name) {
    inputName.add(name);
    if (_isNameValid(name)) {
      _viewObject = _viewObject.copyWith(name: name);
    } else {
      _viewObject = _viewObject.copyWith(name: EMPTY);
    }
    _validate();
  }

  @override
  setOldPassword(String oldPassword) {
    inputOldPassword.add(oldPassword);
    if (_isOldPasswordValid(oldPassword)) {
      _viewObject = _viewObject.copyWith(oldPassword: oldPassword);
    } else {
      _viewObject = _viewObject.copyWith(oldPassword: EMPTY);
    }
    _validate();
  }

  @override
  setNewPassword(String newPassword) {
    inputNewPassword.add(newPassword);
    if (_isNewPasswordValid(newPassword)) {
      _viewObject = _viewObject.copyWith(newPassword: newPassword);
    } else {
      _viewObject = _viewObject.copyWith(newPassword: EMPTY);
    }
    _validate();
  }

  @override
  setConfirmationPassword(String confirmationPassword) {
    inputConfirmationNewPassword.add(confirmationPassword);
    if (_isConfirmationPasswordValid(confirmationPassword)) {
      _viewObject = _viewObject.copyWith(confirmationNewPassword: confirmationPassword);
    } else {
      _viewObject = _viewObject.copyWith(confirmationNewPassword: EMPTY);
    }
    _validate();
  }
  
  @override
  setRole(UserRole role) {
    inputSelectedRole.add(role);
    _viewObject = _viewObject.copyWith(role: role);
    _validate();
  }
  
  @override
  setUsername(String username) {
    inputUsername.add(username);
    if (_isUsernameValid(username)) {
      _viewObject = _viewObject.copyWith(username: username);
    } else {
      _viewObject = _viewObject.copyWith(username: EMPTY);
    }
    _validate();
  }
  
  @override
  Sink get inputRoles => _rolesStreamController.sink;

  @override
  Sink get inputImage => _imageStreamController.sink;
  
  @override
  Sink get inputName => _nameStreamController.sink;

  @override
  Sink get inputOldPassword => _oldPasswordStreamController.sink;
  
  @override
  Sink get inputNewPassword => _newPasswordStreamController.sink;
  
  @override
  Sink get inputConfirmationNewPassword => _confirmationNewPasswordStreamController.sink;

  @override
  Sink get inputSelectedRole => _selectedRoleStreamController.sink;
  
  @override
  Sink get inputUsername => _usernameStreamController.sink;

  @override
  Sink get inputIsValidToUpdate => _isValidToUpdateStreamController.sink;
  
  //output
  
  @override
  Stream<List<UserRole>> get outputRoles => _rolesStreamController.stream.map((roles) => roles);

  @override
  Stream<bool> get outputIsNameValid => _nameStreamController.stream.map((name) => _isNameValid(name));
  
  @override
  Stream<bool> get outputIsUsernameValid => _usernameStreamController.stream.map((username) => _isUsernameValid(username));
  
  @override
  Stream<bool> get outputIsOldPasswrdValid => 
    _oldPasswordStreamController.stream.map((oldPassword) => _isOldPasswordValid(oldPassword));

  @override
  Stream<bool> get outputIsNewPasswordValid => 
    _newPasswordStreamController.stream.map((newPassword) => _isNewPasswordValid(newPassword));

  @override
  Stream<bool> get outputIsConfirmatioNewPasswordValid => 
    _confirmationNewPasswordStreamController.stream.map((confirmationPassword) => _isConfirmationPasswordValid(confirmationPassword));

  @override
  Stream<String?> get outputErrorName => outputIsNameValid.map((isNameValid) => isNameValid?null:"Invalid Name");
  
  @override
  Stream<String?> get outputErrorUsername => outputIsUsernameValid.map((isUsernameValid) => isUsernameValid?null:"Invalid Username");
  
  @override
  Stream<String?> get outputErrorOldPasswrd => 
    outputIsOldPasswrdValid.map((isOldPasswordValid) => isOldPasswordValid?null:"Invalid old password");
  
  @override
  Stream<String?> get outputErrorNewPassword => 
    outputIsNewPasswordValid.map((isNewPasswordValid) => isNewPasswordValid?null:"Invalid new password");
  
  @override
  Stream<String?> get outputErrorConfirmatioNewPassword => 
    outputIsConfirmatioNewPasswordValid.map((isConfirmatioNewPassword) => isConfirmatioNewPassword?null:"Passwords are not same");

  @override
  Stream<PickerFile?> get outputImage => _imageStreamController.stream.map((image) => image);
  
  @override
  Stream<UserRole> get outputSelectedRole => _selectedRoleStreamController.stream.map((selectedRole) => selectedRole);

  @override
  Stream<bool> get outputIsValidToUpdate => _isValidToUpdateStreamController.stream.map((_) => _isValidToUpdate());
  

  // private functions

  bool _isNameValid(String name){
    return name.length>6;
  } 
  bool _isUsernameValid(String username){
    return username.length>=6; 
  }

  bool _isOldPasswordValid(String oldPassword){
    return oldPassword.length>0;
  }

  bool _isNewPasswordValid(String newPassword){
    return newPassword.length>6;
  }

  bool _isConfirmationPasswordValid(String confirmationPassword){
    return _viewObject.newPassword==confirmationPassword;
  }

  bool _isValidToUpdate(){
    if (_viewObject.name.isNotEmpty&&_viewObject.username.isNotEmpty) {
      if (_viewObject.confirmationNewPassword!.isNotEmpty&&_viewObject.oldPassword!.isNotEmpty) {
        return true;
      }
      else if(_viewObject.confirmationNewPassword!.isEmpty&&_viewObject.oldPassword!.isEmpty){
        return true;
      }  
      return false;
    }
    return false;
  } 

  _validate(){
    inputIsValidToUpdate.add(null);
  }
  
  
}

abstract class AccountSettingsViewModelInput{
  updateMyAccount(BuildContext context,);
  setName(String name);
  setUsername(String username);
  setOldPassword(String oldPassword);
  setNewPassword(String newPassword);
  setConfirmationPassword(String confirmationPassword);
  setImage(PickerFile? image);
  setRole(UserRole role);
  Sink get inputRoles;
  Sink get inputName;
  Sink get inputUsername;
  Sink get inputOldPassword;
  Sink get inputNewPassword;
  Sink get inputConfirmationNewPassword;
  Sink get inputImage;
  Sink get inputSelectedRole;
  Sink get inputIsValidToUpdate;
}

abstract class AccountSettingsViewModelOutput{
  Stream<List<UserRole>> get outputRoles;
  Stream<bool> get outputIsNameValid;
  Stream<String?> get outputErrorName;
  Stream<bool> get outputIsUsernameValid;
  Stream<String?> get outputErrorUsername;
  Stream<bool> get outputIsOldPasswrdValid;
  Stream<String?> get outputErrorOldPasswrd;
  Stream<bool> get outputIsNewPasswordValid;
  Stream<String?> get outputErrorNewPassword;
  Stream<bool> get outputIsConfirmatioNewPasswordValid;
  Stream<String?> get outputErrorConfirmatioNewPassword;
  Stream<PickerFile?> get outputImage;
  Stream<UserRole> get outputSelectedRole;
  Stream<bool> get outputIsValidToUpdate;
}