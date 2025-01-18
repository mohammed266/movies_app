part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}
final class AuthLoading extends AuthState {}
final class AuthSuccess extends AuthState {
  final String sessionId;
  AuthSuccess({required this.sessionId});
}
final class AuthFailure extends AuthState {
  final String errMessage;

  AuthFailure(this.errMessage);
}

final class LogoutSuccess extends AuthState {}
final class LogoutFailure extends AuthState {
  final String errMessage;

  LogoutFailure(this.errMessage);
}


