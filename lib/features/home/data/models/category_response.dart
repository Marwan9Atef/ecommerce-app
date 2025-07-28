import 'dart:convert';
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

class CategoryModel {
    CategoryModel({
        required this.imageURL,
        required this.createdAt,
        required this.name,
        required this.id,
        required this.slug,
        required this.updatedAt,
    });

    String imageURL;
    DateTime createdAt;
    String name;
    String id;
    String slug;
    DateTime updatedAt;

    factory CategoryModel.fromJson(Map<dynamic, dynamic> json) => CategoryModel(
        imageURL: json["image"],
        createdAt: DateTime.parse(json["createdAt"]),
        name: json["name"],
        id: json["_id"],
        slug: json["slug"],
        updatedAt: DateTime.parse(json["updatedAt"]),
    );


}

class Metadata {
    Metadata({
        required this.numberOfPages,
        required this.limit,
        required this.currentPage,
    });

    int numberOfPages;
    int limit;
    int currentPage;

    factory Metadata.fromJson(Map<dynamic, dynamic> json) => Metadata(
        numberOfPages: json["numberOfPages"],
        limit: json["limit"],
        currentPage: json["currentPage"],
    );

}
