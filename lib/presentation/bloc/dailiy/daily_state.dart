part of 'daily_bloc.dart';

abstract class DailyState extends Equatable {
  const DailyState();

  @override
  List<Object> get props => [];
}

final class DailyInitial extends DailyState {}

final class DailyLoading extends DailyState {}

final class DailyFailed extends DailyState {
  final String message;

  const DailyFailed({required this.message});
  @override
  List<Object> get props => [message];
}

final class AddDailySuccess extends DailyState {
  final String dailyEntity;

  const AddDailySuccess({required this.dailyEntity});

  @override
  List<Object> get props => [dailyEntity];
}

final class GetAllDailySuccess extends DailyState {
  final ListDailyEntity listDailyEntity;

  const GetAllDailySuccess({required this.listDailyEntity});

  @override
  List<Object> get props => [listDailyEntity];
}
