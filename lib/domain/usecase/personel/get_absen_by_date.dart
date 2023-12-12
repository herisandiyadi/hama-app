import 'package:dartz/dartz.dart';
import 'package:hama_app/common/utils/failure.dart';
import 'package:hama_app/domain/entities/personal/data_absen_entity.dart';
import 'package:hama_app/domain/repositories/personal_repository.dart';

class GetAbsenByDate {
  final PersonalRepository repository;

  GetAbsenByDate(this.repository);

  Future<Either<Failure, DataAbsenEntity>> execute(
      String noOrder, String date) {
    final response = repository.getAbsenById(noOrder, date);
    return response;
  }
}
