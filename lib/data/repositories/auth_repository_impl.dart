import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:hama_app/common/utils/exceptions.dart';
import 'package:hama_app/common/utils/failure.dart';
import 'package:hama_app/data/datasource/auth/auth_remote_data_source.dart';
import 'package:hama_app/data/models/login_model.dart';
import 'package:hama_app/domain/entities/login_entity.dart';
import 'package:hama_app/domain/entities/login_request.dart';
import 'package:hama_app/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure, LoginEntity>> login(LoginRequest loginRequest) async {
    try {
      final result =
          await remoteDataSource.login(LoginModel.fromEntity(loginRequest));
      return Right(result.toEntity());
    } on MessageException catch (e) {
      return Left(MessageFailure(e.message));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, String>> logout() async {
    try {
      final result = await remoteDataSource.logout();
      return Right(result);
    } on MessageException catch (e) {
      return Left(MessageFailure(e.message));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
