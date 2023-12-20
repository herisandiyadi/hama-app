import 'package:hama_app/domain/entities/index/index_hama_request.dart';

class IndexHamaModel {
  final String lokasi;
  final String jenisHama;
  final int indeksPopulasi;
  final String tanggal;
  final String status;

  IndexHamaModel({
    required this.lokasi,
    required this.jenisHama,
    required this.indeksPopulasi,
    required this.tanggal,
    required this.status,
  });

  factory IndexHamaModel.fromJson(Map<String, dynamic> json) => IndexHamaModel(
        lokasi: json["lokasi"],
        jenisHama: json["jenis_hama"],
        indeksPopulasi: json["indeks_populasi"],
        tanggal: json["tanggal"],
        status: json["status"],
      );

  factory IndexHamaModel.fromEntity(IndexHamaRequest indexHamaRequest) =>
      IndexHamaModel(
        lokasi: indexHamaRequest.lokasi,
        jenisHama: indexHamaRequest.jenisHama,
        indeksPopulasi: indexHamaRequest.indeksPopulasi,
        tanggal: indexHamaRequest.tanggal,
        status: indexHamaRequest.status,
      );

  Map<String, dynamic> toJson() => {
        "lokasi": lokasi,
        "jenis_hama": jenisHama,
        "indeks_populasi": indeksPopulasi,
        "tanggal": tanggal,
        "status": status,
      };
  IndexHamaRequest toEntity() {
    return IndexHamaRequest(
      lokasi: lokasi,
      jenisHama: jenisHama,
      indeksPopulasi: indeksPopulasi,
      tanggal: tanggal,
      status: status,
    );
  }
}
