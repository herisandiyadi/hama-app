import 'package:hama_app/data/models/index/index_hama_response.dart';
import 'package:hama_app/domain/entities/index/list_index_hama_entity.dart';

class ListIndexHamaResponse {
  final bool success;
  final List<IndexHamaResponse> data;

  ListIndexHamaResponse({
    required this.success,
    required this.data,
  });

  factory ListIndexHamaResponse.fromJson(Map<String, dynamic> json) =>
      ListIndexHamaResponse(
        success: json["success"],
        data: List<IndexHamaResponse>.from(
            json["data"].map((x) => IndexHamaResponse.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
  ListIndexHamaEntity toEntity() {
    return ListIndexHamaEntity(
        success: success, data: data.map((e) => e.toEntity()).toList());
  }
}
