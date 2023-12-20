part of 'daily_bloc.dart';

abstract class DailyEvent extends Equatable {
  const DailyEvent();

  @override
  List<Object> get props => [];
}

class FetchAddDaily extends DailyEvent {
  final DailyRequest dailyRequest;
  final String noOrder;

  const FetchAddDaily({required this.dailyRequest, required this.noOrder});
  @override
  List<Object> get props => [
        dailyRequest,
        noOrder,
      ];
}

class FetchGetAllDaily extends DailyEvent {
  final String noOrder;

  const FetchGetAllDaily({required this.noOrder});
  @override
  List<Object> get props => [
        noOrder,
      ];
}

class FetchGetAllDailyByDate extends DailyEvent {
  final String noOrder;
  final String date;

  const FetchGetAllDailyByDate({required this.noOrder, required this.date});
  @override
  List<Object> get props => [
        noOrder,
        date,
      ];
}

class FetchGetAllDailyByMonth extends DailyEvent {
  final String noOrder;
  final String year;
  final String month;

  const FetchGetAllDailyByMonth(
      {required this.noOrder, required this.year, required this.month});
  @override
  List<Object> get props => [
        noOrder,
        year,
        month,
      ];
}
