import 'package:hama_app/domain/entities/peralatan/peralatan_entity.dart';

class PeralatanResponse {
  final int id;
  final String name;
  final String noOrder;
  final String merek;
  final int jumlah;
  final String satuan;
  final String kondisi;
  final String tanggal;
  final DateTime updatedAt;
  final DateTime createdAt;

  PeralatanResponse({
    required this.id,
    required this.name,
    required this.noOrder,
    required this.merek,
    required this.jumlah,
    required this.satuan,
    required this.kondisi,
    required this.tanggal,
    required this.updatedAt,
    required this.createdAt,
  });

  factory PeralatanResponse.fromJson(Map<String, dynamic> json) =>
      PeralatanResponse(
        id: json["id"],
        name: json["name"],
        noOrder: json["no_order"],
        merek: json["merek"],
        jumlah: json["jumlah"],
        satuan: json["satuan"],
        kondisi: json["kondisi"],
        tanggal: json["tanggal"],
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "no_order": noOrder,
        "merek": merek,
        "jumlah": jumlah,
        "satuan": satuan,
        "kondisi": kondisi,
        "tanggal": tanggal,
        "updatedAt": updatedAt.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
      };

  PeralatanEntity toEntity() {
    return PeralatanEntity(
      id: id,
      name: name,
      noOrder: noOrder,
      merek: merek,
      jumlah: jumlah,
      satuan: satuan,
      kondisi: kondisi,
      tanggal: tanggal,
      updatedAt: updatedAt,
      createdAt: createdAt,
    );
  }
}
