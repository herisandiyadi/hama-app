import 'package:dartz/dartz.dart';
import 'package:hama_app/common/utils/failure.dart';
import 'package:hama_app/domain/entities/personal/personal_entity.dart';
import 'package:hama_app/domain/repositories/personal_repository.dart';

class GetAllPersonal {
  final PersonalRepository repository;

  GetAllPersonal(this.repository);

  Future<Either<Failure, ListPersonelEntity>> execute(String noOrder) {
    final response = repository.getAllPersonal(noOrder);
    return response;
  }
}
