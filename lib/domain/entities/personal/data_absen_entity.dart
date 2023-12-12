import 'package:equatable/equatable.dart';

class DataAbsenEntity extends Equatable {
  final bool success;
  final List<DataEntity> data;

  const DataAbsenEntity({required this.success, required this.data});

  @override
  List<Object?> get props => [success, data];
}

class DataEntity extends Equatable {
  final int id;
  final String name;
  final DateTime tanggal;
  final String noOrder;
  final String keterangan;
  final DateTime createdAt;
  final DateTime updatedAt;

  const DataEntity({
    required this.id,
    required this.name,
    required this.tanggal,
    required this.noOrder,
    required this.keterangan,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        tanggal,
        noOrder,
        keterangan,
        createdAt,
        updatedAt,
      ];
}
