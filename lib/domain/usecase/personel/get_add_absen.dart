import 'package:dartz/dartz.dart';
import 'package:hama_app/common/utils/failure.dart';
import 'package:hama_app/domain/entities/personal/absen_request.dart';
import 'package:hama_app/domain/repositories/personal_repository.dart';

class GetAddAbsen {
  final PersonalRepository repository;

  GetAddAbsen(this.repository);

  Future<Either<Failure, String>> execute(AbsenRequest absenRequest) {
    final response = repository.addAbsen(absenRequest);
    return response;
  }
}
