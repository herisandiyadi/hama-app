part of 'absen_bloc.dart';

abstract class AbsenEvent extends Equatable {
  const AbsenEvent();

  @override
  List<Object> get props => [];
}

class AddAbsenEvent extends AbsenEvent {
  final AbsenRequest absenRequest;

  const AddAbsenEvent({required this.absenRequest});
  @override
  List<Object> get props => [absenRequest];
}

class FetchAbsenPerson extends AbsenEvent {
  final String noOrder;
  final String id;

  const FetchAbsenPerson({required this.noOrder, required this.id});
  @override
  List<Object> get props => [
        noOrder,
        id,
      ];
}
