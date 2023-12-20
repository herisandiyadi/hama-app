import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hama_app/domain/entities/daily/daily_entity.dart';
import 'package:hama_app/domain/entities/daily/daily_request.dart';
import 'package:hama_app/domain/usecase/daily/add_daily_usecase.dart';

part 'daily_event.dart';
part 'daily_state.dart';

class DailyBloc extends Bloc<DailyEvent, DailyState> {
  final AddDailyUsecase addDailyUsecase;
  DailyBloc({required this.addDailyUsecase}) : super(DailyInitial()) {
    on<FetchAddDaily>((event, emit) async {
      emit(DailyLoading());
      final result =
          await addDailyUsecase.execute(event.dailyRequest, event.noOrder);
      result.fold((failure) {
        emit(DailyFailed(message: failure.message));
      }, (success) {
        emit(AddDailySuccess(dailyEntity: success));
      });
    });
  }
}
