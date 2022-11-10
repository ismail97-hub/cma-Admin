
import 'package:cma_admin/data/request/request.dart';
import 'package:dartz/dartz.dart';

import 'package:cma_admin/app/enum.dart';
import 'package:cma_admin/data/network/failure.dart';
import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/domain/repository/repository.dart';
import 'package:cma_admin/domain/usecase/base_usecase.dart';

class AccountSettingsUseCase extends BaseUseCase<AccountSettingsUseCaseInput,User>{
  Repository _repository;
  AccountSettingsUseCase(this._repository);

  @override
  Future<Either<Failure, User>> execute(AccountSettingsUseCaseInput input) {
    return _repository.updateMyAccount(UpdateMyAccountRequest(
      input.image,input.oldPassword,input.newPassword,input.name,input.role.toStr(),input.username, ));
  }
  
}

class AccountSettingsUseCaseInput {
  PickerFile? image;
  String? oldPassword;
  String? newPassword;
  String name;
  String username;
  UserRole role;
  
  AccountSettingsUseCaseInput(
    this.image,
    this.oldPassword,
    this.newPassword,
    this.name,
    this.username,
    this.role,
  );
}
