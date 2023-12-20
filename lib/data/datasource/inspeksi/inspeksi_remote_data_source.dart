import 'dart:convert';

import 'package:hama_app/common/utils/cache_utils.dart';
import 'package:hama_app/common/utils/constants.dart';
import 'package:hama_app/common/utils/exceptions.dart';
import 'package:hama_app/data/models/inspeksi/inspeksi_model.dart';
import 'package:hama_app/data/models/inspeksi/inspeksi_response.dart';
import 'package:hama_app/data/models/inspeksi/list_inspeksi_response.dart';
import 'package:http/http.dart' as http;

abstract class InspeksiRemoteDataSource {
  Future<InspeksiResponse> addFormInspeksi(
      InspeksiModel inspeksiModel, String noOrder);
  Future<ListInspeksiResponse> getAllInspeksi(String noOrder);
  Future<ListInspeksiResponse> getAllInspeksiByDate(
      String noOrder, String date);
  Future<ListInspeksiResponse> getAllInspeksiByMonth(
      String noOrder, String year, String month);
}

class InspeksiRemoteDataSourceImpl implements InspeksiRemoteDataSource {
  final http.Client client;

  InspeksiRemoteDataSourceImpl({required this.client});
  @override
  Future<InspeksiResponse> addFormInspeksi(
      InspeksiModel inspeksiModel, String noOrder) async {
    final token = await CacheUtil.getString(cacheToken);
    final headers = {'Authorization': '$token'};

    final request = http.MultipartRequest(
        'POST', Uri.parse('$baseUrl/api/inspeksi/add/$noOrder'));
    request.fields.addAll({
      "lokasi": inspeksiModel.lokasi,
      "rekomendasi": inspeksiModel.rekomendasi,
      "tanggal": inspeksiModel.tanggal,
      "keterangan": inspeksiModel.keterangan
    });
    request.files.add(await http.MultipartFile.fromPath(
        'bukti_foto', inspeksiModel.buktiFoto));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    final json = jsonDecode(await response.stream.bytesToString());
    if (response.statusCode == 201) {
      final jsonResponse = InspeksiResponse.fromJson(json);

      return jsonResponse;
    } else {
      throw MessageException(json['message']);
    }
  }

  @override
  Future<ListInspeksiResponse> getAllInspeksi(String noOrder) async {
    final token = await CacheUtil.getString(cacheToken);
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': '$token'
    };

    final response = await client.get(
      Uri.parse('$baseUrl/api/inspeksi/getall/$noOrder'),
      headers: headers,
    );
    final json = jsonDecode(response.body);
    if (response.statusCode == 201) {
      final jsonResponse = ListInspeksiResponse.fromJson(json);

      return jsonResponse;
    } else {
      throw MessageException(json['message']);
    }
  }

  @override
  Future<ListInspeksiResponse> getAllInspeksiByDate(
      String noOrder, String date) async {
    final token = await CacheUtil.getString(cacheToken);
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': '$token'
    };

    final response = await client.get(
      Uri.parse('$baseUrl/api/inspeksi/getall/$noOrder/$date'),
      headers: headers,
    );
    final json = jsonDecode(response.body);
    if (response.statusCode == 201) {
      final jsonResponse = ListInspeksiResponse.fromJson(json);

      return jsonResponse;
    } else {
      throw MessageException(json['message']);
    }
  }

  @override
  Future<ListInspeksiResponse> getAllInspeksiByMonth(
      String noOrder, String year, String month) async {
    final token = await CacheUtil.getString(cacheToken);
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': '$token'
    };

    final response = await client.get(
      Uri.parse('$baseUrl/api/inspeksi/getall/$noOrder/$year/$month'),
      headers: headers,
    );
    final json = jsonDecode(response.body);
    if (response.statusCode == 201) {
      final jsonResponse = ListInspeksiResponse.fromJson(json);

      return jsonResponse;
    } else {
      throw MessageException(json['message']);
    }
  }
}
