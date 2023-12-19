import 'package:dartz/dartz.dart';
import 'package:hama_app/common/utils/failure.dart';
import 'package:hama_app/domain/entities/peralatan/list_peralatan_entity.dart';
import 'package:hama_app/domain/repositories/peralatan_repository.dart';

class GetAllPeralatanUsecase {
  final PeralatanRepository repository;

  GetAllPeralatanUsecase(this.repository);

  Future<Either<Failure, ListPeralatanEntity>> execute(String noOrder) {
    final response = repository.getAllPeralatan(noOrder);
    return response;
  }
}
