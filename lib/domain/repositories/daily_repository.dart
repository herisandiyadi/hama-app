import 'package:dartz/dartz.dart';
import 'package:hama_app/common/utils/failure.dart';
import 'package:hama_app/domain/entities/daily/daily_entity.dart';
import 'package:hama_app/domain/entities/daily/daily_request.dart';
import 'package:hama_app/domain/entities/daily/list_daily_entity.dart';

abstract class DailyRepository {
  Future<Either<Failure, String>> addFormDaily(
      DailyRequest dailyRequest, String noOrder);
  Future<Either<Failure, ListDailyEntity>> getAllDaily(String noOrder);
  Future<Either<Failure, ListDailyEntity>> getAllDailyByDate(
      String noOrder, String tanggal);
  Future<Either<Failure, ListDailyEntity>> getAllDailyByMonth(
      String noOrder, String year, String month);
}
