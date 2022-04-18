// To parse this JSON data, do
//
//     final review = reviewFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Review reviewFromJson(String str) => Review.fromJson(json.decode(str));

String reviewToJson(Review data) => json.encode(data.toJson());

class Review {
  Review({
    required this.status,
    required this.data,
  });

  final String status;
  final List<Datum> data;

  factory Review.fromJson(Map<String, dynamic> json) => Review(
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
    required this.restaurantName,
    required this.rate,
    required this.review,
    required this.name,
  });

  final String restaurantName;
  final String rate;
  final String review;
  final dynamic name;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        restaurantName: json["restaurant_name"],
        rate: json["rate"],
        review: json["review"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "restaurant_name": restaurantName,
        "rate": rate,
        "review": review,
        "name": name,
      };
}
