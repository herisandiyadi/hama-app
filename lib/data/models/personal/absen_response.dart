import 'package:hama_app/domain/entities/personal/absen_entity.dart';

class AbsenResponse {
  final int id;
  final String name;
  final String noOrder;
  final String tanggal;
  final String keterangan;
  final DateTime updatedAt;
  final DateTime createdAt;

  AbsenResponse({
    required this.id,
    required this.name,
    required this.noOrder,
    required this.tanggal,
    required this.keterangan,
    required this.updatedAt,
    required this.createdAt,
  });

  factory AbsenResponse.fromJson(Map<String, dynamic> json) => AbsenResponse(
        id: json["id"],
        name: json["name"],
        noOrder: json["no_order"],
        tanggal: json["tanggal"],
        keterangan: json["keterangan"],
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "no_order": noOrder,
        "tanggal": tanggal,
        "keterangan": keterangan,
        "updatedAt": updatedAt.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
      };

  AbsenEntity toEntity() {
    return AbsenEntity(
      id: id,
      name: name,
      noOrder: noOrder,
      tanggal: tanggal,
      keterangan: keterangan,
      updatedAt: updatedAt,
      createdAt: createdAt,
    );
  }
}
