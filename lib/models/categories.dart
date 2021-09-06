// To parse this JSON data, do
//
//     final categoriesModel = categoriesModelFromJson(jsonString);

import 'dart:convert';

CategoriesModel categoriesModelFromJson(String str) => CategoriesModel.fromJson(json.decode(str));

String categoriesModelToJson(CategoriesModel data) => json.encode(data.toJson());

class CategoriesModel {
    CategoriesModel({
        this.videos,
        this.page,
        this.limit,
        this.count,
        this.totalCount,
    });

    List<Video>? videos;
    int? page;
    int? limit;
    int? count;
    int? totalCount;

    factory CategoriesModel.fromJson(Map<String, dynamic> json) => CategoriesModel(
        videos: json["videos"] == null ? null : List<Video>.from(json["videos"].map((x) => Video.fromJson(x))),
        page: json["page"] == null ? null : json["page"],
        limit: json["limit"] == null ? null : json["limit"],
        count: json["count"] == null ? null : json["count"],
        totalCount: json["total_count"] == null ? null : json["total_count"],
    );

    Map<String, dynamic> toJson() => {
        "videos": videos == null ? null : List<dynamic>.from(videos!.map((x) => x.toJson())),
        "page": page == null ? null : page,
        "limit": limit == null ? null : limit,
        "count": count == null ? null : count,
        "total_count": totalCount == null ? null : totalCount,
    };
}

class Video {
    Video({
        this.categoryId,
        this.name,
    });

    int? categoryId;
    String? name;

    factory Video.fromJson(Map<String, dynamic> json) => Video(
        categoryId: json["category_id"] == null ? null : json["category_id"],
        name: json["name"] == null ? null : json["name"],
    );

    Map<String, dynamic> toJson() => {
        "category_id": categoryId == null ? null : categoryId,
        "name": name == null ? null : name,
    };
}
