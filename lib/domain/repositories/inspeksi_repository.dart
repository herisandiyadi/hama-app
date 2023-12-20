import 'package:dartz/dartz.dart';
import 'package:hama_app/common/utils/failure.dart';
import 'package:hama_app/domain/entities/inspeksi/inspeksi_entity.dart';
import 'package:hama_app/domain/entities/inspeksi/inspeksi_request.dart';
import 'package:hama_app/domain/entities/inspeksi/list_inspeksi_entity.dart';

abstract class InspeksiRepository {
  Future<Either<Failure, InspeksiEntity>> addFormInspeksi(
      InspeksiRequest inspeksiRequest, String noOrder);
  Future<Either<Failure, ListInspeksiEntity>> getAllInspeksi(String noOrder);
  Future<Either<Failure, ListInspeksiEntity>> getAllInspeksiByDate(
      String noOrder, String date);
  Future<Either<Failure, ListInspeksiEntity>> getAllInspeksiByMonth(
      String noOrder, String year, String month);
}
