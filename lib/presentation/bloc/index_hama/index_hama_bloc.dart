// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hama_app/domain/entities/daily/generate_pdf_entity.dart';

import 'package:hama_app/domain/entities/index/index_hama_entity.dart';
import 'package:hama_app/domain/entities/index/index_hama_request.dart';
import 'package:hama_app/domain/entities/index/list_index_hama_entity.dart';
import 'package:hama_app/domain/usecase/index_hama/add_index_hama_usecase.dart';
import 'package:hama_app/domain/usecase/index_hama/get_all_index_hama_by_MOnth_usecase.dart';
import 'package:hama_app/domain/usecase/index_hama/get_all_index_hama_by_date_usecase.dart';
import 'package:hama_app/domain/usecase/index_hama/get_all_index_hama_usecase.dart';
import 'package:hama_app/domain/usecase/index_hama/get_index_pdf_monthly_usecase.dart';

part 'index_hama_event.dart';
part 'index_hama_state.dart';

class IndexHamaBloc extends Bloc<IndexHamaEvent, IndexHamaState> {
  final AddIndexHamaUsecase addIndexHamaUsecase;
  final GetAllIndexHamaUsecase getAllIndexHamaUsecase;
  final GetAllIndexHamaByDateUsecase getAllIndexHamaByDateUsecase;
  final GetAllIndexHamaByMonthUsecase getAllIndexHamaByMonthUsecase;
  final GetIndexPdfMonthlyUsecase getIndexPdfMonthlyUsecase;
  IndexHamaBloc({
    required this.addIndexHamaUsecase,
    required this.getAllIndexHamaUsecase,
    required this.getAllIndexHamaByMonthUsecase,
    required this.getAllIndexHamaByDateUsecase,
    required this.getIndexPdfMonthlyUsecase,
  }) : super(IndexHamaInitial()) {
    on<FetchAddIndexHama>((event, emit) async {
      emit(IndexHamaLoading());

      final result = await addIndexHamaUsecase.execute(
          event.indexHamaRequest, event.noOrder);
      result.fold((failure) {
        emit(IndexHamaFailed(message: failure.message));
      }, (success) {
        emit(AddIndexHamaSuccess(indexHamaEntity: success));
      });
    });
    on<FetchGetAllIndexHama>((event, emit) async {
      emit(IndexHamaLoading());

      final result = await getAllIndexHamaUsecase.execute(event.noOrder);
      result.fold((failure) {
        emit(IndexHamaFailed(message: failure.message));
      }, (success) {
        emit(GetAllIndexHamaSuccess(listIndexHamaEntity: success));
      });
    });
    on<FetchGetAllByDateIndexHama>((event, emit) async {
      emit(IndexHamaLoading());

      final result =
          await getAllIndexHamaByDateUsecase.execute(event.noOrder, event.date);
      result.fold((failure) {
        emit(IndexHamaFailed(message: failure.message));
      }, (success) {
        emit(GetAllIndexHamaSuccess(listIndexHamaEntity: success));
      });
    });
    on<FetchGetAllByMonthIndexHama>((event, emit) async {
      emit(IndexHamaLoading());

      final result = await getAllIndexHamaByMonthUsecase.execute(
          event.noOrder, event.year, event.month);
      result.fold((failure) {
        emit(IndexHamaFailed(message: failure.message));
      }, (success) {
        emit(GetAllIndexHamaSuccess(listIndexHamaEntity: success));
      });
    });
    on<FetchIndexPDFMonthly>((event, emit) async {
      emit(IndexHamaLoading());
      final result = await getIndexPdfMonthlyUsecase.execute(
          event.noOrder, event.year, event.month);
      result.fold((failure) {
        emit(IndexHamaFailed(message: failure.message));
      }, (success) {
        print(success.url);
        emit(GenerateIndexPDFMonthlySuccess(generatePDFEntity: success));
      });
    });
  }
}
