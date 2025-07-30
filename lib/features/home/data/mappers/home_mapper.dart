import 'package:ecommerce/features/home/domain/entities/category.dart';

import '../../../../core/models/category_model.dart';

extension HomeMapper on CategoryModel{
  Category get toEntity =>
     Category(
      id: id,
      name: name,
      imageURL: imageURL,

    );


}
