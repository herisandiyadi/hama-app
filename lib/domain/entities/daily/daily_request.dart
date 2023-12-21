import 'package:equatable/equatable.dart';

class DailyRequest extends Equatable {
  final String lokasi;
  final String jenisTreatment;
  final String hamaDitemukan;
  final String jumlah;
  final String tanggal;
  final String keterangan;
  final String buktiFoto;

  DailyRequest({
    required this.lokasi,
    required this.jenisTreatment,
    required this.hamaDitemukan,
    required this.jumlah,
    required this.tanggal,
    required this.keterangan,
    required this.buktiFoto,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        lokasi,
        jenisTreatment,
        hamaDitemukan,
        jumlah,
        tanggal,
        keterangan,
        buktiFoto,
      ];
}
