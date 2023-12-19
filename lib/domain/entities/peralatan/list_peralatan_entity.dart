import 'package:equatable/equatable.dart';
import 'package:hama_app/domain/entities/peralatan/peralatan_entity.dart';

class ListPeralatanEntity extends Equatable {
  final bool success;
  final List<PeralatanEntity> data;

  ListPeralatanEntity({required this.success, required this.data});
  @override
  List<Object?> get props => [success, data];
}
