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
