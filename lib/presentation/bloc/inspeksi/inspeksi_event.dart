part of 'inspeksi_bloc.dart';

abstract class InspeksiEvent extends Equatable {
  const InspeksiEvent();

  @override
  List<Object> get props => [];
}

class FetchAddInspeksi extends InspeksiEvent {
  final InspeksiRequest inspeksiRequest;
  final String noOrder;

  const FetchAddInspeksi(
      {required this.inspeksiRequest, required this.noOrder});
  @override
  // TODO: implement props
  List<Object> get props => [inspeksiRequest, noOrder];
}

class FetchGetAllInspeksi extends InspeksiEvent {
  final String noOrder;

  const FetchGetAllInspeksi({required this.noOrder});
  @override
  List<Object> get props => [noOrder];
}

class FetchGetAllByDateInspeksi extends InspeksiEvent {
  final String noOrder;
  final String date;

  const FetchGetAllByDateInspeksi({required this.noOrder, required this.date});
  @override
  List<Object> get props => [noOrder, date];
}

class FetchGetAllByMonthInspeksi extends InspeksiEvent {
  final String noOrder;
  final String year;
  final String month;

  const FetchGetAllByMonthInspeksi(
      {required this.noOrder, required this.year, required this.month});
  @override
  List<Object> get props => [noOrder, year, month];
}
