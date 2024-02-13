import 'package:dartz/dartz.dart';
import 'package:hama_app/common/utils/failure.dart';
import 'package:hama_app/domain/entities/daily/generate_pdf_entity.dart';
import 'package:hama_app/domain/entities/pemakaian/list_pemakaian_entity.dart';
import 'package:hama_app/domain/entities/pemakaian/pemakaian_entity.dart';
import 'package:hama_app/domain/entities/pemakaian/pemakaian_request.dart';

abstract class PemakaianRepository {
  Future<Either<Failure, PemakaianEntity>> addPemakaian(
      PemakaianRequest pemakaianRequest);
  Future<Either<Failure, ListPemakaianEntity>> getAllPeralatan(String noOrder);
  Future<Either<Failure, ListPemakaianEntity>> getAllPeralatanByDate(
      String noOrder, String date);
  Future<Either<Failure, ListPemakaianEntity>> getAllPeralatanByMonth(
      String noOrder, String year, String month);
  Future<Either<Failure, GeneratePDFEntity>> getDownloadPDFMonthly(
      String noOrder, String year, String month);
}
