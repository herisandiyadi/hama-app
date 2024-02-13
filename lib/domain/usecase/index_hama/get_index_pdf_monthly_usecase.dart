import 'package:dartz/dartz.dart';
import 'package:hama_app/common/utils/failure.dart';
import 'package:hama_app/domain/entities/daily/generate_pdf_entity.dart';
import 'package:hama_app/domain/repositories/index_hama_repository.dart';

class GetIndexPdfMonthlyUsecase {
  final IndexHamaRepository repository;

  GetIndexPdfMonthlyUsecase(this.repository);

  Future<Either<Failure, GeneratePDFEntity>> execute(
      String noOrder, String year, String month) {
    final response = repository.getDownloadPDFMonthly(noOrder, year, month);
    return response;
  }
}
