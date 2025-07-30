import '../../models/product_respone/products_response.dart';
abstract class ProductsRemoteDataSource {
  Future<ProductsResponse> getProducts({String? categoryId});
}
