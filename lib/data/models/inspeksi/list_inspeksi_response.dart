import 'package:hama_app/data/models/inspeksi/inspeksi_response.dart';
import 'package:hama_app/domain/entities/inspeksi/list_inspeksi_entity.dart';

class ListInspeksiResponse {
  final bool success;
  final List<InspeksiResponse> data;

  ListInspeksiResponse({
    required this.success,
    required this.data,
  });

  factory ListInspeksiResponse.fromJson(Map<String, dynamic> json) =>
      ListInspeksiResponse(
        success: json["success"],
        data: List<InspeksiResponse>.from(
            json["data"].map((x) => InspeksiResponse.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };

  ListInspeksiEntity toEntity() {
    return ListInspeksiEntity(
        success: success, data: data.map((e) => e.toEntity()).toList());
  }
}
