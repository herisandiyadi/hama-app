import 'dart:io';
import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:hama_app/common/utils/exceptions.dart';
import 'package:hama_app/common/utils/failure.dart';
import 'package:hama_app/data/datasource/signature/signature_local_data_source.dart';
import 'package:hama_app/domain/entities/signature/signature_entity.dart';
import 'package:hama_app/domain/repositories/signature_repository.dart';

class SignatureRepositoryImpl implements SignatureRepository {
  final SignatureLocalDataSource localDataSource;

  SignatureRepositoryImpl({required this.localDataSource});
  @override
  Future<Either<Failure, String>> clearSignature() async {
    try {
      final result = await localDataSource.clearSignature();
      return Right(result);
    } on MessageException catch (e) {
      return Left(MessageFailure(e.message));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, String>> deleteSignature(int id) async {
    try {
      final result = await localDataSource.deleteSignature(id);
      return Right(result);
    } on MessageException catch (e) {
      return Left(MessageFailure(e.message));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, String>> saveSignature(Uint8List image) async {
    try {
      final result = await localDataSource.saveSignature(image);
      return Right(result);
    } on MessageException catch (e) {
      return Left(MessageFailure(e.message));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, List<SignatureEntity>>> selectSignature(int id) async {
    try {
      final result = await localDataSource.selectSignature(id);
      return Right(result.map((e) => e.toEntity()).toList());
    } on MessageException catch (e) {
      return Left(MessageFailure(e.message));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, List<SignatureEntity>>> getAllSignature() async {
    try {
      final result = await localDataSource.getAllSignature();
      return Right(result.map((e) => e.toEntity()).toList());
    } on MessageException catch (e) {
      return Left(MessageFailure(e.message));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
