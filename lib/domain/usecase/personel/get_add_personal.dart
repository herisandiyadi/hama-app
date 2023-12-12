import 'package:dartz/dartz.dart';
import 'package:hama_app/common/utils/failure.dart';
import 'package:hama_app/domain/entities/personal/personal_entity.dart';
import 'package:hama_app/domain/repositories/personal_repository.dart';

class GetAddPersonal {
  final PersonalRepository repository;

  GetAddPersonal(this.repository);

  Future<Either<Failure, PersonalEntity>> execute(String noOrder, String name) {
    final response = repository.addPersonal(noOrder, name);
    return response;
  }
}
