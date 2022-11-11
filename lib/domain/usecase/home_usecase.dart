

import 'package:cma_admin/app/enum.dart';
import 'package:cma_admin/data/network/failure.dart';
import 'package:cma_admin/domain/repository/repository.dart';
import 'package:cma_admin/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

import '../model/model.dart';

class HomeUseCase extends BaseUseCase<String,int> {
  Repository _repository;
  HomeUseCase(this._repository);
  
  @override
  Future<Either<Failure, int>> execute(String input) {
    return _repository.getNumberOrdersByState(OrderStatus.PRE_CANCELED);
  }

  Future<Either<Failure,Info>> getInfo(){
    return _repository.getInfo();
  }
  
}