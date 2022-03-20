// To parse this JSON data, do
//
//     final authorization = authorizationFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Authorization authorizationFromJson(String str) =>
    Authorization.fromJson(json.decode(str));

String authorizationToJson(Authorization data) => json.encode(data.toJson());

class Authorization {
  Authorization({
    required this.accessToken,
    required this.tokenType,
    required this.role,
    required this.expiresIn,
  });

  final String accessToken;
  final String tokenType;
  final String role;
  final int expiresIn;

  factory Authorization.fromJson(Map<String, dynamic> json) => Authorization(
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        role: json["role"],
        expiresIn: json["expires_in"],
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "token_type": tokenType,
        "role": role,
        "expires_in": expiresIn,
      };
}
