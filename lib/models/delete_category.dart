// To parse this JSON data, do
//
//     final deleteCategoryModel = deleteCategoryModelFromJson(jsonString);

import 'dart:convert';

DeleteCategoryModel deleteCategoryModelFromJson(String str) => DeleteCategoryModel.fromJson(json.decode(str));

String deleteCategoryModelToJson(DeleteCategoryModel data) => json.encode(data.toJson());

class DeleteCategoryModel {
    DeleteCategoryModel({
        this.message,
    });

    String? message;

    factory DeleteCategoryModel.fromJson(Map<String, dynamic> json) => DeleteCategoryModel(
        message: json["message"] == null ? null : json["message"],
    );

    Map<String, dynamic> toJson() => {
        "message": message == null ? null : message,
    };
}
