import 'package:dartz/dartz.dart';
import 'package:hama_app/common/utils/failure.dart';
import 'package:hama_app/domain/entities/personal/data_absen_entity.dart';
import 'package:hama_app/domain/repositories/personal_repository.dart';

class GetAbsenPersonByMonth {
  final PersonalRepository repository;

  GetAbsenPersonByMonth(this.repository);

  Future<Either<Failure, DataAbsenEntity>> execute(
      String noOrder, String id, String year, String month) {
    final response = repository.getAbsenPersonByMonth(noOrder, id, year, month);
    return response;
  }
}
