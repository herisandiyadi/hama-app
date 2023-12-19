import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hama_app/domain/entities/peralatan/list_peralatan_entity.dart';
import 'package:hama_app/domain/entities/peralatan/peralatan_entity.dart';
import 'package:hama_app/domain/entities/peralatan/peralatan_request.dart';
import 'package:hama_app/domain/usecase/peralatan/add_peralatan_usecase.dart';
import 'package:hama_app/domain/usecase/peralatan/get_all_peralatan_usecase.dart';
import 'package:hama_app/domain/usecase/peralatan/get_peralatan_by_date_usecase.dart';
import 'package:hama_app/domain/usecase/peralatan/get_peralatan_by_month_usecase.dart';

part 'peralatan_event.dart';
part 'peralatan_state.dart';

class PeralatanBloc extends Bloc<PeralatanEvent, PeralatanState> {
  final AddPeralatanUsecase addPeralatanUsecase;
  final GetAllPeralatanUsecase getAllPeralatanUsecase;
  final GetAllPeralatanByDateUsecase getAllPeralatanByDateUsecase;
  final GetAllPeralatanByMonthUsecase getAllPeralatanByMonthUsecase;
  PeralatanBloc({
    required this.addPeralatanUsecase,
    required this.getAllPeralatanUsecase,
    required this.getAllPeralatanByDateUsecase,
    required this.getAllPeralatanByMonthUsecase,
  }) : super(PeralatanInitial()) {
    on<FetchAddPeralatan>((event, emit) async {
      emit(PeralatanLoading());
      final result = await addPeralatanUsecase.execute(event.peralatanRequest);
      result.fold((failure) {
        emit(PeralatanFailed(message: failure.message));
      }, (success) {
        emit(AddPeralatanSuccess(peralatanEntity: success));
      });
    });
    on<FetchAllPeralatan>((event, emit) async {
      emit(PeralatanLoading());
      final result = await getAllPeralatanUsecase.execute(event.noOrder);
      result.fold((failure) {
        emit(PeralatanFailed(message: failure.message));
      }, (success) {
        emit(GetALlPeralatanSuccess(listPeralatanEntity: success));
      });
    });
    on<FetchPeralatanByDate>((event, emit) async {
      emit(PeralatanLoading());
      final result =
          await getAllPeralatanByDateUsecase.execute(event.noOrder, event.date);
      result.fold((failure) {
        emit(PeralatanFailed(message: failure.message));
      }, (success) {
        emit(GetALlPeralatanSuccess(listPeralatanEntity: success));
      });
    });
    on<FetchAllPeralatanByMonth>((event, emit) async {
      emit(PeralatanLoading());
      final result = await getAllPeralatanByMonthUsecase.execute(
          event.noOrder, event.year, event.month);
      result.fold((failure) {
        emit(PeralatanFailed(message: failure.message));
      }, (success) {
        emit(GetALlPeralatanSuccess(listPeralatanEntity: success));
      });
    });
  }
}
