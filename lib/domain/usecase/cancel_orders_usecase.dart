
import 'package:cma_admin/app/enum.dart';
import 'package:cma_admin/data/network/failure.dart';
import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

import 'base_usecase.dart';

class CancelOrdersUseCase extends BaseUseCase<String,List<OrderModel>> {

  Repository _repository;
  CancelOrdersUseCase(
    this._repository,
  );

  @override
  Future<Either<Failure, List<OrderModel>>> execute(String input) {
    return _repository.getOrdersByState(OrderStatus.PRE_CANCELED);
  }

  Future<Either<Failure,void>> acceptCancelOrder(int id) {
    return _repository.acceptCancelOrder(id.toString());
  }

  Future<Either<Failure,void>> rejectCancelOrder(int id) {
    return _repository.rejectCancelOrder(id.toString());
  }

  
}
