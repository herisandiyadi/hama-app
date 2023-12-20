import 'package:hama_app/domain/entities/inspeksi/inspeksi_entity.dart';

class InspeksiResponse {
  final int id;
  final String lokasi;
  final String rekomendasi;
  final String tanggal;
  final String buktiFoto;
  final String keterangan;
  final String noOrder;
  final DateTime updatedAt;
  final DateTime createdAt;

  InspeksiResponse({
    required this.id,
    required this.lokasi,
    required this.rekomendasi,
    required this.tanggal,
    required this.buktiFoto,
    required this.keterangan,
    required this.noOrder,
    required this.updatedAt,
    required this.createdAt,
  });

  factory InspeksiResponse.fromJson(Map<String, dynamic> json) =>
      InspeksiResponse(
        id: json["id"],
        lokasi: json["lokasi"],
        rekomendasi: json["rekomendasi"],
        tanggal: json["tanggal"],
        buktiFoto: json["bukti_foto"],
        keterangan: json["keterangan"],
        noOrder: json["no_order"],
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "lokasi": lokasi,
        "rekomendasi": rekomendasi,
        "tanggal": tanggal,
        "bukti_foto": buktiFoto,
        "keterangan": keterangan,
        "no_order": noOrder,
        "updatedAt": updatedAt.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
      };
  InspeksiEntity toEntity() {
    return InspeksiEntity(
      id: id,
      lokasi: lokasi,
      rekomendasi: rekomendasi,
      tanggal: tanggal,
      buktiFoto: buktiFoto,
      keterangan: keterangan,
      noOrder: noOrder,
      updatedAt: updatedAt,
      createdAt: createdAt,
    );
  }
}
