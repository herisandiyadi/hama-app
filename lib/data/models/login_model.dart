import 'package:hama_app/domain/entities/login_request.dart';

class LoginModel {
  final String email;
  final String password;

  LoginModel({
    required this.email,
    required this.password,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };

  factory LoginModel.fromEntity(LoginRequest data) =>
      LoginModel(email: data.email, password: data.password);
}
