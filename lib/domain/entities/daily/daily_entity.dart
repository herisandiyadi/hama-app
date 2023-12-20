import 'package:equatable/equatable.dart';

class DailyEntity extends Equatable {
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

  DailyEntity({
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

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        name,
        lokasi,
        jenisTreatment,
        hamaDitemukan,
        jumlah,
        tanggal,
        buktiFoto,
        keterangan,
        noOrder,
        updatedAt,
        createdAt,
      ];
}
