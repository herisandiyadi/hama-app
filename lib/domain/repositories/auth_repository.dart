import 'package:dartz/dartz.dart';
import 'package:hama_app/common/utils/failure.dart';
import 'package:hama_app/domain/entities/login_entity.dart';
import 'package:hama_app/domain/entities/login_request.dart';

abstract class AuthRepository {
  Future<Either<Failure, LoginEntity>> login(LoginRequest loginRequest);
}
