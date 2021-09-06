// To parse this JSON data, do
//
//     final patchCategoryModel = patchCategoryModelFromJson(jsonString);

import 'dart:convert';

PatchCategoryModel patchCategoryModelFromJson(String str) => PatchCategoryModel.fromJson(json.decode(str));

String patchCategoryModelToJson(PatchCategoryModel data) => json.encode(data.toJson());

class PatchCategoryModel {
    PatchCategoryModel({
        this.message,
        this.data,
    });

    String? message;
    Data? data;

    factory PatchCategoryModel.fromJson(Map<String, dynamic> json) => PatchCategoryModel(
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message == null ? null : message,
        "data": data == null ? null : data!.toJson(),
    };
}

class Data {
    Data({
        this.categoryId,
        this.name,
    });

    int? categoryId;
    String? name;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        categoryId: json["category_id"] == null ? null : json["category_id"],
        name: json["name"] == null ? null : json["name"],
    );

    Map<String, dynamic> toJson() => {
        "category_id": categoryId == null ? null : categoryId,
        "name": name == null ? null : name,
    };
}
