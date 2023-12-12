import 'package:equatable/equatable.dart';
import 'package:hama_app/domain/entities/order/order_entity.dart';

class ListOrderEntity extends Equatable {
  final bool success;
  final List<OrderDataEntity> data;

  const ListOrderEntity({required this.success, required this.data});

  @override
  List<Object?> get props => [
        success,
        data,
      ];
}
