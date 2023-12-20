import 'package:equatable/equatable.dart';
import 'package:hama_app/domain/entities/daily/daily_entity.dart';

class ListDailyEntity extends Equatable {
  final bool success;
  final List<DailyEntity> data;

  const ListDailyEntity({required this.success, required this.data});

  @override
  List<Object?> get props => [
        success,
        data,
      ];
}
