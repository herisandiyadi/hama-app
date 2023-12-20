import 'package:hama_app/domain/entities/daily/daily_request.dart';

class DailyModel {
  final String lokasi;
  final String jenisTreatment;
  final String hamaDitemukan;
  final int jumlah;
  final String tanggal;
  final String keterangan;
  final String buktiFoto;

  DailyModel({
    required this.lokasi,
    required this.jenisTreatment,
    required this.hamaDitemukan,
    required this.jumlah,
    required this.tanggal,
    required this.keterangan,
    required this.buktiFoto,
  });

  factory DailyModel.fromJson(Map<String, dynamic> json) => DailyModel(
        lokasi: json["lokasi"],
        jenisTreatment: json["jenis_treatment"],
        hamaDitemukan: json["hama_ditemukan"],
        jumlah: json["jumlah"],
        tanggal: json["tanggal"],
        keterangan: json["keterangan"],
        buktiFoto: json["bukti_foto"],
      );

  factory DailyModel.fromEntity(DailyRequest daily) => DailyModel(
        lokasi: daily.lokasi,
        jenisTreatment: daily.jenisTreatment,
        hamaDitemukan: daily.hamaDitemukan,
        jumlah: daily.jumlah,
        tanggal: daily.tanggal,
        keterangan: daily.keterangan,
        buktiFoto: daily.buktiFoto,
      );

  Map<String, dynamic> toJson() => {
        "lokasi": lokasi,
        "jenis_treatment": jenisTreatment,
        "hama_ditemukan": hamaDitemukan,
        "jumlah": jumlah,
        "tanggal": tanggal,
        "keterangan": keterangan,
        "bukti_foto": buktiFoto,
      };
  DailyRequest toEntity() {
    return DailyRequest(
      lokasi: lokasi,
      jenisTreatment: jenisTreatment,
      hamaDitemukan: hamaDitemukan,
      jumlah: jumlah,
      tanggal: tanggal,
      keterangan: keterangan,
      buktiFoto: buktiFoto,
    );
  }
}
