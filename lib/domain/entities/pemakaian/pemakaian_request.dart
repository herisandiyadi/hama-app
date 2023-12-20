import 'package:equatable/equatable.dart';

class PemakaianRequest extends Equatable {
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

  PemakaianRequest({
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

  @override
  // TODO: implement props
  List<Object?> get props => [
        name,
        bahanAktif,
        merk,
        stokAwal,
        satuan,
        tanggal,
        ins,
        noOrder,
        out,
        stokAkhir,
        satuanb,
      ];
}
