// To parse this JSON data, do
//
//     final channelsModel = channelsModelFromJson(jsonString);

import 'dart:convert';

ChannelsModel channelsModelFromJson(String str) => ChannelsModel.fromJson(json.decode(str));

String channelsModelToJson(ChannelsModel data) => json.encode(data.toJson());

class ChannelsModel {
    ChannelsModel({
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

    factory ChannelsModel.fromJson(Map<String, dynamic> json) => ChannelsModel(
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
        this.channelId,
        this.categoryId,
        this.name,
        this.banner,
        this.profilePic,
        this.description,
        this.createdAt,
        this.updatedAt,
    });

    int? channelId;
    int? categoryId;
    String? name;
    String? banner;
    String? profilePic;
    String? description;
    String? createdAt;
    String? updatedAt;

    factory Video.fromJson(Map<String, dynamic> json) => Video(
        channelId: json["channel_id"] == null ? null : json["channel_id"],
        categoryId: json["category_id"] == null ? null : json["category_id"],
        name: json["name"] == null ? null : json["name"],
        banner: json["banner"] == null ? null : json["banner"],
        profilePic: json["profile_pic"] == null ? null : json["profile_pic"],
        description: json["description"] == null ? null : json["description"],
        createdAt: json["created_at"] == null ? null : json["created_at"],
        updatedAt: json["updated_at"] == null ? null : json["updated_at"],
    );

    Map<String, dynamic> toJson() => {
        "channel_id": channelId == null ? null : channelId,
        "category_id": categoryId == null ? null : categoryId,
        "name": name == null ? null : name,
        "banner": banner == null ? null : banner,
        "profile_pic": profilePic == null ? null : profilePic,
        "description": description == null ? null : description,
        "created_at": createdAt == null ? null : createdAt,
        "updated_at": updatedAt == null ? null : updatedAt,
    };
}
