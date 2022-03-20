// To parse this JSON data, do
//
//     final membership = membershipFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Membership membershipFromJson(String str) =>
    Membership.fromJson(json.decode(str));

String membershipToJson(Membership data) => json.encode(data.toJson());

class Membership {
  Membership({
    required this.status,
    required this.data,
  });

  final String status;
  final List<Datum> data;

  factory Membership.fromJson(Map<String, dynamic> json) => Membership(
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
    required this.membershipTypeId,
    required this.membershipTypeName,
    required this.membershipPrice,
    required this.timePeriod,
    required this.discountPercent,
    required this.createdAt,
    required this.updatedAt,
  });

  final int membershipTypeId;
  final String membershipTypeName;
  final String membershipPrice;
  final String timePeriod;
  final String discountPercent;
  final dynamic createdAt;
  final dynamic updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        membershipTypeId: json["membership_type_id"],
        membershipTypeName: json["membership_type_name"],
        membershipPrice: json["membership_price"],
        timePeriod: json["time_period"],
        discountPercent: json["discount_percent"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "membership_type_id": membershipTypeId,
        "membership_type_name": membershipTypeName,
        "membership_price": membershipPrice,
        "time_period": timePeriod,
        "discount_percent": discountPercent,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
