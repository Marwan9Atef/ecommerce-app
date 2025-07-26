import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/failure/failure.dart';
import '../../data/models/login_request.dart' as auth_repository_impl;
import '../entities/user.dart';
import '../repositories/auth_repository.dart';
@singleton
class Login {
  final AuthRepository _authRepository;
  const Login(this._authRepository);
  Future<Either<Failure,User>>call(auth_repository_impl.LoginRequest request)=>_authRepository.login(request);

}