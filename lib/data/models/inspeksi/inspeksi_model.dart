import 'package:hama_app/domain/entities/inspeksi/inspeksi_request.dart';

class InspeksiModel {
  final String lokasi;
  final String rekomendasi;
  final String tanggal;
  final String keterangan;
  final String buktiFoto;

  InspeksiModel({
    required this.lokasi,
    required this.rekomendasi,
    required this.tanggal,
    required this.keterangan,
    required this.buktiFoto,
  });

  factory InspeksiModel.fromJson(Map<String, dynamic> json) => InspeksiModel(
        lokasi: json["lokasi"],
        rekomendasi: json["rekomendasi"],
        tanggal: json["tanggal"],
        keterangan: json["keterangan"],
        buktiFoto: json["bukti_foto"],
      );
  factory InspeksiModel.fromEntity(InspeksiRequest inspeksi) => InspeksiModel(
        lokasi: inspeksi.lokasi,
        rekomendasi: inspeksi.rekomendasi,
        tanggal: inspeksi.tanggal,
        keterangan: inspeksi.keterangan,
        buktiFoto: inspeksi.buktiFoto,
      );

  Map<String, dynamic> toJson() => {
        "lokasi": lokasi,
        "rekomendasi": rekomendasi,
        "tanggal": tanggal,
        "keterangan": keterangan,
        "bukti_foto": buktiFoto,
      };
  InspeksiRequest toEntity() {
    return InspeksiRequest(
      lokasi: lokasi,
      rekomendasi: rekomendasi,
      tanggal: tanggal,
      keterangan: keterangan,
      buktiFoto: buktiFoto,
    );
  }
}
