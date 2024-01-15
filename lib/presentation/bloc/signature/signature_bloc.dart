import 'dart:typed_data';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hama_app/domain/entities/signature/signature_entity.dart';
import 'package:hama_app/domain/usecase/signature/delete_signature_usecase.dart';
import 'package:hama_app/domain/usecase/signature/get_all_signature_usecase.dart';
import 'package:hama_app/domain/usecase/signature/save_signature_usecase.dart';
import 'package:hama_app/domain/usecase/signature/select_signature_usecase.dart';

part 'signature_event.dart';
part 'signature_state.dart';

class SignatureBloc extends Bloc<SignatureEvent, SignatureState> {
  final SaveSignatureUsecase saveSignatureUsecase;
  final DeleteSignatureUsecase deleteSignatureUsecase;
  final GetAllSignatureUsecase getAllSignatureUsecase;
  final SelectSignatureUsecase selectSignatureUsecase;
  SignatureBloc(
      {required this.saveSignatureUsecase,
      required this.deleteSignatureUsecase,
      required this.getAllSignatureUsecase,
      required this.selectSignatureUsecase})
      : super(SignatureInitial()) {
    on<FetchSaveSignature>((event, emit) async {
      emit(SignatureLoading());
      final result = await saveSignatureUsecase.execute(event.image);
      result.fold((failure) {
        emit(SignatureFailed(message: failure.message));
      }, (success) {
        emit(SaveSignatureSuccess(message: success));
      });
    });
    on<FetchDeleteSignature>((event, emit) async {
      emit(SignatureLoading());
      final result = await deleteSignatureUsecase.execute(event.id);
      result.fold((failure) {
        emit(SignatureFailed(message: failure.message));
      }, (success) {
        emit(DeleteSignatureSuccess(message: success));
      });
    });
    on<FetchGetAllSignature>((event, emit) async {
      emit(SignatureLoading());
      final result = await getAllSignatureUsecase.execute();
      result.fold((failure) {
        emit(SignatureFailed(message: failure.message));
      }, (success) {
        emit(GetAllSignatureSuccess(listEntity: success));
      });
    });
    on<FetchSelectedSignature>((event, emit) async {
      emit(SignatureLoading());
      final result = await selectSignatureUsecase.execute(event.id);
      result.fold((failure) {
        emit(SignatureFailed(message: failure.message));
      }, (success) {
        emit(SelectSignatureSuccess(listEntity: success));
      });
    });
  }
}
