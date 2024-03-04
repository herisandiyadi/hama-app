import 'package:dartz/dartz.dart';
import 'package:hama_app/common/utils/failure.dart';
import 'package:hama_app/domain/entities/daily/generate_pdf_entity.dart';
import 'package:hama_app/domain/repositories/peralatan_repository.dart';

class GetPeralatanMonthlyUsecase {
  final PeralatanRepository repository;

  GetPeralatanMonthlyUsecase(this.repository);

  Future<Either<Failure, GeneratePDFEntity>> execute(
      String noOrder, String year, String month) {
    final response = repository.getDownloadPDFMonthly(noOrder, year, month);
    return response;
  }
}
