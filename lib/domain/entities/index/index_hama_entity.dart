import 'package:equatable/equatable.dart';

class IndexHamaEntity extends Equatable {
  final int id;
  final String lokasi;
  final String jenisHama;
  final int indeksPopulasi;
  final DateTime tanggal;
  final String status;
  final String noOrder;
  final DateTime updatedAt;
  final DateTime createdAt;

  IndexHamaEntity({
    required this.id,
    required this.lokasi,
    required this.jenisHama,
    required this.indeksPopulasi,
    required this.tanggal,
    required this.status,
    required this.noOrder,
    required this.updatedAt,
    required this.createdAt,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        lokasi,
        jenisHama,
        indeksPopulasi,
        tanggal,
        status,
        noOrder,
        updatedAt,
        createdAt,
      ];
}
