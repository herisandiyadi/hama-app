import 'package:dartz/dartz.dart';
import 'package:hama_app/common/utils/failure.dart';
import 'package:hama_app/domain/entities/daily/daily_entity.dart';
import 'package:hama_app/domain/entities/daily/daily_request.dart';

abstract class DailyRepository {
  Future<Either<Failure, DailyEntity>> addFormDaily(
      DailyRequest dailyRequest, String noOrder);
}
