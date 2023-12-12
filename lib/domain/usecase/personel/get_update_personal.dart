import 'package:dartz/dartz.dart';
import 'package:hama_app/common/utils/failure.dart';
import 'package:hama_app/domain/repositories/personal_repository.dart';

class GetUpdatePersonal {
  final PersonalRepository repository;

  GetUpdatePersonal(this.repository);

  Future<Either<Failure, String>> execute(
      String noOrder, String id, String name) {
    final response = repository.updatePersonal(noOrder, id, name);
    return response;
  }
}
