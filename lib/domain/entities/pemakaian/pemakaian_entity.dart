// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class PemakaianEntity extends Equatable {
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
  PemakaianEntity({
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

  @override
  List<Object?> get props => [
        id,
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
        updatedAt,
        createdAt,
      ];
}
