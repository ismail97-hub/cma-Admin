

import 'package:cma_admin/app/enum.dart';
import 'package:cma_admin/data/network/failure.dart';
import 'package:cma_admin/data/request/request.dart';
import 'package:cma_admin/domain/repository/repository.dart';
import 'package:cma_admin/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

import '../model/model.dart';

class UpdateUserUseCase extends BaseUseCase<UpdateUserUseCaseInput,User> {
  Repository _repository;
  UpdateUserUseCase(this._repository);

  @override
  Future<Either<Failure, User>> execute(UpdateUserUseCaseInput input) {
    return _repository.updateUser(UpdateUserRequest(input.id.toString(), input.image, input.name, input.role.toStr(), input.username));
  }
  
}

class UpdateUserUseCaseInput {
  int id;
  PickerFile? image;
  String name;
  UserRole role;
  String username;

  UpdateUserUseCaseInput(this.id, this.image, this.name,this.role, this.username);
}