import 'package:ecommerce/features/home/data/models/category_response.dart';
import 'package:ecommerce/features/home/domain/entities/category.dart';

extension HomeMapper on CategoryModel{
  Category get toEntity =>
     Category(
      id: id,
      name: name,
      imageURL: imageURL,

    );


}
