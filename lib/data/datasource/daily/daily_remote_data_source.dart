// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hama_app/data/models/daily/generate_pdf_response.dart';
import 'package:hama_app/data/models/daily/list_daily_response.dart';
import 'package:http/http.dart' as http;

import 'package:hama_app/common/utils/cache_utils.dart';
import 'package:hama_app/common/utils/constants.dart';
import 'package:hama_app/common/utils/exceptions.dart';
import 'package:hama_app/data/models/daily/daily_model.dart';

abstract class DailyRemoteDataSource {
  Future<String> addFormDaily(DailyModel dailyModel, String noOrder);
  Future<ListDailyResponse> getAllDaily(String noOrder);
  Future<ListDailyResponse> getAllDailyByDate(String noOrder, String tanggal);
  Future<ListDailyResponse> getAllDailyByMonth(
      String noOrder, String year, String month);
  Future<GeneratePdfResponse> generatePDFMonthly(
      String noOrder, String year, String month);
}

class DailyRemoteDataSourceImpl implements DailyRemoteDataSource {
  final http.Client client;

  DailyRemoteDataSourceImpl({
    required this.client,
  });
  @override
  Future<String> addFormDaily(DailyModel dailyModel, String noOrder) async {
    final token = await CacheUtil.getString(cacheToken);
    final headers = {'Authorization': '$token'};

    final request = http.MultipartRequest(
        'POST', Uri.parse('$baseUrl/api/daily/add/$noOrder'));
    request.fields.addAll({
      'lokasi': dailyModel.lokasi,
      'jenis_treatment': dailyModel.jenisTreatment,
      'hama_ditemukan': dailyModel.hamaDitemukan,
      'jumlah': dailyModel.jumlah,
      'tanggal': dailyModel.tanggal,
      'keterangan': dailyModel.keterangan
    });
    request.files.add(
        await http.MultipartFile.fromPath('bukti_foto', dailyModel.buktiFoto));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    final json = jsonDecode(await response.stream.bytesToString());

    if (response.statusCode == 201) {
      // final jsonResponse = DailyResponse.fromJson(json);
      return json['message'];
    } else {
      throw MessageException(json['message']);
    }
  }

  @override
  Future<ListDailyResponse> getAllDaily(String noOrder) async {
    final token = await CacheUtil.getString(cacheToken);
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': '$token'
    };
    final response = await client.get(
      Uri.parse('$baseUrl/api/daily/getall/$noOrder'),
      headers: headers,
    );
    final json = jsonDecode(response.body);
    if (response.statusCode == 201) {
      final jsonResponse = ListDailyResponse.fromJson(json);

      return jsonResponse;
    } else {
      throw MessageException(json['message']);
    }
  }

  @override
  Future<ListDailyResponse> getAllDailyByDate(
      String noOrder, String tanggal) async {
    final token = await CacheUtil.getString(cacheToken);
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': '$token'
    };
    final response = await client.get(
      Uri.parse('$baseUrl/api/daily/getall/$noOrder/$tanggal'),
      headers: headers,
    );
    final json = jsonDecode(response.body);
    if (response.statusCode == 201) {
      final jsonResponse = ListDailyResponse.fromJson(json);

      return jsonResponse;
    } else {
      throw MessageException(json['message']);
    }
  }

  @override
  Future<ListDailyResponse> getAllDailyByMonth(
      String noOrder, String year, String month) async {
    final token = await CacheUtil.getString(cacheToken);
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': '$token'
    };
    final response = await client.get(
      Uri.parse('$baseUrl/api/daily/getall/$noOrder/$year/$month'),
      headers: headers,
    );
    final json = jsonDecode(response.body);
    if (response.statusCode == 201) {
      final jsonResponse = ListDailyResponse.fromJson(json);

      return jsonResponse;
    } else {
      throw MessageException(json['message']);
    }
  }

  @override
  Future<GeneratePdfResponse> generatePDFMonthly(
      String noOrder, String year, String month) async {
    final token = await CacheUtil.getString(cacheToken);
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': '$token'
    };
    final response = await client.get(
      Uri.parse('$baseUrl/api/daily/download/$noOrder/$year/$month'),
      headers: headers,
    );
    final json = jsonDecode(response.body);
    if (response.statusCode == 201) {
      final jsonResponse = GeneratePdfResponse.fromJson(json);

      return jsonResponse;
    } else {
      throw MessageException(json['message']);
    }
  }
}
