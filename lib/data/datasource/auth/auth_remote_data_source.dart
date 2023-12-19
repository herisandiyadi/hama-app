import 'dart:convert';

import 'package:hama_app/common/utils/cache_utils.dart';
import 'package:hama_app/common/utils/constants.dart';
import 'package:hama_app/common/utils/exceptions.dart';
import 'package:hama_app/data/models/login_model.dart';
import 'package:hama_app/data/models/login_response.dart';
import 'package:http/http.dart' as http;

abstract class AuthRemoteDataSource {
  Future<LoginResponse> login(LoginModel loginModel);
  Future<String> logout();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final http.Client client;

  AuthRemoteDataSourceImpl({required this.client});

  @override
  Future<LoginResponse> login(LoginModel loginModel) async {
    final body = jsonEncode({
      'email': loginModel.email,
      'password': loginModel.password,
    });

    final headers = {'content-type': 'application/json'};
    final response = await client.post(
      Uri.parse('$baseUrl/api/login'),
      headers: headers,
      body: body,
    );
    final json = jsonDecode(response.body);
    if (response.statusCode == 200) {
      final jsonResponse = LoginResponse.fromJson(json);
      CacheUtil.putString(cacheToken, jsonResponse.token);
      CacheUtil.putBoolean(cacheLogin, true);
      CacheUtil.putBoolean(cacheLogin, true);
      CacheUtil.putString(cacheUsername, jsonResponse.fullName);
      return jsonResponse;
    } else {
      throw MessageException(json['message']);
    }
  }

  @override
  Future<String> logout() async {
    await CacheUtil.clear();
    return 'Berhasil Logout';
  }
}
