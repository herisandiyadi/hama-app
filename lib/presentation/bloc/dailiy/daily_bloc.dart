// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:typed_data';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hama_app/domain/entities/daily/daily_request.dart';
import 'package:hama_app/domain/entities/daily/generate_pdf_entity.dart';
import 'package:hama_app/domain/entities/daily/list_daily_entity.dart';
import 'package:hama_app/domain/usecase/daily/add_daily_usecase.dart';
import 'package:hama_app/domain/usecase/daily/get_all_daily_by_date_usecase.dart';
import 'package:hama_app/domain/usecase/daily/get_all_daily_by_month_usecase.dart';
import 'package:hama_app/domain/usecase/daily/get_all_daily_usecase.dart';
import 'package:hama_app/domain/usecase/daily/get_daily_pdf_monthly_usecase.dart';

part 'daily_event.dart';
part 'daily_state.dart';

class DailyBloc extends Bloc<DailyEvent, DailyState> {
  final AddDailyUsecase addDailyUsecase;
  final GetAllDailyUsecase getAllDailyUsecase;
  final GetAllDailyByDateUsecase getAllDailyByDateUsecase;
  final GetAllDailyByMonthUsecase getAllDailyByMonthUsecase;
  final GetDailyPDFMonthlyUsecase getDailyPDFMonthlyUsecase;
  DailyBloc({
    required this.addDailyUsecase,
    required this.getAllDailyUsecase,
    required this.getAllDailyByDateUsecase,
    required this.getAllDailyByMonthUsecase,
    required this.getDailyPDFMonthlyUsecase,
  }) : super(DailyInitial()) {
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
    on<FetchGetAllDaily>((event, emit) async {
      emit(DailyLoading());
      final result = await getAllDailyUsecase.execute(event.noOrder);
      result.fold((failure) {
        emit(DailyFailed(message: failure.message));
      }, (success) {
        emit(GetAllDailySuccess(listDailyEntity: success));
      });
    });

    on<FetchGetAllDailyByDate>((event, emit) async {
      emit(DailyLoading());
      final result =
          await getAllDailyByDateUsecase.execute(event.noOrder, event.date);
      result.fold((failure) {
        emit(DailyFailed(message: failure.message));
      }, (success) {
        emit(GetAllDailySuccess(listDailyEntity: success));
      });
    });

    on<FetchGetAllDailyByMonth>((event, emit) async {
      emit(DailyLoading());
      final result = await getAllDailyByMonthUsecase.execute(
          event.noOrder, event.year, event.month);
      result.fold((failure) {
        emit(DailyFailed(message: failure.message));
      }, (success) {
        emit(GetAllDailySuccess(listDailyEntity: success));
      });
    });
    on<FetchDailyPDFMonthly>((event, emit) async {
      emit(DailyLoading());
      final result = await getDailyPDFMonthlyUsecase.execute(
          event.noOrder, event.year, event.month);
      result.fold((failure) {
        emit(DailyFailed(message: failure.message));
      }, (success) {
        print(success.url);
        emit(GenerateDailyPDFMonthlySuccess(generatePDFEntity: success));
      });
    });
  }
}
