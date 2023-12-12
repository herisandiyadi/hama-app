import 'package:hama_app/domain/entities/personal/personal_entity.dart';

class ListPersonelResponse {
  final bool success;
  final List<PersonalResponse> data;

  ListPersonelResponse({
    required this.success,
    required this.data,
  });

  factory ListPersonelResponse.fromJson(Map<String, dynamic> json) =>
      ListPersonelResponse(
        success: json["success"],
        data: List<PersonalResponse>.from(
            json["data"].map((x) => PersonalResponse.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
  ListPersonelEntity toEntity() {
    return ListPersonelEntity(
        success: success, data: data.map((e) => e.toEntity()).toList());
  }
}

class PersonalResponse {
  final int id;
  final String name;
  final String noOrder;
  final DateTime updatedAt;
  final DateTime createdAt;

  PersonalResponse({
    required this.id,
    required this.name,
    required this.noOrder,
    required this.updatedAt,
    required this.createdAt,
  });

  factory PersonalResponse.fromJson(Map<String, dynamic> json) =>
      PersonalResponse(
        id: json["id"],
        name: json["name"],
        noOrder: json["no_order"],
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "no_order": noOrder,
        "updatedAt": updatedAt.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
      };
  PersonalEntity toEntity() {
    return PersonalEntity(
      id: id,
      name: name,
      noOrder: noOrder,
      updatedAt: updatedAt,
      createdAt: createdAt,
    );
  }
}
