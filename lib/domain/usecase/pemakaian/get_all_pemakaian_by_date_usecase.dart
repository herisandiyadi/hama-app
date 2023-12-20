import 'package:dartz/dartz.dart';
import 'package:hama_app/common/utils/failure.dart';
import 'package:hama_app/domain/entities/pemakaian/list_pemakaian_entity.dart';
import 'package:hama_app/domain/repositories/pemakaian_repository.dart';

class GetAllPemakaianByDateUsecase {
  final PemakaianRepository repository;

  GetAllPemakaianByDateUsecase(this.repository);

  Future<Either<Failure, ListPemakaianEntity>> execute(
      String noOrder, String date) {
    final response = repository.getAllPeralatanByDate(noOrder, date);
    return response;
  }
}
