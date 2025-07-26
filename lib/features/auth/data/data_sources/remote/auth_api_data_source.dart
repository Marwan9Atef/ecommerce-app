import 'package:dio/dio.dart' show Dio, DioException;
import 'package:ecommerce/core/constant/constant.dart';
import 'package:ecommerce/core/error/app_exception.dart';
import 'package:ecommerce/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:ecommerce/features/auth/data/models/login_request.dart';
import 'package:ecommerce/features/auth/data/models/login_response.dart';
import 'package:ecommerce/features/auth/data/models/register_request.dart';
import 'package:ecommerce/features/auth/data/models/register_response.dart';
import 'package:injectable/injectable.dart';
@Singleton(as: AuthRemoteDataSource)
class AuthAPIDataSource implements AuthRemoteDataSource {

  final Dio _dio;

  const AuthAPIDataSource(this._dio);
  @override
  Future<LoginResponse> login(LoginRequest request)async{
    try {
      final response = await _dio.post(
        APIConstant.loginEndpoint,
        data: request.toJson(),

      );

      return LoginResponse.fromJson(response.data);
    }catch(exception){
       String? message;
      if(exception is DioException){
        message=exception.response?.data["message"];
      }
      throw RemoteException(message ?? "An error occurred while logging in.");

    }
  }

  @override
  Future<RegisterResponse> register(RegisterRequest request) async {
    try {
      final response = await _dio.post(
        APIConstant.registerEndpoint,
        data: request.toJson(),
      );

      return RegisterResponse.fromJson(response.data);
    } catch(exception) {
      String? message;
      if (exception is DioException) {
        message = exception.response?.data["message"];
      }
      throw  RemoteException(message ?? "An error occurred while registering.");
    }
  }
}