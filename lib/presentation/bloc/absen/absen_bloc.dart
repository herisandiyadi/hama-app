// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hama_app/domain/entities/personal/absen_request.dart';
import 'package:hama_app/domain/entities/personal/data_absen_entity.dart';
import 'package:hama_app/domain/usecase/personel/get_absen_by_id.dart';
import 'package:hama_app/domain/usecase/personel/get_add_absen.dart';

part 'absen_event.dart';
part 'absen_state.dart';

class AbsenBloc extends Bloc<AbsenEvent, AbsenState> {
  final GetAddAbsen getAddAbsen;
  final GetAbsenById getAbsenById;
  AbsenBloc({
    required this.getAddAbsen,
    required this.getAbsenById,
  }) : super(AbsenInitial()) {
    on<AddAbsenEvent>((event, emit) async {
      final result = await getAddAbsen.execute(event.absenRequest);
      result.fold((failure) {
        emit(AbsenFailed(message: failure.message));
      }, (success) => emit(AddAbsenSuccess(message: success)));
    });
    on<FetchAbsenPerson>((event, emit) async {
      final result = await getAbsenById.execute(event.noOrder, event.id);
      result.fold((failure) {
        emit(AbsenFailed(message: failure.message));
      }, (success) => emit(GetAbsenSuccess(dataAbsenEntity: success)));
    });
  }
}
