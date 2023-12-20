import 'package:equatable/equatable.dart';
import 'package:hama_app/domain/entities/inspeksi/inspeksi_entity.dart';

class ListInspeksiEntity extends Equatable {
  final bool success;
  final List<InspeksiEntity> data;

  const ListInspeksiEntity({required this.success, required this.data});

  @override
  List<Object?> get props => [success, data];
}
