import 'package:dartz/dartz.dart';
import 'package:ecommerce/features/products/domain/entities/product.dart';

import '../../../../core/failure/failure.dart';
abstract class ProductsRepository {
  Future<Either<Failure, List<Product>>> getProducts({String? categoryId});
}
