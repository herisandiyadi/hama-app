part of 'personel_bloc.dart';

abstract class PersonelState extends Equatable {
  const PersonelState();

  @override
  List<Object> get props => [];
}

final class PersonelInitial extends PersonelState {}

final class PersonelLoading extends PersonelState {}

final class PersonelFailed extends PersonelState {
  final String message;

  const PersonelFailed({required this.message});
  @override
  List<Object> get props => [message];
}

final class GetPersonelSuccess extends PersonelState {
  final ListPersonelEntity listPersonelEntity;

  const GetPersonelSuccess({required this.listPersonelEntity});
  @override
  List<Object> get props => [listPersonelEntity];
}

final class AddPersonelSuccess extends PersonelState {
  final PersonalEntity personalEntity;

  const AddPersonelSuccess({required this.personalEntity});
  @override
  List<Object> get props => [personalEntity];
}

final class DeletePersonelSuccess extends PersonelState {
  final String message;

  const DeletePersonelSuccess({required this.message});
  @override
  List<Object> get props => [message];
}

final class UpdatePersonelSuccess extends PersonelState {
  final String message;

  const UpdatePersonelSuccess({required this.message});
  @override
  List<Object> get props => [message];
}
