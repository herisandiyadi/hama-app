// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'pemakaian_bloc.dart';

abstract class PemakaianEvent extends Equatable {
  const PemakaianEvent();

  @override
  List<Object> get props => [];
}

class FetchAddPemakaian extends PemakaianEvent {
  final PemakaianRequest pemakaianRequest;

  FetchAddPemakaian({required this.pemakaianRequest});

  @override
  List<Object> get props => [pemakaianRequest];
}

class FetchGetAllPemakaian extends PemakaianEvent {
  final String noOrder;

  FetchGetAllPemakaian({required this.noOrder});

  @override
  List<Object> get props => [noOrder];
}

class FetchGetAllbyDatePemakaian extends PemakaianEvent {
  final String noOrder;
  final String date;

  FetchGetAllbyDatePemakaian({required this.noOrder, required this.date});

  @override
  List<Object> get props => [noOrder, date];
}

class FetchGetAllbyMonthPemakaian extends PemakaianEvent {
  final String noOrder;
  final String year;
  final String month;

  FetchGetAllbyMonthPemakaian({
    required this.noOrder,
    required this.year,
    required this.month,
  });

  @override
  List<Object> get props => [noOrder, year, month];
}
