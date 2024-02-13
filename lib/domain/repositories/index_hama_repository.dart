import 'package:dartz/dartz.dart';
import 'package:hama_app/common/utils/failure.dart';
import 'package:hama_app/domain/entities/daily/generate_pdf_entity.dart';
import 'package:hama_app/domain/entities/index/index_hama_entity.dart';
import 'package:hama_app/domain/entities/index/index_hama_request.dart';
import 'package:hama_app/domain/entities/index/list_index_hama_entity.dart';

abstract class IndexHamaRepository {
  Future<Either<Failure, IndexHamaEntity>> addFormIndexHama(
      IndexHamaRequest indexHamaRequest, String noOrder);
  Future<Either<Failure, ListIndexHamaEntity>> getAllIndexHama(String noOrder);
  Future<Either<Failure, ListIndexHamaEntity>> getAllIndexHamaByDate(
      String noOrder, String tanggal);
  Future<Either<Failure, ListIndexHamaEntity>> getAllIndexHamaByMonth(
      String noOrder, String year, String month);
  Future<Either<Failure, GeneratePDFEntity>> getDownloadPDFMonthly(
      String noOrder, String year, String month);
}
