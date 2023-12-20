import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:hama_app/common/utils/exceptions.dart';
import 'package:hama_app/common/utils/failure.dart';
import 'package:hama_app/data/datasource/pemakaian/pemakaian_remote_data_source.dart';
import 'package:hama_app/data/models/pemakaian/pemakaian_model.dart';
import 'package:hama_app/domain/entities/pemakaian/list_pemakaian_entity.dart';
import 'package:hama_app/domain/entities/pemakaian/pemakaian_entity.dart';
import 'package:hama_app/domain/entities/pemakaian/pemakaian_request.dart';
import 'package:hama_app/domain/repositories/pemakaian_repository.dart';

class PemakaianRepositoryImpl implements PemakaianRepository {
  final PemakaianRemoteDataSource remoteDataSource;

  PemakaianRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure, PemakaianEntity>> addPemakaian(
      PemakaianRequest pemakaianRequest) async {
    try {
      final result = await remoteDataSource
          .addPemakaian(PemakaianModel.fromEntity(pemakaianRequest));
      return Right(result.toEntity());
    } on MessageException catch (e) {
      return Left(MessageFailure(e.message));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, ListPemakaianEntity>> getAllPeralatan(
      String noOrder) async {
    try {
      final result = await remoteDataSource.getAllPemakaian(noOrder);
      return Right(result.toEntity());
    } on MessageException catch (e) {
      return Left(MessageFailure(e.message));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, ListPemakaianEntity>> getAllPeralatanByDate(
      String noOrder, String date) async {
    try {
      final result =
          await remoteDataSource.getAllPemakaianByDate(noOrder, date);
      return Right(result.toEntity());
    } on MessageException catch (e) {
      return Left(MessageFailure(e.message));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, ListPemakaianEntity>> getAllPeralatanByMonth(
      String noOrder, String year, String month) async {
    try {
      final result =
          await remoteDataSource.getAllPemakaianByMonth(noOrder, year, month);
      return Right(result.toEntity());
    } on MessageException catch (e) {
      return Left(MessageFailure(e.message));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
