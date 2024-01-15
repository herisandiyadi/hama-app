part of 'signature_bloc.dart';

abstract class SignatureState extends Equatable {
  const SignatureState();

  @override
  List<Object> get props => [];
}

final class SignatureInitial extends SignatureState {}

final class SignatureLoading extends SignatureState {}

final class DeleteSignatureSuccess extends SignatureState {
  final String message;

  const DeleteSignatureSuccess({required this.message});
  @override
  List<Object> get props => [message];
}

final class SignatureFailed extends SignatureState {
  final String message;

  const SignatureFailed({required this.message});
  @override
  List<Object> get props => [message];
}

final class SaveSignatureSuccess extends SignatureState {
  final String message;

  const SaveSignatureSuccess({required this.message});
  @override
  List<Object> get props => [message];
}

final class GetAllSignatureSuccess extends SignatureState {
  final List<SignatureEntity> listEntity;

  const GetAllSignatureSuccess({required this.listEntity});
  @override
  List<Object> get props => [listEntity];
}

final class SelectSignatureSuccess extends SignatureState {
  final List<SignatureEntity> listEntity;

  const SelectSignatureSuccess({required this.listEntity});
  @override
  List<Object> get props => [listEntity];
}
