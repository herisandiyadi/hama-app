import 'package:dartz/dartz.dart';
import 'package:hama_app/common/utils/failure.dart';
import 'package:hama_app/domain/entities/inspeksi/list_inspeksi_entity.dart';
import 'package:hama_app/domain/repositories/inspeksi_repository.dart';

class GetAllInspeksiByDateUsecase {
  final InspeksiRepository repository;

  GetAllInspeksiByDateUsecase(this.repository);

  Future<Either<Failure, ListInspeksiEntity>> execute(
      String noOrder, String date) {
    final response = repository.getAllInspeksiByDate(noOrder, date);
    return response;
  }
}
