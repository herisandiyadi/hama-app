// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:hama_app/common/utils/cache_utils.dart';
import 'package:hama_app/common/utils/constants.dart';
import 'package:hama_app/common/utils/exceptions.dart';
import 'package:hama_app/data/models/daily/daily_model.dart';
import 'package:hama_app/data/models/daily/daily_response.dart';

abstract class DailyRemoteDataSource {
  Future<DailyResponse> addFormDaily(DailyModel dailyModel, String noOrder);
}

class DailyRemoteDataSourceImpl implements DailyRemoteDataSource {
  final http.Client client;

  DailyRemoteDataSourceImpl({
    required this.client,
  });
  @override
  Future<DailyResponse> addFormDaily(
      DailyModel dailyModel, String noOrder) async {
    final token = await CacheUtil.getString(cacheToken);
    final headers = {'Authorization': '$token'};

    final request = http.MultipartRequest(
        'POST', Uri.parse('$baseUrl/api/daily/add/$noOrder'));
    request.fields.addAll({
      'name': dailyModel.name,
      'lokasi': dailyModel.lokasi,
      'jenis_treatment': dailyModel.jenisTreatment,
      'hama_ditemukan': dailyModel.hamaDitemukan,
      'jumlah': dailyModel.jumlah.toString(),
      'tanggal': dailyModel.tanggal,
      'keterangan': dailyModel.keterangan
    });
    request.files.add(
        await http.MultipartFile.fromPath('bukti_foto', dailyModel.buktiFoto));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    final json = jsonDecode(await response.stream.bytesToString());
    if (response.statusCode == 201) {
      final jsonResponse = DailyResponse.fromJson(json);

      return jsonResponse;
    } else {
      throw MessageException(json['message']);
    }
  }
}
