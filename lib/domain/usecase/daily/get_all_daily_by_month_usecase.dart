import 'package:dartz/dartz.dart';
import 'package:hama_app/common/utils/failure.dart';
import 'package:hama_app/domain/entities/daily/list_daily_entity.dart';
import 'package:hama_app/domain/repositories/daily_repository.dart';

class GetAllDailyByMonthUsecase {
  final DailyRepository repository;

  GetAllDailyByMonthUsecase(this.repository);

  Future<Either<Failure, ListDailyEntity>> execute(
      String noOrder, String year, String month) {
    final response = repository.getAllDailyByMonth(noOrder, year, month);
    return response;
  }
}
