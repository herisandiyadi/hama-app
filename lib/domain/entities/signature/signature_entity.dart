import 'package:equatable/equatable.dart';

class SignatureEntity extends Equatable {
  final int id;
  final List<int> image;

  SignatureEntity({required this.id, required this.image});

  @override
  // TODO: implement props
  List<Object?> get props => [id, image];
}
