import 'package:dartz/dartz.dart';
import 'package:hama_app/common/utils/failure.dart';
import 'package:hama_app/domain/repositories/pemakaian_repository.dart';

import '../../entities/pemakaian/list_pemakaian_entity.dart';

class GetAllPemakaianByMonthUsecase {
  final PemakaianRepository repository;

  GetAllPemakaianByMonthUsecase(this.repository);

  Future<Either<Failure, ListPemakaianEntity>> execute(
      String noOrder, String year, String month) {
    final response = repository.getAllPeralatanByMonth(noOrder, year, month);
    return response;
  }
}
