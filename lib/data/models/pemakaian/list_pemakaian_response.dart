import 'package:hama_app/data/models/pemakaian/pemakaian_response.dart';
import 'package:hama_app/domain/entities/pemakaian/list_pemakaian_entity.dart';

class ListPemakaianResponse {
  final bool success;
  final List<PemakaianResponse> data;

  ListPemakaianResponse({
    required this.success,
    required this.data,
  });

  factory ListPemakaianResponse.fromJson(Map<String, dynamic> json) =>
      ListPemakaianResponse(
        success: json["success"],
        data: List<PemakaianResponse>.from(
            json["data"].map((x) => PemakaianResponse.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
  ListPemakaianEntity toEntity() {
    return ListPemakaianEntity(
        success: success, data: data.map((e) => e.toEntity()).toList());
  }
}
