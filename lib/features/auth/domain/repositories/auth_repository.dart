import 'package:dartz/dartz.dart';
import '../../../../core/failure/failure.dart';
import '../../data/models/login_request.dart' as auth_repository_impl;
import '../../data/models/register_request.dart';

import '../entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failure,User>>login(auth_repository_impl.LoginRequest request);
  Future<Either<Failure,User>>register(RegisterRequest request);



}