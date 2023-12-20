import 'package:dartz/dartz.dart';
import 'package:hama_app/common/utils/failure.dart';
import 'package:hama_app/domain/entities/index/index_hama_entity.dart';
import 'package:hama_app/domain/entities/index/index_hama_request.dart';
import 'package:hama_app/domain/repositories/index_hama_repository.dart';

class AddIndexHamaUsecase {
  final IndexHamaRepository repository;

  AddIndexHamaUsecase(this.repository);

  Future<Either<Failure, IndexHamaEntity>> execute(
      IndexHamaRequest indexHamaRequest, String noOrder) {
    final response = repository.addFormIndexHama(indexHamaRequest, noOrder);
    return response;
  }
}
