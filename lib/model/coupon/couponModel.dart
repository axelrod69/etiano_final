// To parse this JSON data, do
//
//     final coupon = couponFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Coupon couponFromJson(String str) => Coupon.fromJson(json.decode(str));

String couponToJson(Coupon data) => json.encode(data.toJson());

class Coupon {
  Coupon({
    required this.data,
  });

  final List<Datum> data;

  factory Coupon.fromJson(Map<String, dynamic> json) => Coupon(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.couponId,
    required this.couponCode,
    required this.condition,
    required this.discount,
    required this.couponImage,
    required this.createdAt,
    required this.updatedAt,
  });

  final int couponId;
  final String couponCode;
  final String condition;
  final String discount;
  final String couponImage;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        couponId: json["coupon_id"],
        couponCode: json["coupon_code"],
        condition: json["condition"],
        discount: json["discount"],
        couponImage: json["coupon_image"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "coupon_id": couponId,
        "coupon_code": couponCode,
        "condition": condition,
        "discount": discount,
        "coupon_image": couponImage,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
