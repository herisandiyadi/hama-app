part of 'pemakaian_bloc.dart';

abstract class PemakaianState extends Equatable {
  const PemakaianState();

  @override
  List<Object> get props => [];
}

final class PemakaianInitial extends PemakaianState {}

final class PemakaianLoading extends PemakaianState {}

final class PemakaianFailed extends PemakaianState {
  final String message;

  PemakaianFailed({required this.message});
  @override
  // TODO: implement props
  List<Object> get props => [message];
}

final class AddPemakaianSuccess extends PemakaianState {
  final PemakaianEntity pemakaianEntity;

  AddPemakaianSuccess({required this.pemakaianEntity});

  @override
  // TODO: implement props
  List<Object> get props => [pemakaianEntity];
}

final class GetAllPemakaianSuccess extends PemakaianState {
  final ListPemakaianEntity listPemakaianEntity;

  GetAllPemakaianSuccess({required this.listPemakaianEntity});

  @override
  // TODO: implement props
  List<Object> get props => [listPemakaianEntity];
}
