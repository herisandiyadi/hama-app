import 'package:hama_app/domain/entities/signature/signature_entity.dart';

class SignatureResponse {
  final int id;
  final List<int> image;

  SignatureResponse({
    required this.id,
    required this.image,
  });

  factory SignatureResponse.fromJson(Map<String, dynamic> json) =>
      SignatureResponse(
        id: json["id"],
        image: List<int>.from(json["image"].map((x) => x)),
      );

  factory SignatureResponse.fromMap(Map<String, dynamic> map) =>
      SignatureResponse(id: map['id'], image: List<int>.from(map['image']));
  factory SignatureResponse.fromEntity(Map<String, dynamic> map) =>
      SignatureResponse(id: map['id'], image: List<int>.from(map['image']));

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": List<dynamic>.from(image.map((x) => x)),
      };

  SignatureEntity toEntity() {
    return SignatureEntity(
      id: id,
      image: image,
    );
  }
}
