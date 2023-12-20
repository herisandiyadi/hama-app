import 'dart:convert';

import 'package:hama_app/common/utils/cache_utils.dart';
import 'package:hama_app/common/utils/constants.dart';
import 'package:hama_app/common/utils/exceptions.dart';
import 'package:hama_app/data/models/pemakaian/list_pemakaian_response.dart';
import 'package:hama_app/data/models/pemakaian/pemakaian_model.dart';
import 'package:hama_app/data/models/pemakaian/pemakaian_response.dart';
import 'package:http/http.dart' as http;

abstract class PemakaianRemoteDataSource {
  Future<PemakaianResponse> addPemakaian(PemakaianModel pemakaian);
  Future<ListPemakaianResponse> getAllPemakaian(String noOrder);
  Future<ListPemakaianResponse> getAllPemakaianByDate(
      String noOrder, String date);
  Future<ListPemakaianResponse> getAllPemakaianByMonth(
      String noOrder, String year, String month);
}

class PemakaianRemoteDataSourceImpl implements PemakaianRemoteDataSource {
  final http.Client client;

  PemakaianRemoteDataSourceImpl({required this.client});

  @override
  Future<PemakaianResponse> addPemakaian(PemakaianModel pemakaian) async {
    final token = await CacheUtil.getString(cacheToken);
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': '$token'
    };
    final body = jsonEncode({
      "name": pemakaian.name,
      "bahan_aktif": pemakaian.bahanAktif,
      "merk": pemakaian.merk,
      "stok_awal": pemakaian.stokAwal,
      "satuan": pemakaian.satuan,
      "tanggal": pemakaian.tanggal,
      "ins": pemakaian.ins,
      "no_order": pemakaian.noOrder,
      "out": pemakaian.out,
      "stok_akhir": pemakaian.stokAkhir,
      "satuanb": pemakaian.satuanb
    });
    final response = await client.post(
      Uri.parse('$baseUrl/api/pemakaian/add/${pemakaian.noOrder}'),
      headers: headers,
      body: body,
    );
    final json = jsonDecode(response.body);
    if (response.statusCode == 201) {
      final jsonResponse = PemakaianResponse.fromJson(json);

      return jsonResponse;
    } else {
      throw MessageException(json['message']);
    }
  }

  @override
  Future<ListPemakaianResponse> getAllPemakaian(String noOrder) async {
    final token = await CacheUtil.getString(cacheToken);
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': '$token'
    };
    final response = await client.get(
      Uri.parse('$baseUrl/api/pemakaian/getall/$noOrder'),
      headers: headers,
    );
    final json = jsonDecode(response.body);
    if (response.statusCode == 201) {
      final jsonResponse = ListPemakaianResponse.fromJson(json);

      return jsonResponse;
    } else {
      throw MessageException(json['message']);
    }
  }

  @override
  Future<ListPemakaianResponse> getAllPemakaianByDate(
      String noOrder, String date) async {
    final token = await CacheUtil.getString(cacheToken);
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': '$token'
    };
    final response = await client.get(
      Uri.parse('$baseUrl/api/pemakaian/getall/$noOrder/$date'),
      headers: headers,
    );

    final json = jsonDecode(response.body);
    if (response.statusCode == 201) {
      final jsonResponse = ListPemakaianResponse.fromJson(json);

      return jsonResponse;
    } else {
      throw MessageException(json['message']);
    }
  }

  @override
  Future<ListPemakaianResponse> getAllPemakaianByMonth(
      String noOrder, String year, String month) async {
    final token = await CacheUtil.getString(cacheToken);
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': '$token'
    };
    final response = await client.get(
      Uri.parse('$baseUrl/api/pemakaian/getall/$noOrder/$year/$month'),
      headers: headers,
    );
    final json = jsonDecode(response.body);
    if (response.statusCode == 201) {
      final jsonResponse = ListPemakaianResponse.fromJson(json);

      return jsonResponse;
    } else {
      throw MessageException(json['message']);
    }
  }
}
