import 'package:dartz/dartz.dart';
import 'package:hama_app/common/utils/failure.dart';
import 'package:hama_app/domain/entities/pemakaian/pemakaian_entity.dart';
import 'package:hama_app/domain/entities/pemakaian/pemakaian_request.dart';
import 'package:hama_app/domain/repositories/pemakaian_repository.dart';

class AddPemakaianUsecase {
  final PemakaianRepository repository;

  AddPemakaianUsecase(this.repository);

  Future<Either<Failure, PemakaianEntity>> execute(
      PemakaianRequest pemakaianRequest) {
    final response = repository.addPemakaian(pemakaianRequest);
    return response;
  }
}
