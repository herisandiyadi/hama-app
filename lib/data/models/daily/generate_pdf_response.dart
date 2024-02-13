import 'package:hama_app/domain/entities/daily/generate_pdf_entity.dart';

class GeneratePdfResponse {
  final bool success;
  final String url;

  GeneratePdfResponse({
    required this.success,
    required this.url,
  });

  factory GeneratePdfResponse.fromJson(Map<String, dynamic> json) =>
      GeneratePdfResponse(
        success: json["success"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "url": url,
      };

  GeneratePDFEntity toEntity() {
    return GeneratePDFEntity(
      success: success,
      url: url,
    );
  }
}
