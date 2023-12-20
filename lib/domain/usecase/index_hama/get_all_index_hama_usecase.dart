import 'package:dartz/dartz.dart';
import 'package:hama_app/common/utils/failure.dart';
import 'package:hama_app/domain/entities/index/index_hama_entity.dart';
import 'package:hama_app/domain/entities/index/list_index_hama_entity.dart';
import 'package:hama_app/domain/repositories/index_hama_repository.dart';

class GetAllIndexHamaUsecase {
  final IndexHamaRepository repository;

  GetAllIndexHamaUsecase(this.repository);

  Future<Either<Failure, ListIndexHamaEntity>> execute(String noOrder) {
    final response = repository.getAllIndexHama(noOrder);
    return response;
  }
}
