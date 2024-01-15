import 'dart:typed_data';

import 'package:hama_app/common/utils/exceptions.dart';
import 'package:hama_app/data/db/database_helper.dart';
import 'package:hama_app/data/models/signature/signature_response.dart';

abstract class SignatureLocalDataSource {
  Future<String> saveSignature(Uint8List image);
  Future<String> deleteSignature(int id);
  Future<String> clearSignature();
  Future<List<SignatureResponse>> selectSignature(int id);
  Future<List<SignatureResponse>> getAllSignature();
}

class SignatureLocalDataSourceImpl implements SignatureLocalDataSource {
  final DatabaseHelper databaseHelper;

  SignatureLocalDataSourceImpl({required this.databaseHelper});

  @override
  Future<String> saveSignature(Uint8List image) async {
    try {
      await databaseHelper.insert(image);
      return 'Berhasil tambahkan Signature';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<List<SignatureResponse>> selectSignature(int id) async {
    try {
      final result = await databaseHelper.selectById(id);
      return result;
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<String> deleteSignature(int id) async {
    try {
      await databaseHelper.deleteById(id);
      return 'Signature berhasil dihapus';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<String> clearSignature() async {
    try {
      await databaseHelper.clearAll();
      return 'List Signature dihapus';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<List<SignatureResponse>> getAllSignature() async {
    try {
      final data = await databaseHelper.getSignature();
      return data;
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }
}
