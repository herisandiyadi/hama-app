part of 'index_hama_bloc.dart';

abstract class IndexHamaEvent extends Equatable {
  const IndexHamaEvent();

  @override
  List<Object> get props => [];
}

class FetchAddIndexHama extends IndexHamaEvent {
  final IndexHamaRequest indexHamaRequest;
  final String noOrder;

  const FetchAddIndexHama(
      {required this.indexHamaRequest, required this.noOrder});
  @override
  List<Object> get props => [
        indexHamaRequest,
        noOrder,
      ];
}

class FetchGetAllIndexHama extends IndexHamaEvent {
  final String noOrder;

  const FetchGetAllIndexHama({required this.noOrder});
  @override
  List<Object> get props => [noOrder];
}

class FetchGetAllByDateIndexHama extends IndexHamaEvent {
  final String noOrder;
  final String date;

  const FetchGetAllByDateIndexHama({required this.noOrder, required this.date});
  @override
  List<Object> get props => [noOrder, date];
}

class FetchGetAllByMonthIndexHama extends IndexHamaEvent {
  final String noOrder;
  final String year;
  final String month;

  const FetchGetAllByMonthIndexHama(
      {required this.noOrder, required this.year, required this.month});
  @override
  List<Object> get props => [noOrder, year, month];
}
