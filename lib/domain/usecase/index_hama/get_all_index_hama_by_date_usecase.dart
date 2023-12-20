import 'package:dartz/dartz.dart';
import 'package:hama_app/common/utils/failure.dart';
import 'package:hama_app/domain/entities/index/list_index_hama_entity.dart';
import 'package:hama_app/domain/repositories/index_hama_repository.dart';

class GetAllIndexHamaByDateUsecase {
  final IndexHamaRepository repository;

  GetAllIndexHamaByDateUsecase(this.repository);

  Future<Either<Failure, ListIndexHamaEntity>> execute(
      String noOrder, String date) {
    final response = repository.getAllIndexHamaByDate(noOrder, date);
    return response;
  }
}
