// ignore_for_file: public_member_api_docs, sort_constructors_first
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

class FetchPeralatanByDate extends PeralatanEvent {
  final String noOrder;
  final String date;

  FetchPeralatanByDate({required this.noOrder, required this.date});
  @override
  // TODO: implement props
  List<Object> get props => [noOrder, date];
}

class FetchAllPeralatanByMonth extends PeralatanEvent {
  final String noOrder;
  final String year;
  final String month;

  FetchAllPeralatanByMonth({
    required this.noOrder,
    required this.year,
    required this.month,
  });
  @override
  // TODO: implement props
  List<Object> get props => [noOrder, year, month];
}
