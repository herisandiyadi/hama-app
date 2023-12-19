import 'package:equatable/equatable.dart';

class PeralatanEntity extends Equatable {
  final int id;
  final String name;
  final String noOrder;
  final String merek;
  final int jumlah;
  final String satuan;
  final String kondisi;
  final String tanggal;
  final DateTime updatedAt;
  final DateTime createdAt;

  PeralatanEntity({
    required this.id,
    required this.name,
    required this.noOrder,
    required this.merek,
    required this.jumlah,
    required this.satuan,
    required this.kondisi,
    required this.tanggal,
    required this.updatedAt,
    required this.createdAt,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        name,
        noOrder,
        merek,
        jumlah,
        satuan,
        kondisi,
        tanggal,
        updatedAt,
        createdAt,
      ];
}
