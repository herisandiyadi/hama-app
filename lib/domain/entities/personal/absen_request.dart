import 'package:equatable/equatable.dart';

class AbsenRequest extends Equatable {
  final String idPerson;
  final DateTime tanggal;
  final String keterangan;
  final String noOrder;

  const AbsenRequest({
    required this.idPerson,
    required this.tanggal,
    required this.keterangan,
    required this.noOrder,
  });

  @override
  List<Object?> get props => [idPerson, tanggal, keterangan, noOrder];
}
