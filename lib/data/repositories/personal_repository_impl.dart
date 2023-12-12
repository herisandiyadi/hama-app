import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:hama_app/common/utils/exceptions.dart';
import 'package:hama_app/common/utils/failure.dart';
import 'package:hama_app/data/datasource/personal/personal_remote_data_source.dart';
import 'package:hama_app/data/models/personal/absen_model.dart';
import 'package:hama_app/domain/entities/personal/absen_entity.dart';
import 'package:hama_app/domain/entities/personal/absen_request.dart';
import 'package:hama_app/domain/entities/personal/data_absen_entity.dart';
import 'package:hama_app/domain/entities/personal/personal_entity.dart';
import 'package:hama_app/domain/repositories/personal_repository.dart';

class PersonalRepositoryImpl implements PersonalRepository {
  final PersonalRemoteDataSource remoteDataSource;

  PersonalRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure, PersonalEntity>> addPersonal(
      String noOrder, String name) async {
    try {
      final result = await remoteDataSource.addPersonal(noOrder, name);
      return Right(result.toEntity());
    } on MessageException catch (e) {
      return Left(MessageFailure(e.message));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, AbsenEntity>> addAbsen(
      AbsenRequest absenRequest) async {
    try {
      final result =
          await remoteDataSource.addAbsen(AbsenModel.fromEntity(absenRequest));
      return Right(result.toEntity());
    } on MessageException catch (e) {
      return Left(MessageFailure(e.message));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, String>> deletePersonal(
      String noOrder, String id) async {
    try {
      final result = await remoteDataSource.deletePersonal(noOrder, id);
      return Right(result);
    } on MessageException catch (e) {
      return Left(MessageFailure(e.message));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, DataAbsenEntity>> getAbsenByDate(
      String noOrder, String date) async {
    try {
      final result = await remoteDataSource.getAbsenByDate(noOrder, date);
      return Right(result.toEntity());
    } on MessageException catch (e) {
      return Left(MessageFailure(e.message));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, DataAbsenEntity>> getAbsenById(
      String noOrder, String id) async {
    try {
      final result = await remoteDataSource.getAbsenById(noOrder, id);
      return Right(result.toEntity());
    } on MessageException catch (e) {
      return Left(MessageFailure(e.message));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, ListPersonelEntity>> getAllPersonal(
      String noOrder) async {
    try {
      final result = await remoteDataSource.getAllPersonal(noOrder);
      return Right(result.toEntity());
    } on MessageException catch (e) {
      return Left(MessageFailure(e.message));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, String>> updatePersonal(
      String noOrder, String id, String name) async {
    try {
      final result = await remoteDataSource.updatePersonal(noOrder, id, name);
      return Right(result);
    } on MessageException catch (e) {
      return Left(MessageFailure(e.message));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
