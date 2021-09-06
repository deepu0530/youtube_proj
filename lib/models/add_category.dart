// To parse this JSON data, do
//
//     final addCategoryModel = addCategoryModelFromJson(jsonString);

import 'dart:convert';

AddCategoryModel addCategoryModelFromJson(String str) => AddCategoryModel.fromJson(json.decode(str));

String addCategoryModelToJson(AddCategoryModel data) => json.encode(data.toJson());

class AddCategoryModel {
    AddCategoryModel({
        this.message,
        this.data,
    });

    String? message;
    Data? data;

    factory AddCategoryModel.fromJson(Map<String, dynamic> json) => AddCategoryModel(
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
        this.categoryName,
    });

    int? categoryId;
    String? categoryName;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        categoryId: json["category_id"] == null ? null : json["category_id"],
        categoryName: json["category_name"] == null ? null : json["category_name"],
    );

    Map<String, dynamic> toJson() => {
        "category_id": categoryId == null ? null : categoryId,
        "category_name": categoryName == null ? null : categoryName,
    };
}
