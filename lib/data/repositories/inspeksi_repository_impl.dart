import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:hama_app/common/utils/exceptions.dart';
import 'package:hama_app/common/utils/failure.dart';
import 'package:hama_app/data/datasource/inspeksi/inspeksi_remote_data_source.dart';
import 'package:hama_app/data/models/inspeksi/inspeksi_model.dart';
import 'package:hama_app/domain/entities/daily/generate_pdf_entity.dart';
import 'package:hama_app/domain/entities/inspeksi/inspeksi_entity.dart';
import 'package:hama_app/domain/entities/inspeksi/inspeksi_request.dart';
import 'package:hama_app/domain/entities/inspeksi/list_inspeksi_entity.dart';
import 'package:hama_app/domain/repositories/inspeksi_repository.dart';

class InspeksiRepositoryImpl implements InspeksiRepository {
  final InspeksiRemoteDataSource remoteDataSource;

  InspeksiRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure, InspeksiEntity>> addFormInspeksi(
      InspeksiRequest inspeksiRequest, String noOrder) async {
    try {
      final result = await remoteDataSource.addFormInspeksi(
          InspeksiModel.fromEntity(inspeksiRequest), noOrder);
      return Right(result.toEntity());
    } on MessageException catch (e) {
      return Left(MessageFailure(e.message));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, ListInspeksiEntity>> getAllInspeksi(
      String noOrder) async {
    try {
      final result = await remoteDataSource.getAllInspeksi(noOrder);
      return Right(result.toEntity());
    } on MessageException catch (e) {
      return Left(MessageFailure(e.message));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, ListInspeksiEntity>> getAllInspeksiByDate(
      String noOrder, String date) async {
    try {
      final result = await remoteDataSource.getAllInspeksiByDate(noOrder, date);
      return Right(result.toEntity());
    } on MessageException catch (e) {
      return Left(MessageFailure(e.message));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, ListInspeksiEntity>> getAllInspeksiByMonth(
      String noOrder, String year, String month) async {
    try {
      final result =
          await remoteDataSource.getAllInspeksiByMonth(noOrder, year, month);
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
