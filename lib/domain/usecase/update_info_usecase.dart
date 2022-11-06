
import 'package:cma_admin/data/network/failure.dart';
import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/domain/repository/repository.dart';
import 'package:cma_admin/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class UpdateInfoUseCase extends BaseUseCase<UpdateInfoUseCaseInput,Info>{
  Repository _repository;
  UpdateInfoUseCase(this._repository);

  @override
  Future<Either<Failure, Info>> execute(UpdateInfoUseCaseInput input) {
    return _repository.updateInfo(input.telephone, input.address, input.wifiPassword);
  }

  Future<Either<Failure,Info>> getInfo(){
    return _repository.getInfo();
  }
  
  
}

class UpdateInfoUseCaseInput {
  String telephone;  
  String address;
  String wifiPassword;

  UpdateInfoUseCaseInput(
    this.telephone,
    this.address,
    this.wifiPassword,
  );
}