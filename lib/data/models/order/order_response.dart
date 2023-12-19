// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hama_app/domain/entities/order/order_entity.dart';

class OrderResponse {
  final String message;
  final OrderData data;

  OrderResponse({
    required this.message,
    required this.data,
  });

  factory OrderResponse.fromJson(Map<String, dynamic> json) => OrderResponse(
        message: json["message"],
        data: OrderData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data.toJson(),
      };
  OrderEntity toEntity() {
    return OrderEntity(message: message, data: data.toEntity());
  }
}

class OrderData {
  final int id;
  final String noOrder;
  final int idUser;
  final String clientName;
  final DateTime updatedAt;
  final DateTime createdAt;

  OrderData({
    required this.id,
    required this.noOrder,
    required this.idUser,
    required this.clientName,
    required this.updatedAt,
    required this.createdAt,
  });

  factory OrderData.fromJson(Map<String, dynamic> json) => OrderData(
        id: json["id"],
        noOrder: json["no_order"],
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdAt: DateTime.parse(json["createdAt"]),
        idUser: json["id_user"],
        clientName: json["client_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "no_order": noOrder,
        "updatedAt": updatedAt.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
        "id_user": idUser,
        "client_name": clientName,
      };
  OrderDataEntity toEntity() {
    return OrderDataEntity(
      id: id,
      noOrder: noOrder,
      updatedAt: updatedAt,
      createdAt: createdAt,
      idUser: idUser,
      clientName: clientName,
    );
  }
}
