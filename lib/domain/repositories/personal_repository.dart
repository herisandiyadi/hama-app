import 'package:dartz/dartz.dart';
import 'package:hama_app/common/utils/failure.dart';
import 'package:hama_app/domain/entities/personal/absen_entity.dart';
import 'package:hama_app/domain/entities/personal/absen_request.dart';
import 'package:hama_app/domain/entities/personal/data_absen_entity.dart';
import 'package:hama_app/domain/entities/personal/personal_entity.dart';

abstract class PersonalRepository {
  Future<Either<Failure, PersonalEntity>> addPersonal(
      String noOrder, String name);
  Future<Either<Failure, ListPersonelEntity>> getAllPersonal(String noOrder);
  Future<Either<Failure, String>> updatePersonal(
      String noOrder, String id, String name);
  Future<Either<Failure, String>> deletePersonal(String noOrder, String id);
  Future<Either<Failure, AbsenEntity>> addAbsen(AbsenRequest absenRequest);
  Future<Either<Failure, DataAbsenEntity>> getAbsenById(
      String noOrder, String id);
  Future<Either<Failure, DataAbsenEntity>> getAbsenByDate(
      String noOrder, String date);
}
