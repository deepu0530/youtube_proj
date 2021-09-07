// To parse this JSON data, do
//
//     final patchChannelModel = patchChannelModelFromJson(jsonString);

import 'dart:convert';

PatchChannelModel patchChannelModelFromJson(String str) => PatchChannelModel.fromJson(json.decode(str));

String patchChannelModelToJson(PatchChannelModel data) => json.encode(data.toJson());

class PatchChannelModel {
    PatchChannelModel({
        this.message,
        this.data,
    });

    String? message;
    Data? data;

    factory PatchChannelModel.fromJson(Map<String, dynamic> json) => PatchChannelModel(
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
        this.bannerUrl,
        this.profilePicUrl,
        this.description,
        this.createdAt,
        this.updatedAt,
    });

    int? userId;
    int? channelId;
    int? categoryId;
    String? categoryName;
    String? name;
    String? bannerUrl;
    String? profilePicUrl;
    String? description;
    String? createdAt;
    String? updatedAt;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        userId: json["user_id"] == null ? null : json["user_id"],
        channelId: json["channel_id"] == null ? null : json["channel_id"],
        categoryId: json["category_id"] == null ? null : json["category_id"],
        categoryName: json["category_name"] == null ? null : json["category_name"],
        name: json["name"] == null ? null : json["name"],
        bannerUrl: json["banner_url"] == null ? null : json["banner_url"],
        profilePicUrl: json["profile_pic_url"] == null ? null : json["profile_pic_url"],
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
        "banner_url": bannerUrl == null ? null : bannerUrl,
        "profile_pic_url": profilePicUrl == null ? null : profilePicUrl,
        "description": description == null ? null : description,
        "created_at": createdAt == null ? null : createdAt,
        "updated_at": updatedAt == null ? null : updatedAt,
    };
}
