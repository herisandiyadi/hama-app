import 'package:dartz/dartz.dart';
import 'package:hama_app/common/utils/failure.dart';
import 'package:hama_app/domain/repositories/personal_repository.dart';

class GetDeletePersonal {
  final PersonalRepository repository;

  GetDeletePersonal(this.repository);

  Future<Either<Failure, String>> execute(String noOrder, String id) {
    final response = repository.deletePersonal(noOrder, id);
    return response;
  }
}
