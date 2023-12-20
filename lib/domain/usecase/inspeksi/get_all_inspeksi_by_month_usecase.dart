import 'package:dartz/dartz.dart';
import 'package:hama_app/common/utils/failure.dart';
import 'package:hama_app/domain/entities/inspeksi/list_inspeksi_entity.dart';
import 'package:hama_app/domain/repositories/inspeksi_repository.dart';

class GetAllInspeksiByMonthUsecase {
  final InspeksiRepository repository;

  GetAllInspeksiByMonthUsecase(this.repository);

  Future<Either<Failure, ListInspeksiEntity>> execute(
      String noOrder, String year, String month) {
    final response = repository.getAllInspeksiByMonth(noOrder, year, month);
    return response;
  }
}
