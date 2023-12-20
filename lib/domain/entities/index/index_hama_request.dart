import 'package:equatable/equatable.dart';

class IndexHamaRequest extends Equatable {
  final String lokasi;
  final String jenisHama;
  final int indeksPopulasi;
  final String tanggal;
  final String status;

  IndexHamaRequest({
    required this.lokasi,
    required this.jenisHama,
    required this.indeksPopulasi,
    required this.tanggal,
    required this.status,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        lokasi,
        jenisHama,
        indeksPopulasi,
        tanggal,
        status,
      ];
}
