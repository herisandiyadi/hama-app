// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'peralatan_bloc.dart';

abstract class PeralatanEvent extends Equatable {
  const PeralatanEvent();

  @override
  List<Object> get props => [];
}

class FetchAddPeralatan extends PeralatanEvent {
  final PeralatanRequest peralatanRequest;

  const FetchAddPeralatan({required this.peralatanRequest});
  @override
  List<Object> get props => [peralatanRequest];
}

class FetchAllPeralatan extends PeralatanEvent {
  final String noOrder;

  const FetchAllPeralatan({required this.noOrder});
  @override
  List<Object> get props => [noOrder];
}

class FetchPeralatanByDate extends PeralatanEvent {
  final String noOrder;
  final String date;

  const FetchPeralatanByDate({required this.noOrder, required this.date});
  @override
  List<Object> get props => [noOrder, date];
}

class FetchAllPeralatanByMonth extends PeralatanEvent {
  final String noOrder;
  final String year;
  final String month;

  const FetchAllPeralatanByMonth({
    required this.noOrder,
    required this.year,
    required this.month,
  });
  @override
  List<Object> get props => [noOrder, year, month];
}

class FetchPeralatanPDFMonthly extends PeralatanEvent {
  final String noOrder;
  final String year;
  final String month;

  const FetchPeralatanPDFMonthly({
    required this.noOrder,
    required this.year,
    required this.month,
  });
  @override
  List<Object> get props => [
        noOrder,
        year,
        month,
      ];
}
