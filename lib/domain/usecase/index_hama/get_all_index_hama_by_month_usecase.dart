import 'package:dartz/dartz.dart';
import 'package:hama_app/common/utils/failure.dart';
import 'package:hama_app/domain/entities/index/list_index_hama_entity.dart';
import 'package:hama_app/domain/repositories/index_hama_repository.dart';

class GetAllIndexHamaByMonthUsecase {
  final IndexHamaRepository repository;

  GetAllIndexHamaByMonthUsecase(this.repository);

  Future<Either<Failure, ListIndexHamaEntity>> execute(
      String noOrder, String year, String month) {
    final response = repository.getAllIndexHamaByMonth(noOrder, year, month);
    return response;
  }
}
