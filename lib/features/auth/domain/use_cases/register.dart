import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/failure/failure.dart';
import '../../data/models/register_request.dart';
import '../entities/user.dart';
import '../repositories/auth_repository.dart';
@singleton
class Register {
  Register(this._authRepository);
  final AuthRepository _authRepository;
  Future<Either<Failure,User>>call(RegisterRequest request)=>_authRepository.register(request);

}