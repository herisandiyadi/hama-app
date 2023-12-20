import 'package:equatable/equatable.dart';

class InspeksiRequest extends Equatable {
  final String lokasi;
  final String rekomendasi;
  final String tanggal;
  final String keterangan;
  final String buktiFoto;

  InspeksiRequest({
    required this.lokasi,
    required this.rekomendasi,
    required this.tanggal,
    required this.keterangan,
    required this.buktiFoto,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        lokasi,
        rekomendasi,
        tanggal,
        keterangan,
        buktiFoto,
      ];
}
