import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:hama_app/common/utils/exceptions.dart';
import 'package:hama_app/common/utils/failure.dart';
import 'package:hama_app/data/datasource/daily/daily_remote_data_source.dart';
import 'package:hama_app/data/models/daily/daily_model.dart';
import 'package:hama_app/domain/entities/daily/daily_request.dart';
import 'package:hama_app/domain/entities/daily/generate_pdf_entity.dart';
import 'package:hama_app/domain/entities/daily/list_daily_entity.dart';
import 'package:hama_app/domain/repositories/daily_repository.dart';

class DailyRepositoryImpl implements DailyRepository {
  final DailyRemoteDataSource remoteDataSource;

  DailyRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure, String>> addFormDaily(
      DailyRequest dailyRequest, String noOrder) async {
    try {
      final result = await remoteDataSource.addFormDaily(
          DailyModel.fromEntity(dailyRequest), noOrder);
      return Right(result);
    } on MessageException catch (e) {
      return Left(MessageFailure(e.message));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, ListDailyEntity>> getAllDaily(String noOrder) async {
    try {
      final result = await remoteDataSource.getAllDaily(noOrder);
      return Right(result.toEntity());
    } on MessageException catch (e) {
      return Left(MessageFailure(e.message));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, ListDailyEntity>> getAllDailyByDate(
      String noOrder, String tanggal) async {
    try {
      final result = await remoteDataSource.getAllDailyByDate(noOrder, tanggal);
      return Right(result.toEntity());
    } on MessageException catch (e) {
      return Left(MessageFailure(e.message));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, ListDailyEntity>> getAllDailyByMonth(
      String noOrder, String year, String month) async {
    try {
      final result =
          await remoteDataSource.getAllDailyByMonth(noOrder, year, month);
      return Right(result.toEntity());
    } on MessageException catch (e) {
      return Left(MessageFailure(e.message));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, GeneratePDFEntity>> getDownloadPDFMonthly(
      String noOrder, String year, String month) async {
    try {
      final result =
          await remoteDataSource.generatePDFMonthly(noOrder, year, month);
      return Right(result.toEntity());
    } on MessageException catch (e) {
      return Left(MessageFailure(e.message));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
