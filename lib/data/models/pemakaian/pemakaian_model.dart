import 'package:hama_app/domain/entities/pemakaian/pemakaian_request.dart';

class PemakaianModel {
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

  PemakaianModel({
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
  });

  factory PemakaianModel.fromJson(Map<String, dynamic> json) => PemakaianModel(
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
      );

  factory PemakaianModel.fromEntity(PemakaianRequest request) => PemakaianModel(
        name: request.name,
        bahanAktif: request.bahanAktif,
        merk: request.merk,
        stokAwal: request.stokAwal,
        satuan: request.satuan,
        tanggal: request.tanggal,
        ins: request.ins,
        noOrder: request.noOrder,
        out: request.out,
        stokAkhir: request.stokAkhir,
        satuanb: request.satuanb,
      );

  Map<String, dynamic> toJson() => {
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
      };
  PemakaianRequest toEntity() {
    return PemakaianRequest(
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
    );
  }
}
