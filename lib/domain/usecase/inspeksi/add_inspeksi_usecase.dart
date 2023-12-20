import 'package:dartz/dartz.dart';
import 'package:hama_app/common/utils/failure.dart';
import 'package:hama_app/domain/entities/inspeksi/inspeksi_entity.dart';
import 'package:hama_app/domain/entities/inspeksi/inspeksi_request.dart';
import 'package:hama_app/domain/repositories/inspeksi_repository.dart';

class AddInspeksiUsecase {
  final InspeksiRepository repository;

  AddInspeksiUsecase(this.repository);

  Future<Either<Failure, InspeksiEntity>> execute(
      InspeksiRequest inspeksiRequest, String noOrder) {
    final response = repository.addFormInspeksi(inspeksiRequest, noOrder);
    return response;
  }
}
