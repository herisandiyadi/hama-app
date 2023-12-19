import 'package:dartz/dartz.dart';
import 'package:hama_app/common/utils/failure.dart';
import 'package:hama_app/domain/entities/peralatan/list_peralatan_entity.dart';
import 'package:hama_app/domain/repositories/peralatan_repository.dart';

class GetAllPeralatanByDateUsecase {
  final PeralatanRepository repository;

  GetAllPeralatanByDateUsecase(this.repository);

  Future<Either<Failure, ListPeralatanEntity>> execute(
      String noOrder, String date) {
    final response = repository.getAllPeralatanByDate(noOrder, date);
    return response;
  }
}
