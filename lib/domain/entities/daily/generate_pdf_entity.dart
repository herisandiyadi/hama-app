import 'package:equatable/equatable.dart';

class GeneratePDFEntity extends Equatable {
  final bool success;
  final String url;

  const GeneratePDFEntity({required this.success, required this.url});

  @override
  List<Object?> get props => [
        success,
        url,
      ];
}
