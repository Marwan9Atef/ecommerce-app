import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/app_exception.dart';
import 'package:ecommerce/core/failure/failure.dart';
import 'package:ecommerce/features/auth/data/data_sources/local/auth_local_date_source.dart';
import 'package:ecommerce/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:ecommerce/features/auth/data/mappers/user_mapper.dart';
import 'package:ecommerce/features/auth/data/models/login_request.dart' as auth_repository_impl;
import 'package:ecommerce/features/auth/data/models/register_request.dart';
import 'package:injectable/injectable.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
@Singleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
 final AuthLocalDateSource _localDateSource;
 final AuthRemoteDataSource _remoteDataSource;
 AuthRepositoryImpl( this._localDateSource,  this._remoteDataSource);
 @override
  Future<Either<Failure,User>>login(auth_repository_impl.LoginRequest request)async{
   try {
     final response = await _remoteDataSource.login(request);
     await _localDateSource.saveToken(response.token);
     return right(response.user.toEntity);
   }on AppException catch (exception) {
     return left(Failure(exception.message));


   }

 }
@override
  Future<Either<Failure,User>>register(RegisterRequest request)async{
   try {
     final response = await _remoteDataSource.register(request);
     await _localDateSource.saveToken(response.token);
     return Right(response.user.toEntity);
   }on AppException catch (exception) {
     return  Left(Failure(exception.message));
   }

}

}