import 'package:dartz/dartz.dart';
import 'package:hama_app/common/utils/failure.dart';
import 'package:hama_app/domain/entities/peralatan/list_peralatan_entity.dart';
import 'package:hama_app/domain/entities/peralatan/peralatan_entity.dart';
import 'package:hama_app/domain/entities/peralatan/peralatan_request.dart';

abstract class PeralatanRepository {
  Future<Either<Failure, PeralatanEntity>> addPeralatan(
      PeralatanRequest peralatanRequest);
  Future<Either<Failure, ListPeralatanEntity>> getAllPeralatan(String noOrder);
  Future<Either<Failure, ListPeralatanEntity>> getAllPeralatanByDate(
      String noOrder, String date);
  Future<Either<Failure, ListPeralatanEntity>> getAllPeralatanByMonth(
      String noOrder, String year, String month);
}
