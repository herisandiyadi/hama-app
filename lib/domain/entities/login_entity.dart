import 'package:equatable/equatable.dart';

class LoginEntity extends Equatable {
  final String token;
  final String role;

  const LoginEntity({required this.token, required this.role});

  @override
  List<Object?> get props => [token, role];
}
