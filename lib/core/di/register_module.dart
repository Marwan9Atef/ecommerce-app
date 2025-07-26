import 'package:dio/dio.dart';
import 'package:ecommerce/core/constant/constant.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegisterModule {
  @singleton
  Dio get dio=> Dio(BaseOptions(baseUrl: APIConstant.baseURL,receiveDataWhenStatusError: true));

  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

}