
import 'dart:async';

import 'package:cma_admin/app/app_prefs.dart';
import 'package:cma_admin/app/enum.dart';
import 'package:cma_admin/data/mapper/mapper.dart';
import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/domain/usecase/update_user_usecase.dart';
import 'package:cma_admin/presentation/base/baseviewmodel.dart';
import 'package:cma_admin/presentation/common/freezed_data_classes.dart';
import 'package:cma_admin/presentation/common/state_renderer/state_render_impl.dart';
import 'package:cma_admin/presentation/common/state_renderer/state_renderer.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

class UpdateUserViewModel extends BaseViewModel with UpdateUserViewModelInput,UpdateUserViewModelOutput{
  StreamController _rolesStreamController = BehaviorSubject<List<UserRole>>();
  StreamController _nameStreamController = BehaviorSubject<String>();
  StreamController _usernameStreamController = BehaviorSubject<String>();
  StreamController _selectedRoleStreamController = BehaviorSubject<UserRole>();
  StreamController _imageStreamController = BehaviorSubject<PickerFile>();
  StreamController _isValidToUpdateStreamController = BehaviorSubject<void>(); 
  UpdateUserUseCase _useCase;
  AppPreferences _appPreferences;
  UpdateUserViewModel(this._useCase,this._appPreferences);
  UpdateUserObject _viewObject = new UpdateUserObject(null, EMPTY, UserRole.WAITER, EMPTY);

  @override
  void start() {
    inputState.add(ContentState());
    _getRoles();
  }

  init(User user){
    setName(user.name);
    setRole(user.role.toUserRoleEnum());
    setUsername(user.userName);
  }
   
  _getRoles()async{
    String role = await _appPreferences.getUserRole();
    UserRole currentUserRole = role.toUserRoleEnum();
    if (currentUserRole==UserRole.OWNER) {
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
    _isValidToUpdateStreamController.close();
    super.dispose();
  }

  @override
  updateUser(BuildContext context, int id)async {
    inputState.add(LoadingState(stateRendererType: StateRendererType.POPUP_LOADING_STATE));
    (await _useCase.execute(UpdateUserUseCaseInput(
             id, _viewObject.image, _viewObject.name, _viewObject.role, _viewObject.username))).fold(
      (failure) => inputState.add(ErrorState(StateRendererType.POPUP_ERROR_STATE, failure.message)), 
      (succes){
        inputState.add(ContentState());
        Navigator.of(context).pop();
        Navigator.of(context).pop();
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
  Stream<String?> get outputErrorName => outputIsNameValid.map((isNameValid) => isNameValid?null:"Invalid Name");
  
  @override
  Stream<String?> get outputErrorUsername => outputIsUsernameValid.map((isUsernameValid) => isUsernameValid?null:"Invalid Username");
  
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

  bool _isValidToUpdate(){
    return _viewObject.username.isNotEmpty && 
           _viewObject.name.isNotEmpty; 
  } 

  _validate(){
    inputIsValidToUpdate.add(null);
  }
  
  
}

abstract class UpdateUserViewModelInput{
  updateUser(BuildContext context,int id);
  setName(String name);
  setUsername(String username);
  setImage(PickerFile? image);
  setRole(UserRole role);
  Sink get inputRoles;
  Sink get inputName;
  Sink get inputUsername;
  Sink get inputImage;
  Sink get inputSelectedRole;
  Sink get inputIsValidToUpdate;
}

abstract class UpdateUserViewModelOutput{
  Stream<List<UserRole>> get outputRoles;
  Stream<bool> get outputIsNameValid;
  Stream<String?> get outputErrorName;
  Stream<bool> get outputIsUsernameValid;
  Stream<String?> get outputErrorUsername;
  Stream<PickerFile?> get outputImage;
  Stream<UserRole> get outputSelectedRole;
  Stream<bool> get outputIsValidToUpdate;
}