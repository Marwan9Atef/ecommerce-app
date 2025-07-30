import 'package:dio/dio.dart';
import 'package:ecommerce/core/constant/constant.dart';
import 'package:ecommerce/features/products/data/data_source/remote/products_remote_data_source.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/error/app_exception.dart';
import '../../models/product_respone/products_response.dart';

@LazySingleton(as: ProductsRemoteDataSource)
class ProductsAPIRemoteDataSource implements ProductsRemoteDataSource {
  final Dio _dio;

  const ProductsAPIRemoteDataSource(this._dio);

  @override
  Future<ProductsResponse> getProducts({String? categoryId}) async {
    try {
      final response = await _dio.get(
        APIConstant.productsEndpoint,
        queryParameters: categoryId == null
            ? null
            : {
                'category': categoryId,
              },
      );
      return ProductsResponse.fromJson(response.data);
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = exception.response?.data['message'];
      }
      throw RemoteException(message ?? 'Failed to get products');
    }
  }
}
