import 'package:ecommerce/features/auth/data/models/register_request.dart';
import 'package:ecommerce/features/auth/domain/use_cases/register.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../data/models/login_request.dart';
import '../../domain/use_cases/login.dart';
import 'auth_state.dart';
@singleton
class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._login,this._register) : super(AuthInitial());
 final Login _login;
 final Register _register;
Future<void>register(RegisterRequest request)async{
  emit(AuthRegisterLoading());
  final result=await _register(request);
  result.fold((failure) => emit(AuthRegisterError(message: failure.message)), (user) => emit(AuthAuthenticatedFromRegister(user: user)));
}
  Future<void>login(LoginRequest request)async{
    emit(AuthLoginLoading());
    final result=await _login(request);
    result.fold((failure) =>emit(AuthLoginError(message: failure.message)) , (user) => emit(AuthAuthenticatedFromLogin(user: user)),)  ;
  }
}
