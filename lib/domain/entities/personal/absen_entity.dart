import 'package:equatable/equatable.dart';

class AbsenEntity extends Equatable {
  final int id;
  final String name;
  final String noOrder;
  final String tanggal;
  final String keterangan;
  final DateTime updatedAt;
  final DateTime createdAt;

  const AbsenEntity({
    required this.id,
    required this.name,
    required this.noOrder,
    required this.tanggal,
    required this.keterangan,
    required this.updatedAt,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        noOrder,
        tanggal,
        keterangan,
        updatedAt,
        createdAt,
      ];
}
