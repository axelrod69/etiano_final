// To parse this JSON data, do
//
//     final profile = profileFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Profile profileFromJson(String str) => Profile.fromJson(json.decode(str));

String profileToJson(Profile data) => json.encode(data.toJson());

class Profile {
  Profile({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.role,
    required this.referId,
    required this.refarelId,
    required this.oAuthId,
    required this.fbId,
    required this.country,
    required this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final String name;
  final String email;
  final String phone;
  final String role;
  final dynamic referId;
  final String refarelId;
  final dynamic oAuthId;
  final dynamic fbId;
  final dynamic country;
  final dynamic emailVerifiedAt;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        role: json["role"],
        referId: json["refer_id"],
        refarelId: json["refarel_id"],
        oAuthId: json["o_auth_id"],
        fbId: json["fb_id"],
        country: json["country"],
        emailVerifiedAt: json["email_verified_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "role": role,
        "refer_id": referId,
        "refarel_id": refarelId,
        "o_auth_id": oAuthId,
        "fb_id": fbId,
        "country": country,
        "email_verified_at": emailVerifiedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
