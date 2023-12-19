import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:hama_app/common/utils/exceptions.dart';
import 'package:hama_app/common/utils/failure.dart';
import 'package:hama_app/data/datasource/peralatan/peralatan_remote_data_source.dart';
import 'package:hama_app/data/models/peralatan/peralatan_model.dart';
import 'package:hama_app/domain/entities/peralatan/list_peralatan_entity.dart';
import 'package:hama_app/domain/entities/peralatan/peralatan_entity.dart';
import 'package:hama_app/domain/entities/peralatan/peralatan_request.dart';
import 'package:hama_app/domain/repositories/peralatan_repository.dart';

class PeralatanRepositoryImpl implements PeralatanRepository {
  final PeralatanRemoteDataSource remoteDataSource;

  PeralatanRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure, PeralatanEntity>> addPeralatan(
      PeralatanRequest peralatanRequest) async {
    try {
      final result = await remoteDataSource
          .addPeralatan(PeralatanModel.fromEntity(peralatanRequest));
      return Right(result.toEntity());
    } on MessageException catch (e) {
      return Left(MessageFailure(e.message));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, ListPeralatanEntity>> getAllPeralatan(
      String noOrder) async {
    try {
      final result = await remoteDataSource.getAllPeralatan(noOrder);
      return Right(result.toEntity());
    } on MessageException catch (e) {
      return Left(MessageFailure(e.message));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, ListPeralatanEntity>> getAllPeralatanByDate(
      String noOrder, String date) async {
    try {
      final result =
          await remoteDataSource.getAllPeralatanByDate(noOrder, date);
      return Right(result.toEntity());
    } on MessageException catch (e) {
      return Left(MessageFailure(e.message));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, ListPeralatanEntity>> getAllPeralatanByMonth(
      String noOrder, String year, String month) async {
    try {
      final result =
          await remoteDataSource.getAllPeralatanByMonth(noOrder, year, month);
      return Right(result.toEntity());
    } on MessageException catch (e) {
      return Left(MessageFailure(e.message));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
