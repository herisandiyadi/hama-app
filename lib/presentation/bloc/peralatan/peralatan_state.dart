part of 'peralatan_bloc.dart';

abstract class PeralatanState extends Equatable {
  const PeralatanState();

  @override
  List<Object> get props => [];
}

final class PeralatanInitial extends PeralatanState {}

final class PeralatanLoading extends PeralatanState {}

final class PeralatanFailed extends PeralatanState {
  final String message;

  PeralatanFailed({required this.message});
  @override
  // TODO: implement props
  List<Object> get props => [message];
}

final class AddPeralatanSuccess extends PeralatanState {
  final PeralatanEntity peralatanEntity;

  AddPeralatanSuccess({required this.peralatanEntity});
  @override
  // TODO: implement props
  List<Object> get props => [peralatanEntity];
}

final class GetALlPeralatanSuccess extends PeralatanState {
  final ListPeralatanEntity listPeralatanEntity;

  GetALlPeralatanSuccess({required this.listPeralatanEntity});
  @override
  // TODO: implement props
  List<Object> get props => [listPeralatanEntity];
}
