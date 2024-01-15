part of 'signature_bloc.dart';

abstract class SignatureEvent extends Equatable {
  const SignatureEvent();

  @override
  List<Object> get props => [];
}

class FetchSaveSignature extends SignatureEvent {
  final Uint8List image;

  FetchSaveSignature({required this.image});

  @override
  // TODO: implement props
  List<Object> get props => [
        image,
      ];
}

class FetchDeleteSignature extends SignatureEvent {
  final int id;

  FetchDeleteSignature({required this.id});

  @override
  // TODO: implement props
  List<Object> get props => [
        id,
      ];
}

class FetchGetAllSignature extends SignatureEvent {
  FetchGetAllSignature();
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class FetchSelectedSignature extends SignatureEvent {
  final int id;
  FetchSelectedSignature({required this.id});
  @override
  // TODO: implement props
  List<Object> get props => [id];
}
