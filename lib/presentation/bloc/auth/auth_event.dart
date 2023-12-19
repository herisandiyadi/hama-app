part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class FetchLogin extends AuthEvent {
  final LoginRequest loginRequest;

  const FetchLogin({required this.loginRequest});

  @override
  List<Object> get props => [loginRequest];
}

class FetchLogout extends AuthEvent {
  const FetchLogout();

  @override
  List<Object> get props => [];
}
