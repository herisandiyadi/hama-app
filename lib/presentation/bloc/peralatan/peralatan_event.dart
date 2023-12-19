part of 'peralatan_bloc.dart';

abstract class PeralatanEvent extends Equatable {
  const PeralatanEvent();

  @override
  List<Object> get props => [];
}

class FetchAddPeralatan extends PeralatanEvent {
  final PeralatanRequest peralatanRequest;

  FetchAddPeralatan({required this.peralatanRequest});
  @override
  // TODO: implement props
  List<Object> get props => [peralatanRequest];
}

class FetchAllPeralatan extends PeralatanEvent {
  final String noOrder;

  FetchAllPeralatan({required this.noOrder});
  @override
  // TODO: implement props
  List<Object> get props => [noOrder];
}
