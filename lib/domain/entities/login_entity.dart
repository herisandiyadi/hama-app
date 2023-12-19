// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class LoginEntity extends Equatable {
  final String token;
  final String role;
  final String fullName;

  const LoginEntity({
    required this.token,
    required this.role,
    required this.fullName,
  });

  @override
  List<Object?> get props => [
        token,
        role,
        fullName,
      ];
}
