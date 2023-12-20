import 'package:equatable/equatable.dart';
import 'package:hama_app/domain/entities/pemakaian/pemakaian_entity.dart';

class ListPemakaianEntity extends Equatable {
  final bool success;
  final List<PemakaianEntity> data;

  ListPemakaianEntity({required this.success, required this.data});

  @override
  // TODO: implement props
  List<Object?> get props => [success, data];
}
