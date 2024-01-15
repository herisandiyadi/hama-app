import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:hama_app/common/utils/failure.dart';
import 'package:hama_app/domain/repositories/signature_repository.dart';

class SaveSignatureUsecase {
  final SignatureRepository repository;

  SaveSignatureUsecase(this.repository);

  Future<Either<Failure, String>> execute(Uint8List image) {
    final response = repository.saveSignature(image);
    return response;
  }
}
