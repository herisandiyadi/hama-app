import 'package:dartz/dartz.dart';
import 'package:hama_app/common/utils/failure.dart';
import 'package:hama_app/domain/entities/order/list_order_entity.dart';
import 'package:hama_app/domain/repositories/order_repository.dart';

class GetAllDataOrder {
  final OrderRepository repository;

  GetAllDataOrder(this.repository);

  Future<Either<Failure, ListOrderEntity>> execute() {
    final response = repository.getDataOrder();
    return response;
  }
}
