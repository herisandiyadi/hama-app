import 'package:equatable/equatable.dart';

class InspeksiEntity extends Equatable {
  final int id;
  final String lokasi;
  final String rekomendasi;
  final String tanggal;
  final String buktiFoto;
  final String keterangan;
  final String noOrder;
  final DateTime updatedAt;
  final DateTime createdAt;

  InspeksiEntity({
    required this.id,
    required this.lokasi,
    required this.rekomendasi,
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
        lokasi,
        rekomendasi,
        tanggal,
        buktiFoto,
        keterangan,
        noOrder,
        updatedAt,
        createdAt,
      ];
}
