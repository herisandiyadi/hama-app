import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:hama_app/common/utils/exceptions.dart';
import 'package:hama_app/common/utils/failure.dart';
import 'package:hama_app/data/datasource/index/index_hama_remote_data_source.dart';
import 'package:hama_app/data/models/index/index_hama_model.dart';
import 'package:hama_app/domain/entities/index/index_hama_entity.dart';
import 'package:hama_app/domain/entities/index/index_hama_request.dart';
import 'package:hama_app/domain/entities/index/list_index_hama_entity.dart';
import 'package:hama_app/domain/repositories/index_hama_repository.dart';

class IndexhamaRepositoryImpl implements IndexHamaRepository {
  final IndexHamaRemoteDataSource remoteDataSource;

  IndexhamaRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure, IndexHamaEntity>> addFormIndexHama(
      IndexHamaRequest indexHamaRequest, String noOrder) async {
    try {
      final result = await remoteDataSource.addFormIndexHama(
          noOrder, IndexHamaModel.fromEntity(indexHamaRequest));
      return Right(result.toEntity());
    } on MessageException catch (e) {
      return Left(MessageFailure(e.message));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, ListIndexHamaEntity>> getAllIndexHama(
      String noOrder) async {
    try {
      final result = await remoteDataSource.getAllIndexHama(noOrder);
      return Right(result.toEntity());
    } on MessageException catch (e) {
      return Left(MessageFailure(e.message));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, ListIndexHamaEntity>> getAllIndexHamaByDate(
      String noOrder, String tanggal) async {
    try {
      final result =
          await remoteDataSource.getAllIndexHamaByDate(noOrder, tanggal);
      return Right(result.toEntity());
    } on MessageException catch (e) {
      return Left(MessageFailure(e.message));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, ListIndexHamaEntity>> getAllIndexHamaByMonth(
      String noOrder, String year, String month) async {
    try {
      final result =
          await remoteDataSource.getAllIndexHamaByMonth(noOrder, year, month);
      return Right(result.toEntity());
    } on MessageException catch (e) {
      return Left(MessageFailure(e.message));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
