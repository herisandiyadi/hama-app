import 'package:dartz/dartz.dart';
import 'package:hama_app/common/utils/failure.dart';
import 'package:hama_app/domain/entities/login_entity.dart';
import 'package:hama_app/domain/entities/login_request.dart';
import 'package:hama_app/domain/repositories/auth_repository.dart';

class GetLogin {
  final AuthRepository repository;

  GetLogin(this.repository);

  Future<Either<Failure, LoginEntity>> execute(LoginRequest loginRequest) {
    final dataresp = repository.login(loginRequest);
    return dataresp;
  }
}
