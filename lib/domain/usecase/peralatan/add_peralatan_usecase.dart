import 'package:dartz/dartz.dart';
import 'package:hama_app/common/utils/failure.dart';
import 'package:hama_app/domain/entities/peralatan/peralatan_entity.dart';
import 'package:hama_app/domain/entities/peralatan/peralatan_request.dart';
import 'package:hama_app/domain/repositories/peralatan_repository.dart';

class AddPeralatanUsecase {
  final PeralatanRepository repository;

  AddPeralatanUsecase(this.repository);

  Future<Either<Failure, PeralatanEntity>> execute(
      PeralatanRequest peralatanRequest) {
    final response = repository.addPeralatan(peralatanRequest);
    return response;
  }
}
