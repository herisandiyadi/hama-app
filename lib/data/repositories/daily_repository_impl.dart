import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:hama_app/common/utils/exceptions.dart';
import 'package:hama_app/common/utils/failure.dart';
import 'package:hama_app/data/datasource/daily/daily_remote_data_source.dart';
import 'package:hama_app/data/models/daily/daily_model.dart';
import 'package:hama_app/domain/entities/daily/daily_entity.dart';
import 'package:hama_app/domain/entities/daily/daily_request.dart';
import 'package:hama_app/domain/repositories/daily_repository.dart';

class DailyRepositoryImpl implements DailyRepository {
  final DailyRemoteDataSource remoteDataSource;

  DailyRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure, DailyEntity>> addFormDaily(
      DailyRequest dailyRequest, String noOrder) async {
    try {
      final result = await remoteDataSource.addFormDaily(
          DailyModel.fromEntity(dailyRequest), noOrder);
      return Right(result.toEntity());
    } on MessageException catch (e) {
      return Left(MessageFailure(e.message));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
