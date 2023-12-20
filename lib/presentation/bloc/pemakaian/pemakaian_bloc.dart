import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hama_app/domain/entities/pemakaian/list_pemakaian_entity.dart';
import 'package:hama_app/domain/entities/pemakaian/pemakaian_entity.dart';
import 'package:hama_app/domain/entities/pemakaian/pemakaian_request.dart';
import 'package:hama_app/domain/usecase/pemakaian/add_pemakaian_usecase.dart';
import 'package:hama_app/domain/usecase/pemakaian/get_all_pemakaian_by_date_usecase.dart';
import 'package:hama_app/domain/usecase/pemakaian/get_all_pemakaian_by_month.dart';
import 'package:hama_app/domain/usecase/pemakaian/get_all_pemakaian_usecase.dart';

part 'pemakaian_event.dart';
part 'pemakaian_state.dart';

class PemakaianBloc extends Bloc<PemakaianEvent, PemakaianState> {
  final AddPemakaianUsecase addPemakaianUsecase;
  final GetAllPemakaianUsecase getAllPemakaianUsecase;
  final GetAllPemakaianByDateUsecase getAllPeralatanByDateUsecase;
  final GetAllPemakaianByMonthUsecase getAllPemakaianByMonthUsecase;
  PemakaianBloc({
    required this.addPemakaianUsecase,
    required this.getAllPemakaianByMonthUsecase,
    required this.getAllPemakaianUsecase,
    required this.getAllPeralatanByDateUsecase,
  }) : super(PemakaianInitial()) {
    on<FetchAddPemakaian>((event, emit) async {
      emit(PemakaianLoading());
      final result = await addPemakaianUsecase.execute(event.pemakaianRequest);
      result.fold((failure) {
        emit(PemakaianFailed(message: failure.message));
      }, (success) {
        emit(AddPemakaianSuccess(pemakaianEntity: success));
      });
    });
    on<FetchGetAllPemakaian>((event, emit) async {
      emit(PemakaianLoading());
      final result = await getAllPemakaianUsecase.execute(event.noOrder);
      result.fold((failure) {
        emit(PemakaianFailed(message: failure.message));
      }, (success) {
        emit(GetAllPemakaianSuccess(listPemakaianEntity: success));
      });
    });
    on<FetchGetAllbyDatePemakaian>((event, emit) async {
      emit(PemakaianLoading());
      final result =
          await getAllPeralatanByDateUsecase.execute(event.noOrder, event.date);
      result.fold((failure) {
        emit(PemakaianFailed(message: failure.message));
      }, (success) {
        emit(GetAllPemakaianSuccess(listPemakaianEntity: success));
      });
    });
    on<FetchGetAllbyMonthPemakaian>((event, emit) async {
      emit(PemakaianLoading());
      final result = await getAllPemakaianByMonthUsecase.execute(
          event.noOrder, event.year, event.month);
      result.fold((failure) {
        emit(PemakaianFailed(message: failure.message));
      }, (success) {
        emit(GetAllPemakaianSuccess(listPemakaianEntity: success));
      });
    });
  }
}
