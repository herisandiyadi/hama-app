import 'dart:convert';

import 'package:hama_app/common/utils/cache_utils.dart';
import 'package:hama_app/common/utils/constants.dart';
import 'package:hama_app/common/utils/exceptions.dart';
import 'package:hama_app/data/models/personal/absen_model.dart';
import 'package:hama_app/data/models/personal/data_absen_response.dart';
import 'package:hama_app/data/models/personal/personal_response.dart';
import 'package:http/http.dart' as http;

abstract class PersonalRemoteDataSource {
  Future<PersonalResponse> addPersonal(String noOrder, String name);
  Future<ListPersonelResponse> getAllPersonal(String noOrder);
  Future<String> updatePersonal(String noOrder, String id, String name);
  Future<String> deletePersonal(String noOrder, String id);
  Future<String> addAbsen(AbsenModel absenModel);
  Future<DataAbsenResponse> getAbsenByDate(String noOrder, String date);
  Future<DataAbsenResponse> getAbsenById(String noOrder, String id);
}

class PersnoalRemoteDataSourceImpl implements PersonalRemoteDataSource {
  final http.Client client;

  PersnoalRemoteDataSourceImpl({required this.client});
  @override
  Future<PersonalResponse> addPersonal(String noOrder, String name) async {
    final token = await CacheUtil.getString(cacheToken);
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': '$token'
    };
    final body = jsonEncode({"name": name});
    final response = await client.post(
      Uri.parse('$baseUrl/api/personel/add/$noOrder'),
      headers: headers,
      body: body,
    );
    final json = jsonDecode(response.body);
    if (response.statusCode == 201) {
      final jsonResponse = PersonalResponse.fromJson(json);

      return jsonResponse;
    } else {
      throw MessageException(json['message']);
    }
  }

  @override
  Future<ListPersonelResponse> getAllPersonal(String noOrder) async {
    final token = await CacheUtil.getString(cacheToken);
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': '$token'
    };
    final response = await client.get(
      Uri.parse('$baseUrl/api/personel/getall/$noOrder'),
      headers: headers,
    );
    final json = jsonDecode(response.body);
    if (response.statusCode == 200) {
      final jsonResponse = ListPersonelResponse.fromJson(json);

      return jsonResponse;
    } else {
      throw MessageException(json['message']);
    }
  }

  @override
  Future<String> updatePersonal(String noOrder, String id, String name) async {
    final token = await CacheUtil.getString(cacheToken);
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': '$token'
    };
    final body = jsonEncode({"name": name});
    final response = await client.put(
      Uri.parse('$baseUrl/api/personel/update/$noOrder/$id'),
      headers: headers,
      body: body,
    );
    final json = jsonDecode(response.body);
    if (response.statusCode == 200) {
      final jsonResponse = json['message'];
      return jsonResponse;
    } else {
      throw MessageException(json['message']);
    }
  }

  @override
  Future<String> deletePersonal(String noOrder, String id) async {
    final token = await CacheUtil.getString(cacheToken);
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': '$token'
    };
    final response = await client.delete(
      Uri.parse('$baseUrl/api/personel/delete/$noOrder/$id'),
      headers: headers,
    );
    final json = jsonDecode(response.body);
    if (response.statusCode == 200) {
      final jsonResponse = json['message'];
      return jsonResponse;
    } else {
      throw MessageException(json['message']);
    }
  }

  @override
  Future<String> addAbsen(AbsenModel absenModel) async {
    final token = await CacheUtil.getString(cacheToken);
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': '$token'
    };
    final body = jsonEncode({
      "id_person": absenModel.idPerson,
      "tanggal": absenModel.tanggal,
      "keterangan": absenModel.keterangan
    });
    final response = await client.post(
      Uri.parse('$baseUrl/api/personel/absen/${absenModel.noOrder}'),
      headers: headers,
      body: body,
    );
    print(response.body);

    final json = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return json['message'];
    } else {
      throw MessageException(json['message']);
    }
  }

  @override
  Future<DataAbsenResponse> getAbsenByDate(String noOrder, String date) async {
    final token = await CacheUtil.getString(cacheToken);
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': '$token'
    };

    final response = await client.get(
      Uri.parse('$baseUrl/api/personel/absen/getall/$noOrder/$date'),
      headers: headers,
    );

    final json = jsonDecode(response.body);
    if (response.statusCode == 200) {
      final jsonResponse = DataAbsenResponse.fromJson(json);
      return jsonResponse;
    } else {
      throw MessageException(json['message']);
    }
  }

  @override
  Future<DataAbsenResponse> getAbsenById(String noOrder, String id) async {
    final token = await CacheUtil.getString(cacheToken);
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': '$token'
    };

    final response = await client.get(
      Uri.parse('$baseUrl/api/personel/absen/getall/$noOrder/$id'),
      headers: headers,
    );

    final json = jsonDecode(response.body);
    if (response.statusCode == 200) {
      final jsonResponse = DataAbsenResponse.fromJson(json);
      return jsonResponse;
    } else {
      throw MessageException(json['message']);
    }
  }
}
