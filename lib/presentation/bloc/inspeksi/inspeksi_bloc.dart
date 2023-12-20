// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hama_app/domain/entities/inspeksi/inspeksi_entity.dart';
import 'package:hama_app/domain/entities/inspeksi/inspeksi_request.dart';
import 'package:hama_app/domain/entities/inspeksi/list_inspeksi_entity.dart';
import 'package:hama_app/domain/usecase/inspeksi/add_inspeksi_usecase.dart';
import 'package:hama_app/domain/usecase/inspeksi/get_all_inspeksi_by_date_usecase.dart';
import 'package:hama_app/domain/usecase/inspeksi/get_all_inspeksi_by_month_usecase.dart';
import 'package:hama_app/domain/usecase/inspeksi/get_all_inspeksi_usecase.dart';

part 'inspeksi_event.dart';
part 'inspeksi_state.dart';

class InspeksiBloc extends Bloc<InspeksiEvent, InspeksiState> {
  final AddInspeksiUsecase addInspeksiUsecase;
  final GetAllInspeksiUsecase getAllInspeksiUsecase;
  final GetAllInspeksiByDateUsecase getAllInspeksiByDateUsecase;
  final GetAllInspeksiByMonthUsecase getAllInspeksiByMonthUsecase;
  InspeksiBloc({
    required this.addInspeksiUsecase,
    required this.getAllInspeksiUsecase,
    required this.getAllInspeksiByDateUsecase,
    required this.getAllInspeksiByMonthUsecase,
  }) : super(InspeksiInitial()) {
    on<FetchAddInspeksi>((event, emit) async {
      emit(InspeksiLoading());
      final result = await addInspeksiUsecase.execute(
          event.inspeksiRequest, event.noOrder);
      result.fold((failure) {
        emit(InspeksiFailed(message: failure.message));
      }, (success) {
        emit(AddInspeksiSuccess(inspeksiEntity: success));
      });
    });

    on<FetchGetAllInspeksi>((event, emit) async {
      emit(InspeksiLoading());
      final result = await getAllInspeksiUsecase.execute(event.noOrder);
      result.fold((failure) {
        emit(InspeksiFailed(message: failure.message));
      }, (success) {
        emit(GetInspeksiSuccess(listInspeksiEntity: success));
      });
    });
    on<FetchGetAllByDateInspeksi>((event, emit) async {
      emit(InspeksiLoading());
      final result =
          await getAllInspeksiByDateUsecase.execute(event.noOrder, event.date);
      result.fold((failure) {
        emit(InspeksiFailed(message: failure.message));
      }, (success) {
        emit(GetInspeksiSuccess(listInspeksiEntity: success));
      });
    });
    on<FetchGetAllByMonthInspeksi>((event, emit) async {
      emit(InspeksiLoading());
      final result = await getAllInspeksiByMonthUsecase.execute(
          event.noOrder, event.year, event.month);
      result.fold((failure) {
        emit(InspeksiFailed(message: failure.message));
      }, (success) {
        emit(GetInspeksiSuccess(listInspeksiEntity: success));
      });
    });
  }
}
