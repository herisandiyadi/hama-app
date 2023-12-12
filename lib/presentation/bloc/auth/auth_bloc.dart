import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hama_app/domain/entities/login_entity.dart';
import 'package:hama_app/domain/entities/login_request.dart';
import 'package:hama_app/domain/usecase/get_login.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final GetLogin getLogin;
  AuthBloc({required this.getLogin}) : super(AuthInitial()) {
    on<FetchLogin>((event, emit) async {
      emit(AuthLoading());
      final result = await getLogin.execute(event.loginRequest);
      result.fold((failure) {
        emit(AuthFailed(message: failure.message));
      }, (success) {
        emit(AuthSuccess(loginEntity: success));
      });
    });
  }
}
