import 'package:hama_app/domain/entities/personal/data_absen_entity.dart';

class DataAbsenResponse {
  final bool success;
  final List<Data> data;

  DataAbsenResponse({
    required this.success,
    required this.data,
  });

  factory DataAbsenResponse.fromJson(Map<String, dynamic> json) =>
      DataAbsenResponse(
        success: json["success"],
        data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
  DataAbsenEntity toEntity() {
    return DataAbsenEntity(
      success: success,
      data: data.map((e) => e.toEntity()).toList(),
    );
  }
}

class Data {
  final int id;
  final String name;
  final DateTime tanggal;
  final String noOrder;
  final String keterangan;
  final DateTime createdAt;
  final DateTime updatedAt;

  Data({
    required this.id,
    required this.name,
    required this.tanggal,
    required this.noOrder,
    required this.keterangan,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        tanggal: DateTime.parse(json["tanggal"]),
        noOrder: json["no_order"],
        keterangan: json["keterangan"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "tanggal":
            "${tanggal.year.toString().padLeft(4, '0')}-${tanggal.month.toString().padLeft(2, '0')}-${tanggal.day.toString().padLeft(2, '0')}",
        "no_order": noOrder,
        "keterangan": keterangan,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
  DataEntity toEntity() {
    return DataEntity(
      id: id,
      name: name,
      tanggal: tanggal,
      noOrder: noOrder,
      keterangan: keterangan,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
