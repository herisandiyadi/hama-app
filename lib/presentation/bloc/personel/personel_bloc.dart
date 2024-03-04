// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hama_app/domain/entities/personal/personal_entity.dart';
import 'package:hama_app/domain/usecase/personel/get_absen_pdf_monthly_usecase.dart';
import 'package:hama_app/domain/usecase/personel/get_add_personal.dart';
import 'package:hama_app/domain/usecase/personel/get_all_personal.dart';
import 'package:hama_app/domain/usecase/personel/get_delete_personal.dart';
import 'package:hama_app/domain/usecase/personel/get_update_personal.dart';

part 'personel_event.dart';
part 'personel_state.dart';

class PersonelBloc extends Bloc<PersonelEvent, PersonelState> {
  final GetAllPersonal getAllPersonal;
  final GetAddPersonal getAddPersonal;
  final GetDeletePersonal getDeletePersonal;
  final GetUpdatePersonal getUpdatePersonal;
  PersonelBloc({
    required this.getAllPersonal,
    required this.getAddPersonal,
    required this.getDeletePersonal,
    required this.getUpdatePersonal,
  }) : super(PersonelInitial()) {
    on<FetchAllPersonel>((event, emit) async {
      emit(PersonelLoading());
      final result = await getAllPersonal.execute(event.noOrder);
      result.fold((failure) {
        emit(PersonelFailed(message: failure.message));
      }, (success) {
        emit(GetPersonelSuccess(listPersonelEntity: success));
      });
    });

    on<FetchAddPersonel>((event, emit) async {
      emit(PersonelLoading());
      final result =
          await getAddPersonal.execute(event.noOrder, event.namePersonel);
      result.fold((failure) {
        emit(PersonelFailed(message: failure.message));
      }, (success) {
        emit(AddPersonelSuccess(personalEntity: success));
      });
    });
    on<FetchDeletePersonel>((event, emit) async {
      emit(PersonelLoading());
      final result = await getDeletePersonal.execute(event.noOrder, event.id);
      result.fold((failure) {
        emit(PersonelFailed(message: failure.message));
      }, (success) {
        emit(DeletePersonelSuccess(message: success));
      });
    });
    on<FetchUpdatePersonel>((event, emit) async {
      emit(PersonelLoading());
      final result = await getUpdatePersonal.execute(
          event.noOrder, event.id, event.namePersonel);
      result.fold((failure) {
        emit(PersonelFailed(message: failure.message));
      }, (success) {
        emit(UpdatePersonelSuccess(message: success));
      });
    });
  }
}
