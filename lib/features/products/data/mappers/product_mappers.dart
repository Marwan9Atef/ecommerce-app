import 'package:ecommerce/features/products/domain/entities/product.dart';
import '../models/product_respone/product_model.dart';
extension ProductMapper on ProductModel {
  Product get toEntity => Product(
        sold: sold,
        imagesURLs: imagesURLs,
        ratingsQuantity: ratingsQuantity,
        id: id,
        title: title,
        description: description,
        quantity: quantity,
        price: price,
        priceAfterDiscount: priceAfterDiscount,
        imageCoverURL: imageCoverURL,
        ratingsAverage: ratingsAverage,
      );
}
