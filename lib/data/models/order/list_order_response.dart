import 'package:hama_app/data/models/order/order_response.dart';
import 'package:hama_app/domain/entities/order/list_order_entity.dart';
import 'package:hama_app/domain/entities/order/order_entity.dart';

class ListOrderResponse {
  final bool success;
  final List<OrderData> data;

  ListOrderResponse({
    required this.success,
    required this.data,
  });

  factory ListOrderResponse.fromJson(Map<String, dynamic> json) =>
      ListOrderResponse(
        success: json["success"],
        data: List<OrderData>.from(
            json["data"].map((x) => OrderData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
  ListOrderEntity toEntity() {
    return ListOrderEntity(
        success: success, data: data.map((e) => e.toEntity()).toList());
  }
}
