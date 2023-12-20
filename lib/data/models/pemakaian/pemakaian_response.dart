import 'package:hama_app/domain/entities/pemakaian/pemakaian_entity.dart';

class PemakaianResponse {
  final int id;
  final String name;
  final String bahanAktif;
  final String merk;
  final int stokAwal;
  final String satuan;
  final String tanggal;
  final int ins;
  final String noOrder;
  final int out;
  final int stokAkhir;
  final String satuanb;
  final DateTime updatedAt;
  final DateTime createdAt;

  PemakaianResponse({
    required this.id,
    required this.name,
    required this.bahanAktif,
    required this.merk,
    required this.stokAwal,
    required this.satuan,
    required this.tanggal,
    required this.ins,
    required this.noOrder,
    required this.out,
    required this.stokAkhir,
    required this.satuanb,
    required this.updatedAt,
    required this.createdAt,
  });

  factory PemakaianResponse.fromJson(Map<String, dynamic> json) =>
      PemakaianResponse(
        id: json["id"],
        name: json["name"],
        bahanAktif: json["bahan_aktif"],
        merk: json["merk"],
        stokAwal: json["stok_awal"],
        satuan: json["satuan"],
        tanggal: json["tanggal"],
        ins: json["ins"],
        noOrder: json["no_order"],
        out: json["out"],
        stokAkhir: json["stok_akhir"],
        satuanb: json["satuanb"],
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "bahan_aktif": bahanAktif,
        "merk": merk,
        "stok_awal": stokAwal,
        "satuan": satuan,
        "tanggal": tanggal,
        "ins": ins,
        "no_order": noOrder,
        "out": out,
        "stok_akhir": stokAkhir,
        "satuanb": satuanb,
        "updatedAt": updatedAt.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
      };
  PemakaianEntity toEntity() {
    return PemakaianEntity(
      id: id,
      name: name,
      bahanAktif: bahanAktif,
      merk: merk,
      stokAwal: stokAwal,
      satuan: satuan,
      tanggal: tanggal,
      ins: ins,
      noOrder: noOrder,
      out: out,
      stokAkhir: stokAkhir,
      satuanb: satuanb,
      updatedAt: updatedAt,
      createdAt: createdAt,
    );
  }
}
