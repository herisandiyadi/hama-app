import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:hama_app/common/utils/exceptions.dart';
import 'package:hama_app/common/utils/failure.dart';
import 'package:hama_app/data/datasource/order/order_remote_data_source.dart';
import 'package:hama_app/domain/entities/order/list_order_entity.dart';
import 'package:hama_app/domain/entities/order/order_entity.dart';
import 'package:hama_app/domain/repositories/order_repository.dart';

class OrderRepositoryImpl implements OrderRepository {
  final OrderRemoteDataSource remoteDataSource;
  const OrderRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, ListOrderEntity>> getDataOrder() async {
    try {
      final result = await remoteDataSource.getAllOrder();

      return Right(result.toEntity());
    } on MessageException catch (e) {
      return Left(MessageFailure(e.message));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, OrderEntity>> createOrder(
      String noOrder, String clientName) async {
    try {
      final result = await remoteDataSource.createOrder(noOrder, clientName);
      return Right(result.toEntity());
    } on MessageException catch (e) {
      return Left(MessageFailure(e.message));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
