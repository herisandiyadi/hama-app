import 'package:dartz/dartz.dart';
import 'package:hama_app/common/utils/failure.dart';
import 'package:hama_app/domain/entities/daily/daily_entity.dart';
import 'package:hama_app/domain/entities/daily/daily_request.dart';
import 'package:hama_app/domain/repositories/daily_repository.dart';

class AddDailyUsecase {
  final DailyRepository repository;

  AddDailyUsecase(this.repository);

  Future<Either<Failure, DailyEntity>> execute(
      DailyRequest dailyRequest, String noOrder) {
    final response = repository.addFormDaily(dailyRequest, noOrder);
    return response;
  }
}
