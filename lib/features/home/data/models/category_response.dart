import 'dart:convert';

import '../../../../core/models/category_model.dart';
import '../../../../core/models/metadata.dart';
CategoryResponse categoryResponseFromJson(String str) => CategoryResponse.fromJson(json.decode(str));


class CategoryResponse {
    CategoryResponse({
        required this.metadata,
        required this.categories,
        required this.results,
    });

    Metadata metadata;
    List<CategoryModel> categories;
    int results;

    factory CategoryResponse.fromJson(Map<dynamic, dynamic> json) => CategoryResponse(
        metadata: Metadata.fromJson(json["metadata"]),
        categories: List<CategoryModel>.from(json["data"].map((x) => CategoryModel.fromJson(x))),
        results: json["results"],
    );


}




