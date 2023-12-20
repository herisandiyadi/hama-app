import 'package:dartz/dartz.dart';
import 'package:hama_app/common/utils/failure.dart';
import 'package:hama_app/domain/entities/pemakaian/list_pemakaian_entity.dart';
import 'package:hama_app/domain/repositories/pemakaian_repository.dart';

class GetAllPemakaianUsecase {
  final PemakaianRepository repository;

  GetAllPemakaianUsecase(this.repository);

  Future<Either<Failure, ListPemakaianEntity>> execute(String noOrder) {
    final response = repository.getAllPeralatan(noOrder);
    return response;
  }
}
