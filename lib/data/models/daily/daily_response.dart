import 'package:hama_app/domain/entities/daily/daily_entity.dart';

class DailyResponse {
  final int id;
  final String name;
  final String lokasi;
  final String jenisTreatment;
  final String hamaDitemukan;
  final String jumlah;
  final String tanggal;
  final String buktiFoto;
  final String keterangan;
  final String noOrder;
  final DateTime updatedAt;
  final DateTime createdAt;

  DailyResponse({
    required this.id,
    required this.name,
    required this.lokasi,
    required this.jenisTreatment,
    required this.hamaDitemukan,
    required this.jumlah,
    required this.tanggal,
    required this.buktiFoto,
    required this.keterangan,
    required this.noOrder,
    required this.updatedAt,
    required this.createdAt,
  });

  factory DailyResponse.fromJson(Map<String, dynamic> json) => DailyResponse(
        id: json["id"],
        name: json["name"],
        lokasi: json["lokasi"],
        jenisTreatment: json["jenis_treatment"],
        hamaDitemukan: json["hama_ditemukan"],
        jumlah: json["jumlah"],
        tanggal: json["tanggal"],
        buktiFoto: json["bukti_foto"],
        keterangan: json["keterangan"],
        noOrder: json["no_order"],
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "lokasi": lokasi,
        "jenis_treatment": jenisTreatment,
        "hama_ditemukan": hamaDitemukan,
        "jumlah": jumlah,
        "tanggal": tanggal,
        "bukti_foto": buktiFoto,
        "keterangan": keterangan,
        "no_order": noOrder,
        "updatedAt": updatedAt.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
      };

  DailyEntity toEntity() {
    return DailyEntity(
      id: id,
      name: name,
      lokasi: lokasi,
      jenisTreatment: jenisTreatment,
      hamaDitemukan: hamaDitemukan,
      jumlah: jumlah,
      tanggal: tanggal,
      buktiFoto: buktiFoto,
      keterangan: keterangan,
      noOrder: noOrder,
      updatedAt: updatedAt,
      createdAt: createdAt,
    );
  }
}
