import 'package:dartz/dartz.dart';
import 'package:hama_app/common/utils/failure.dart';
import 'package:hama_app/domain/entities/order/list_order_entity.dart';
import 'package:hama_app/domain/entities/order/order_entity.dart';

abstract class OrderRepository {
  Future<Either<Failure, ListOrderEntity>> getDataOrder();
  Future<Either<Failure, OrderEntity>> createOrder(String noOrder);
}
