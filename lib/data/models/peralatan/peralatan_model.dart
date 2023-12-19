import 'package:hama_app/domain/entities/peralatan/peralatan_entity.dart';
import 'package:hama_app/domain/entities/peralatan/peralatan_request.dart';

class PeralatanModel {
  final String name;
  final String noOrder;
  final String merek;
  final int jumlah;
  final String satuan;
  final String kondisi;
  final String tanggal;

  PeralatanModel({
    required this.name,
    required this.noOrder,
    required this.merek,
    required this.jumlah,
    required this.satuan,
    required this.kondisi,
    required this.tanggal,
  });

  factory PeralatanModel.fromJson(Map<String, dynamic> json) => PeralatanModel(
        name: json["name"],
        noOrder: json["no_order"],
        merek: json["merek"],
        jumlah: json["jumlah"],
        satuan: json["satuan"],
        kondisi: json["kondisi"],
        tanggal: json["tanggal"],
      );
  factory PeralatanModel.fromEntity(PeralatanRequest data) => PeralatanModel(
        name: data.name,
        noOrder: data.noOrder,
        merek: data.merek,
        jumlah: data.jumlah,
        satuan: data.satuan,
        kondisi: data.kondisi,
        tanggal: data.tanggal,
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "no_order": noOrder,
        "merek": merek,
        "jumlah": jumlah,
        "satuan": satuan,
        "kondisi": kondisi,
        "tanggal": tanggal,
      };
  PeralatanRequest toEntity() {
    return PeralatanRequest(
      name: name,
      noOrder: noOrder,
      merek: merek,
      jumlah: jumlah,
      satuan: satuan,
      kondisi: kondisi,
      tanggal: tanggal,
    );
  }
}
