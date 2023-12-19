import 'dart:convert';

import 'package:hama_app/common/utils/cache_utils.dart';
import 'package:hama_app/common/utils/constants.dart';
import 'package:hama_app/common/utils/exceptions.dart';
import 'package:hama_app/data/models/peralatan/list_peralatan_response.dart';
import 'package:hama_app/data/models/peralatan/peralatan_model.dart';
import 'package:hama_app/data/models/peralatan/peralatan_response.dart';
import 'package:http/http.dart' as http;

abstract class PeralatanRemoteDataSource {
  Future<PeralatanResponse> addPeralatan(PeralatanModel peralatan);
  Future<ListPeralatanResponse> getAllPeralatan(String noOrder);
  Future<ListPeralatanResponse> getAllPeralatanByDate(
      String noOrder, String date);
  Future<ListPeralatanResponse> getAllPeralatanByMonth(
      String noOrder, String year, String month);
}

class PeralatanRemoteDataSourceImpl implements PeralatanRemoteDataSource {
  final http.Client client;

  PeralatanRemoteDataSourceImpl({required this.client});
  @override
  Future<PeralatanResponse> addPeralatan(PeralatanModel peralatan) async {
    final token = await CacheUtil.getString(cacheToken);
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': '$token'
    };
    final body = jsonEncode({
      "name": peralatan.name,
      "no_order": peralatan.noOrder,
      "merek": peralatan.merek,
      "jumlah": peralatan.jumlah,
      "satuan": peralatan.satuan,
      "kondisi": peralatan.kondisi,
      "tanggal": peralatan.tanggal
    });
    final response = await client.post(
      Uri.parse('$baseUrl/api/peralatan/add/${peralatan.noOrder}'),
      headers: headers,
      body: body,
    );
    final json = jsonDecode(response.body);
    if (response.statusCode == 201) {
      final jsonResponse = PeralatanResponse.fromJson(json);

      return jsonResponse;
    } else {
      throw MessageException(json['message']);
    }
  }

  @override
  Future<ListPeralatanResponse> getAllPeralatan(String noOrder) async {
    final token = await CacheUtil.getString(cacheToken);
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': '$token'
    };

    final response = await client.get(
      Uri.parse('$baseUrl/api/peralatan/getall/$noOrder'),
      headers: headers,
    );
    final json = jsonDecode(response.body);
    if (response.statusCode == 201) {
      final jsonResponse = ListPeralatanResponse.fromJson(json);

      return jsonResponse;
    } else {
      throw MessageException(json['message']);
    }
  }

  @override
  Future<ListPeralatanResponse> getAllPeralatanByDate(
      String noOrder, String date) async {
    final token = await CacheUtil.getString(cacheToken);
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': '$token'
    };
    final response = await client.get(
      Uri.parse('$baseUrl/api/peralatan/getall/$noOrder/$date'),
      headers: headers,
    );
    final json = jsonDecode(response.body);
    if (response.statusCode == 201) {
      final jsonResponse = ListPeralatanResponse.fromJson(json);

      return jsonResponse;
    } else {
      throw MessageException(json['message']);
    }
  }

  @override
  Future<ListPeralatanResponse> getAllPeralatanByMonth(
      String noOrder, String year, String month) async {
    final token = await CacheUtil.getString(cacheToken);
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': '$token'
    };

    final response = await client.get(
      Uri.parse('$baseUrl/api/peralatan/getall/$noOrder/$year/$month'),
      headers: headers,
    );
    final json = jsonDecode(response.body);
    if (response.statusCode == 201) {
      final jsonResponse = ListPeralatanResponse.fromJson(json);

      return jsonResponse;
    } else {
      throw MessageException(json['message']);
    }
  }
}
