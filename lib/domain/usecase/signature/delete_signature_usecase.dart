import 'package:dartz/dartz.dart';
import 'package:hama_app/common/utils/failure.dart';
import 'package:hama_app/domain/repositories/signature_repository.dart';

class DeleteSignatureUsecase {
  final SignatureRepository repository;

  DeleteSignatureUsecase(this.repository);

  Future<Either<Failure, String>> execute(int id) {
    final response = repository.deleteSignature(id);
    return response;
  }
}
