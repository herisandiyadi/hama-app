// ignore_for_file: public_member_api_docs, sort_constructors_first
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

class FetchAbsenPersonByMonth extends AbsenEvent {
  final String noOrder;
  final String id;
  final String year;
  final String month;

  const FetchAbsenPersonByMonth({
    required this.noOrder,
    required this.id,
    required this.year,
    required this.month,
  });
  @override
  List<Object> get props => [
        noOrder,
        id,
        year,
        month,
      ];
}
