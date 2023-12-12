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
  final DateTime updatedAt;
  final DateTime createdAt;

  OrderData({
    required this.id,
    required this.noOrder,
    required this.updatedAt,
    required this.createdAt,
  });

  factory OrderData.fromJson(Map<String, dynamic> json) => OrderData(
        id: json["id"],
        noOrder: json["no_order"],
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "no_order": noOrder,
        "updatedAt": updatedAt.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
      };
  OrderDataEntity toEntity() {
    return OrderDataEntity(
      id: id,
      noOrder: noOrder,
      updatedAt: updatedAt,
      createdAt: createdAt,
    );
  }
}
