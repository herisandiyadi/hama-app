// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hama_app/domain/entities/login_entity.dart';

class LoginResponse {
  final String token;
  final String role;
  final String fullName;

  LoginResponse({
    required this.token,
    required this.role,
    required this.fullName,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        token: json["token"],
        role: json["role"],
        fullName: json['fullName'],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "role": role,
        "fullName": fullName,
      };

  LoginEntity toEntity() {
    return LoginEntity(
      token: token,
      role: role,
      fullName: fullName,
    );
  }
}
