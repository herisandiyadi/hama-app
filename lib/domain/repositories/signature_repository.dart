import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:hama_app/common/utils/failure.dart';
import 'package:hama_app/domain/entities/signature/signature_entity.dart';

abstract class SignatureRepository {
  Future<Either<Failure, String>> saveSignature(Uint8List image);
  Future<Either<Failure, String>> deleteSignature(int id);
  Future<Either<Failure, List<SignatureEntity>>> selectSignature(int id);
  Future<Either<Failure, String>> clearSignature();
  Future<Either<Failure, List<SignatureEntity>>> getAllSignature();
}
