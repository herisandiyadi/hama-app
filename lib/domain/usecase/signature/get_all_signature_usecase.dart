import 'package:dartz/dartz.dart';
import 'package:hama_app/common/utils/failure.dart';
import 'package:hama_app/domain/entities/signature/signature_entity.dart';
import 'package:hama_app/domain/repositories/signature_repository.dart';

class GetAllSignatureUsecase {
  final SignatureRepository repository;

  GetAllSignatureUsecase(this.repository);

  Future<Either<Failure, List<SignatureEntity>>> execute() {
    final response = repository.getAllSignature();
    return response;
  }
}
