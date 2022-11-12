import 'dart:async';
import 'package:cma_admin/app/constant.dart';
import 'package:cma_admin/app/enum.dart';
import 'package:cma_admin/app/hive_helper.dart';
import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/domain/usecase/add_user_usecase.dart';
import 'package:cma_admin/presentation/base/baseviewmodel.dart';
import 'package:cma_admin/presentation/common/freezed_data_classes.dart';
import 'package:cma_admin/presentation/common/state_renderer/state_render_impl.dart';
import 'package:cma_admin/presentation/common/state_renderer/state_renderer.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import '../../data/mapper/mapper.dart';
import '../resources/routes_manager.dart';

class AddUserViewModel extends BaseViewModel with AddUserViewModelInput, AddUserViewModelOutput {
  StreamController _rolesStreamController = BehaviorSubject<List<UserRole>>();
  StreamController _userNameStreamController = BehaviorSubject<String>();
  StreamController _selectedRoleStreamController = BehaviorSubject<UserRole>();
  StreamController _nameStreamController = BehaviorSubject<String>();
  StreamController _passwordStreamController = BehaviorSubject<String>();
  StreamController _profilePictureStreamController = BehaviorSubject<PickerFile?>();
  StreamController _isAllInputsValidStreamController = BehaviorSubject<void>();

  AddUserUseCase _addUserUseCase;
  var adduserViewObject = AddUserObject(null, EMPTY,EMPTY,EMPTY,EMPTY);
  AddUserViewModel(this._addUserUseCase);


  //  -- inputs
  @override
  void start() {
    inputState.add(ContentState());
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
  register(BuildContext context) async {
    inputState.add(LoadingState(stateRendererType: StateRendererType.POPUP_LOADING_STATE));
    (await _addUserUseCase.execute(AddUserUseCaseInput(
      adduserViewObject.image,
      adduserViewObject.name,
      adduserViewObject.password,
      adduserViewObject.role,
      adduserViewObject.username,
    ))).fold(
    (failure) => inputState.add(ErrorState(StateRendererType.POPUP_ERROR_STATE, failure.message)), 
    (data) {
      inputState.add(ContentState());
      Navigator.of(context).pop();
      Navigator.of(context).pushReplacementNamed(Routes.homeRoute);
    });
  }

  @override
  void dispose() {
    _rolesStreamController.close();
    _isAllInputsValidStreamController.close();
    _userNameStreamController.close();
    _selectedRoleStreamController.close();
    _nameStreamController.close();
    _passwordStreamController.close();
    _profilePictureStreamController.close();
    super.dispose();
  }

  @override
  setName(String name) {
    inputName.add(name);
    if (_isNameValid(name)) {
      adduserViewObject = adduserViewObject.copyWith(name: name);
    } else {
      adduserViewObject = adduserViewObject.copyWith(name: "");
    }
    _validate();
  }

  @override
  setRole(UserRole role) {
    inputSelectedRole.add(role);
    adduserViewObject = adduserViewObject.copyWith(role: role.toStr());
    _validate();
  }

  @override
  setPassword(String password) {
    inputPassword.add(password);
    if (_isPasswordValid(password)) {
      adduserViewObject = adduserViewObject.copyWith(password: password);
    } else {
      adduserViewObject = adduserViewObject.copyWith(password: "");
    }
    _validate();
  }

  @override
  setProfilePicture(PickerFile? file) {
    inputProfilePicture.add(file);
    adduserViewObject = adduserViewObject.copyWith(image: file);
    _validate();
  }

  @override
  setUserName(String userName) {
    inputUserName.add(userName);
    if (_isUserNameValid(userName)) {
      adduserViewObject = adduserViewObject.copyWith(username: userName);
    } else {
      adduserViewObject = adduserViewObject.copyWith(username: "");
    }
    _validate();
  }
 
  @override
  Sink get inputRoles => _rolesStreamController.sink; 

  @override
  Sink get inputName => _nameStreamController.sink;

  @override
  Sink get inputSelectedRole => _selectedRoleStreamController.sink;

  @override
  Sink get inputProfilePicture => _profilePictureStreamController.sink;

  @override
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  Sink get inputUserName => _userNameStreamController.sink;

  @override
  Sink get inputAllInputsValid => _isAllInputsValidStreamController.sink;

  // -- outputs
  
  @override
  Stream<List<UserRole>> get outputRoles => 
    _rolesStreamController.stream.map((roles) => roles);

  @override
  Stream<bool> get outputIsAllInputsValid =>
      _isAllInputsValidStreamController.stream.map((_) => _validateAllInputs());

  @override
  Stream<bool> get outputIsUserNameValid => _userNameStreamController.stream
      .map((userName) => _isUserNameValid(userName));

  @override
  Stream<String?> get outputErrorUserName => outputIsUserNameValid
      .map((isUserNameValid) => isUserNameValid ? null : "Invalid username");

  @override
  Stream<bool> get outputIsNameValid =>
      _nameStreamController.stream.map((name) => _isNameValid(name));

  @override
  Stream<String?> get outputErrorName => outputIsNameValid
      .map((isNameValid) => isNameValid ? null : "Invalid Name");

  @override
  Stream<bool> get outputIsPasswordValid => _passwordStreamController.stream
      .map((password) => _isPasswordValid(password));

  @override
  Stream<String?> get outputErrorPassword => outputIsPasswordValid
      .map((isPasswordValid) => isPasswordValid ? null : "Invalid Password");
  
  @override
  Stream<UserRole> get outputSelectedRole => 
    _selectedRoleStreamController.stream.map((selectedRole) => selectedRole);

  @override
  Stream<PickerFile?> get outputProfilePicture =>
      _profilePictureStreamController.stream.map((file) => file);

  // -- private methods
  bool _isUserNameValid(String userName) {
    return userName.length >= 6;
  }

  bool _isNameValid(String name) {
    return name.length > 6;
  }

  bool _isPasswordValid(String password) {
    return password.length >= 6;
  }

  bool _validateAllInputs() {
    return adduserViewObject.name.isNotEmpty &&
        adduserViewObject.password.isNotEmpty &&
        adduserViewObject.role.isNotEmpty &&
        adduserViewObject.username.isNotEmpty;
  }

  _validate() {
    inputAllInputsValid.add(null);
  }
  
}

abstract class AddUserViewModelInput {
  register(BuildContext context);

  setUserName(String userName);

  setRole(UserRole role);

  setName(String name);

  setPassword(String password);

  setProfilePicture(PickerFile file);
  
  Sink get inputRoles;

  Sink get inputUserName;

  Sink get inputSelectedRole;

  Sink get inputName;

  Sink get inputPassword;

  Sink get inputProfilePicture;

  Sink get inputAllInputsValid;
}

abstract class AddUserViewModelOutput {
  Stream<List<UserRole>> get outputRoles;

  Stream<bool> get outputIsUserNameValid;

  Stream<String?> get outputErrorUserName;

  Stream<bool> get outputIsNameValid;

  Stream<String?> get outputErrorName;

  Stream<bool> get outputIsPasswordValid;

  Stream<String?> get outputErrorPassword;

  Stream<UserRole> get outputSelectedRole;

  Stream<PickerFile?> get outputProfilePicture;

  Stream<bool> get outputIsAllInputsValid;
}
