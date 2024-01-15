import 'package:dartz/dartz.dart';
import 'package:hama_app/common/utils/failure.dart';
import 'package:hama_app/domain/repositories/signature_repository.dart';

class ClearSignatureUsecase {
  final SignatureRepository repository;

  ClearSignatureUsecase(this.repository);

  Future<Either<Failure, String>> execute() {
    final response = repository.clearSignature();
    return response;
  }
}
