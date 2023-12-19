import 'package:dartz/dartz.dart';
import 'package:hama_app/common/utils/failure.dart';
import 'package:hama_app/domain/entities/order/order_entity.dart';
import 'package:hama_app/domain/repositories/order_repository.dart';

class GetCreateOrder {
  final OrderRepository repository;

  GetCreateOrder(this.repository);

  Future<Either<Failure, OrderEntity>> execute(
      String noOrder, String clientName) {
    final response = repository.createOrder(
      noOrder,
      clientName,
    );
    return response;
  }
}
