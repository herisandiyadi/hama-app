import 'package:hama_app/data/models/peralatan/peralatan_response.dart';
import 'package:hama_app/domain/entities/peralatan/list_peralatan_entity.dart';

class ListPeralatanResponse {
  final bool success;
  final List<PeralatanResponse> data;

  ListPeralatanResponse({
    required this.success,
    required this.data,
  });

  factory ListPeralatanResponse.fromJson(Map<String, dynamic> json) =>
      ListPeralatanResponse(
        success: json["success"],
        data: List<PeralatanResponse>.from(
            json["data"].map((x) => PeralatanResponse.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
  ListPeralatanEntity toEntity() {
    return ListPeralatanEntity(
        success: success, data: data.map((e) => e.toEntity()).toList());
  }
}
