// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
    Welcome({
        required this.email,
        required this.id,
        required this.name,
        required this.picture,
    });

    String email;
    int id;
    String name;
    Picture picture;

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        email: json["email"],
        id: json["id"],
        name: json["name"],
        picture: Picture.fromJson(json["picture"]),
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "id": id,
        "name": name,
        "picture": picture.toJson(),
    };
}

class Picture {
    Picture({
        required this.data,
    });

    Data data;

    factory Picture.fromJson(Map<String, dynamic> json) => Picture(
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}

class Data {
    Data({
        required this.height,
        required this.isSilhouette,
        required this.url,
        required this.width,
    });

    int height;
    int isSilhouette;
    String url;
    int width;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        height: json["height"],
        isSilhouette: json["is_silhouette"],
        url: json["url"],
        width: json["width"],
    );

    Map<String, dynamic> toJson() => {
        "height": height,
        "is_silhouette": isSilhouette,
        "url": url,
        "width": width,
    };
}
