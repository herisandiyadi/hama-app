import 'package:dartz/dartz.dart';
import 'package:hama_app/common/utils/failure.dart';
import 'package:hama_app/domain/entities/peralatan/list_peralatan_entity.dart';
import 'package:hama_app/domain/repositories/peralatan_repository.dart';

class GetAllPeralatanByMonthUsecase {
  final PeralatanRepository repository;

  GetAllPeralatanByMonthUsecase(this.repository);

  Future<Either<Failure, ListPeralatanEntity>> execute(
      String noOrder, String year, String month) {
    final response = repository.getAllPeralatanByMonth(noOrder, year, month);
    return response;
  }
}
