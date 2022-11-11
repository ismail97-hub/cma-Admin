
import 'package:cma_admin/data/network/failure.dart';
import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/domain/repository/repository.dart';
import 'package:cma_admin/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class InfoSettingsUseCase extends BaseUseCase<InfoSettingsUseCaseInput,Info>{
  Repository _repository;
  InfoSettingsUseCase(this._repository);

  @override
  Future<Either<Failure, Info>> execute(InfoSettingsUseCaseInput input) {
    return _repository.updateInfo(input.telephone, input.address, input.wifiPassword);
  }
      
}

class InfoSettingsUseCaseInput {
  String telephone;  
  String address;
  String wifiPassword;

  InfoSettingsUseCaseInput(
    this.telephone,
    this.address,
    this.wifiPassword,
  );
}