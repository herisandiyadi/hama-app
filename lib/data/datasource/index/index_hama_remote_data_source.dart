import 'dart:convert';

import 'package:hama_app/common/utils/cache_utils.dart';
import 'package:hama_app/common/utils/constants.dart';
import 'package:hama_app/common/utils/exceptions.dart';
import 'package:hama_app/data/models/index/index_hama_model.dart';
import 'package:hama_app/data/models/index/index_hama_response.dart';
import 'package:hama_app/data/models/index/list_index_hama_response.dart';
import 'package:http/http.dart' as http;

abstract class IndexHamaRemoteDataSource {
  Future<IndexHamaResponse> addFormIndexHama(
      String noOrder, IndexHamaModel indexHamaModel);
  Future<ListIndexHamaResponse> getAllIndexHama(String noOrder);
  Future<ListIndexHamaResponse> getAllIndexHamaByDate(
      String noOrder, String date);
  Future<ListIndexHamaResponse> getAllIndexHamaByMonth(
      String noOrder, String year, String month);
}

class IndexHamaRemoteDataSourceImpl implements IndexHamaRemoteDataSource {
  final http.Client client;

  IndexHamaRemoteDataSourceImpl({required this.client});
  @override
  Future<IndexHamaResponse> addFormIndexHama(
      String noOrder, IndexHamaModel indexHamaModel) async {
    final token = await CacheUtil.getString(cacheToken);
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': '$token'
    };
    final body = jsonEncode({
      "lokasi": indexHamaModel.lokasi,
      "jenis_hama": indexHamaModel.jenisHama,
      "indeks_populasi": indexHamaModel.indeksPopulasi,
      "tanggal": indexHamaModel.tanggal,
      "status": indexHamaModel.status
    });
    final response = await client.post(
      Uri.parse('$baseUrl/api/indeks/add/$noOrder'),
      headers: headers,
      body: body,
    );
    final json = jsonDecode(response.body);
    if (response.statusCode == 201) {
      final jsonResponse = IndexHamaResponse.fromJson(json);

      return jsonResponse;
    } else {
      throw MessageException(json['message']);
    }
  }

  @override
  Future<ListIndexHamaResponse> getAllIndexHama(String noOrder) async {
    final token = await CacheUtil.getString(cacheToken);
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': '$token'
    };

    final response = await client.get(
      Uri.parse('$baseUrl/api/indeks/getall/$noOrder'),
      headers: headers,
    );
    final json = jsonDecode(response.body);
    if (response.statusCode == 201) {
      final jsonResponse = ListIndexHamaResponse.fromJson(json);

      return jsonResponse;
    } else {
      throw MessageException(json['message']);
    }
  }

  @override
  Future<ListIndexHamaResponse> getAllIndexHamaByDate(
      String noOrder, String date) async {
    final token = await CacheUtil.getString(cacheToken);
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': '$token'
    };

    final response = await client.get(
      Uri.parse('$baseUrl/api/indeks/getall/$noOrder/$date'),
      headers: headers,
    );
    final json = jsonDecode(response.body);
    if (response.statusCode == 201) {
      final jsonResponse = ListIndexHamaResponse.fromJson(json);

      return jsonResponse;
    } else {
      throw MessageException(json['message']);
    }
  }

  @override
  Future<ListIndexHamaResponse> getAllIndexHamaByMonth(
      String noOrder, String year, String month) async {
    final token = await CacheUtil.getString(cacheToken);
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': '$token'
    };

    final response = await client.get(
      Uri.parse('$baseUrl/api/indeks/getall/$noOrder/$year/$month'),
      headers: headers,
    );
    final json = jsonDecode(response.body);
    if (response.statusCode == 201) {
      final jsonResponse = ListIndexHamaResponse.fromJson(json);

      return jsonResponse;
    } else {
      throw MessageException(json['message']);
    }
  }
}
