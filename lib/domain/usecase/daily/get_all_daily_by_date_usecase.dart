import 'package:dartz/dartz.dart';
import 'package:hama_app/common/utils/failure.dart';
import 'package:hama_app/domain/entities/daily/list_daily_entity.dart';
import 'package:hama_app/domain/repositories/daily_repository.dart';

class GetAllDailyByDateUsecase {
  final DailyRepository repository;

  GetAllDailyByDateUsecase(this.repository);

  Future<Either<Failure, ListDailyEntity>> execute(
      String noOrder, String date) {
    final response = repository.getAllDailyByDate(noOrder, date);
    return response;
  }
}
