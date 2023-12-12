import 'package:hama_app/domain/entities/login_entity.dart';

class LoginResponse {
  final String token;
  final String role;

  LoginResponse({
    required this.token,
    required this.role,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        token: json["token"],
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "role": role,
      };

  LoginEntity toEntity() {
    return LoginEntity(
      token: token,
      role: role,
    );
  }
}
