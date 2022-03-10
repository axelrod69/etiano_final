// To parse this JSON data, do
//
//     final Blogs = BlogsFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Blogs blogsFromJson(String str) => Blogs.fromJson(json.decode(str));

String blogsToJson(Blogs data) => json.encode(data.toJson());

class Blogs {
  Blogs({
    required this.status,
    required this.data,
  });

  final int status;
  final List<Datum> data;

  factory Blogs.fromJson(Map<String, dynamic> json) => Blogs(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.name,
    required this.blogImageId,
    required this.blogId,
    required this.blogImage,
    required this.createdAt,
    required this.updatedAt,
    required this.userId,
    required this.blogHeading,
    required this.blogSubheading,
    required this.blogDetails,
    required this.blogMainImage,
    required this.blogMetaData,
    required this.blogLikes,
  });

  final String name;
  final dynamic blogImageId;
  final int blogId;
  final dynamic blogImage;
  final dynamic createdAt;
  final dynamic updatedAt;
  final String userId;
  final String blogHeading;
  final String blogSubheading;
  final String blogDetails;
  final String blogMainImage;
  final String blogMetaData;
  final String blogLikes;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        name: json["name"],
        blogImageId: json["blog_image_id"],
        blogId: json["blog_id"],
        blogImage: json["blog_image"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        userId: json["user_id"],
        blogHeading: json["blog_heading"],
        blogSubheading: json["blog_subheading"],
        blogDetails: json["blog_details"],
        blogMainImage: json["blog_main_image"],
        blogMetaData: json["blog_meta_data"],
        blogLikes: json["blog_likes"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "blog_image_id": blogImageId,
        "blog_id": blogId,
        "blog_image": blogImage,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "user_id": userId,
        "blog_heading": blogHeading,
        "blog_subheading": blogSubheading,
        "blog_details": blogDetails,
        "blog_main_image": blogMainImage,
        "blog_meta_data": blogMetaData,
        "blog_likes": blogLikes,
      };
}
