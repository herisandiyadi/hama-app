import 'package:equatable/equatable.dart';

class PeralatanRequest extends Equatable {
  final String name;
  final String noOrder;
  final String merek;
  final int jumlah;
  final String satuan;
  final String kondisi;
  final String tanggal;

  PeralatanRequest({
    required this.name,
    required this.noOrder,
    required this.merek,
    required this.jumlah,
    required this.satuan,
    required this.kondisi,
    required this.tanggal,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        name,
        noOrder,
        merek,
        jumlah,
        satuan,
        kondisi,
        tanggal,
      ];
}
