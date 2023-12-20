import 'package:hama_app/data/models/daily/daily_response.dart';
import 'package:hama_app/domain/entities/daily/list_daily_entity.dart';

class ListDailyResponse {
  final bool success;
  final List<DailyResponse> data;

  ListDailyResponse({
    required this.success,
    required this.data,
  });

  factory ListDailyResponse.fromJson(Map<String, dynamic> json) =>
      ListDailyResponse(
        success: json["success"],
        data: List<DailyResponse>.from(
            json["data"].map((x) => DailyResponse.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };

  ListDailyEntity toEntity() {
    return ListDailyEntity(
        success: success, data: data.map((e) => e.toEntity()).toList());
  }
}
