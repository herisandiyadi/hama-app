part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthFailed extends AuthState {
  final String message;

  const AuthFailed({required this.message});
  @override
  List<Object> get props => [message];
}

final class AuthSuccess extends AuthState {
  final LoginEntity loginEntity;

  const AuthSuccess({required this.loginEntity});
  @override
  List<Object> get props => [loginEntity];
}

final class LogoutSuccess extends AuthState {
  final String message;

  const LogoutSuccess({required this.message});
  @override
  List<Object> get props => [message];
}
