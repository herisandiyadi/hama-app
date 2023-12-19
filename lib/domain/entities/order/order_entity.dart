// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class OrderEntity extends Equatable {
  final String message;
  final OrderDataEntity data;

  const OrderEntity({required this.message, required this.data});

  @override
  List<Object?> get props => [
        message,
        data,
      ];
}

class OrderDataEntity extends Equatable {
  final int id;
  final String noOrder;
  final int idUser;
  final String clientName;
  final DateTime updatedAt;
  final DateTime createdAt;

  const OrderDataEntity({
    required this.id,
    required this.noOrder,
    required this.idUser,
    required this.clientName,
    required this.updatedAt,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
        id,
        noOrder,
        idUser,
        clientName,
        updatedAt,
        createdAt,
      ];
}
