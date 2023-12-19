import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hama_app/domain/entities/login_entity.dart';
import 'package:hama_app/domain/entities/login_request.dart';
import 'package:hama_app/domain/usecase/get_login.dart';
import 'package:hama_app/domain/usecase/personel/logout_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final GetLogin getLogin;
  final LogoutUsecase logoutUsecase;
  AuthBloc({required this.getLogin, required this.logoutUsecase})
      : super(AuthInitial()) {
    on<FetchLogin>((event, emit) async {
      emit(AuthLoading());
      final result = await getLogin.execute(event.loginRequest);
      result.fold((failure) {
        emit(AuthFailed(message: failure.message));
      }, (success) {
        emit(AuthSuccess(loginEntity: success));
      });
    });
    on<FetchLogout>((event, emit) async {
      emit(AuthLoading());
      final result = await logoutUsecase.execute();
      result.fold((failure) {
        emit(AuthFailed(message: failure.message));
      }, (success) {
        emit(LogoutSuccess(message: success));
      });
    });
  }
}
