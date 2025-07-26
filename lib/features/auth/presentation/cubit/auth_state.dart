import '../../domain/entities/user.dart';
abstract class AuthState {}
class AuthInitial extends AuthState {}
class AuthRegisterLoading extends AuthState {}
class AuthAuthenticatedFromRegister extends AuthState {
   User user;
  AuthAuthenticatedFromRegister({required this.user});
}
class AuthRegisterError extends AuthState {
   String message;
  AuthRegisterError({required this.message});
}
class AuthLoginLoading extends AuthState {}
class AuthAuthenticatedFromLogin extends AuthState {
  User user;
  AuthAuthenticatedFromLogin({required this.user});
}
class AuthLoginError extends AuthState {
  String message;
  AuthLoginError({required this.message});
}