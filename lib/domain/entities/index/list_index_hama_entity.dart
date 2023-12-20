import 'package:equatable/equatable.dart';
import 'package:hama_app/domain/entities/index/index_hama_entity.dart';

class ListIndexHamaEntity extends Equatable {
  final bool success;
  final List<IndexHamaEntity> data;

  const ListIndexHamaEntity({required this.success, required this.data});

  @override
  // TODO: implement props
  List<Object?> get props => [success, data];
}
