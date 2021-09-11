// To parse this JSON data, do
//
//     final addChannelModel = addChannelModelFromJson(jsonString);

import 'dart:convert';

AddChannelModel addChannelModelFromJson(String str) => AddChannelModel.fromJson(json.decode(str));

String addChannelModelToJson(AddChannelModel data) => json.encode(data.toJson());

class AddChannelModel {
    AddChannelModel({
        this.message,
        this.data,
    });

    String? message;
    Data? data;

    factory AddChannelModel.fromJson(Map<String, dynamic> json) => AddChannelModel(
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
        this.userId,
        this.channelId,
        this.categoryId,
        this.categoryName,
        this.name,
        this.banner,
        this.profilePic,
        this.description,
        this.createdAt,
        this.updatedAt,
    });

    int? userId;
    int? channelId;
    int? categoryId;
    String? categoryName;
    String? name;
    String? banner;
    String? profilePic;
    String? description;
    String? createdAt;
    String? updatedAt;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        userId: json["user_id"] == null ? null : json["user_id"],
        channelId: json["channel_id"] == null ? null : json["channel_id"],
        categoryId: json["category_id"] == null ? null : json["category_id"],
        categoryName: json["category_name"] == null ? null : json["category_name"],
        name: json["name"] == null ? null : json["name"],
        banner: json["banner"] == null ? null : json["banner"],
        profilePic: json["profile_pic"] == null ? null : json["profile_pic"],
        description: json["description"] == null ? null : json["description"],
        createdAt: json["created_at"] == null ? null : json["created_at"],
        updatedAt: json["updated_at"] == null ? null : json["updated_at"],
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId == null ? null : userId,
        "channel_id": channelId == null ? null : channelId,
        "category_id": categoryId == null ? null : categoryId,
        "category_name": categoryName == null ? null : categoryName,
        "name": name == null ? null : name,
        "banner": banner == null ? null : banner,
        "profile_pic": profilePic == null ? null : profilePic,
        "description": description == null ? null : description,
        "created_at": createdAt == null ? null : createdAt,
        "updated_at": updatedAt == null ? null : updatedAt,
    };
}
