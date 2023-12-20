import 'package:hama_app/domain/entities/index/index_hama_entity.dart';

class IndexHamaResponse {
  final int id;
  final String lokasi;
  final String jenisHama;
  final int indeksPopulasi;
  final DateTime tanggal;
  final String status;
  final String noOrder;
  final DateTime updatedAt;
  final DateTime createdAt;

  IndexHamaResponse({
    required this.id,
    required this.lokasi,
    required this.jenisHama,
    required this.indeksPopulasi,
    required this.tanggal,
    required this.status,
    required this.noOrder,
    required this.updatedAt,
    required this.createdAt,
  });

  factory IndexHamaResponse.fromJson(Map<String, dynamic> json) =>
      IndexHamaResponse(
        id: json["id"],
        lokasi: json["lokasi"],
        jenisHama: json["jenis_hama"],
        indeksPopulasi: json["indeks_populasi"],
        tanggal: DateTime.parse(json["tanggal"]),
        status: json["status"],
        noOrder: json["no_order"],
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "lokasi": lokasi,
        "jenis_hama": jenisHama,
        "indeks_populasi": indeksPopulasi,
        "tanggal":
            "${tanggal.year.toString().padLeft(4, '0')}-${tanggal.month.toString().padLeft(2, '0')}-${tanggal.day.toString().padLeft(2, '0')}",
        "status": status,
        "no_order": noOrder,
        "updatedAt": updatedAt.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
      };

  IndexHamaEntity toEntity() {
    return IndexHamaEntity(
      id: id,
      lokasi: lokasi,
      jenisHama: jenisHama,
      indeksPopulasi: indeksPopulasi,
      tanggal: tanggal,
      status: status,
      noOrder: noOrder,
      updatedAt: updatedAt,
      createdAt: createdAt,
    );
  }
}
