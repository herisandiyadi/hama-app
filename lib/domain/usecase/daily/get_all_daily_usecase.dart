import 'package:dartz/dartz.dart';
import 'package:hama_app/common/utils/failure.dart';
import 'package:hama_app/domain/entities/daily/list_daily_entity.dart';
import 'package:hama_app/domain/repositories/daily_repository.dart';

class GetAllDailyUsecase {
  final DailyRepository repository;

  GetAllDailyUsecase(this.repository);

  Future<Either<Failure, ListDailyEntity>> execute(String noOrder) {
    final response = repository.getAllDaily(noOrder);
    return response;
  }
}
