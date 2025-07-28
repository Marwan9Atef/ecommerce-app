import 'package:dio/dio.dart';
import 'package:ecommerce/core/constant/constant.dart';
import 'package:ecommerce/core/error/app_exception.dart';
import 'package:ecommerce/features/home/data/data_sources/remote/home_remote_data_source.dart';
import 'package:ecommerce/features/home/data/models/category_response.dart';
import 'package:injectable/injectable.dart';
@LazySingleton(as:HomeRemoteDataSource)
class HomeAPIDataSource implements HomeRemoteDataSource {
 final Dio _dio;
 const HomeAPIDataSource(this._dio);
  @override
  Future<CategoryResponse> getCategories() async {
    try {
      final response = await _dio.get(APIConstant.categoryEndpoint);
      return CategoryResponse.fromJson(response.data);
    }catch(exception){
      String? message;
      if(exception is DioException){
        message=exception.response?.data["message"];
      }
      throw RemoteException(message??"Failed to get categories");

    }
  }
}