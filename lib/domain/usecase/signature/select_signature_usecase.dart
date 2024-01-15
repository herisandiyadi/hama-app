import 'package:dartz/dartz.dart';
import 'package:hama_app/common/utils/failure.dart';
import 'package:hama_app/domain/entities/signature/signature_entity.dart';
import 'package:hama_app/domain/repositories/signature_repository.dart';

class SelectSignatureUsecase {
  final SignatureRepository repository;

  SelectSignatureUsecase(this.repository);

  Future<Either<Failure, List<SignatureEntity>>> execute(int id) {
    final response = repository.selectSignature(id);
    return response;
  }
}
