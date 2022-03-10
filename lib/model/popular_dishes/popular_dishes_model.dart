// To parse this JSON data, do
//
//     final PopularDishes = PopularDishesFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

PopularDishes popularDishesFromJson(String str) =>
    PopularDishes.fromJson(json.decode(str));

String popularDishesToJson(PopularDishes data) => json.encode(data.toJson());

class PopularDishes {
  PopularDishes({
    required this.status,
    required this.data,
  });

  final String status;
  final List<Datum> data;

  factory PopularDishes.fromJson(Map<String, dynamic> json) => PopularDishes(
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
    required this.productId,
    required this.restaurantName,
    required this.productName,
    required this.productDesciption,
    required this.productImage,
    required this.productSellingPrice,
    required this.productStatus,
    required this.productQuantity,
    required this.productRating,
    required this.productRatingCount,
    required this.productSellCount,
  });

  final int productId;
  final String restaurantName;
  final String productName;
  final String productDesciption;
  final String productImage;
  final String productSellingPrice;
  final String productStatus;
  final String productQuantity;
  final dynamic productRating;
  final dynamic productRatingCount;
  final dynamic productSellCount;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        productId: json["product_id"],
        restaurantName: json["restaurant_name"],
        productName: json["product_name"],
        productDesciption: json["product_desciption"],
        productImage: json["product_image"],
        productSellingPrice: json["product_selling_price"],
        productStatus: json["product_status"],
        productQuantity: json["product_quantity"],
        productRating: json["product_rating"],
        productRatingCount: json["product_rating_count"],
        productSellCount: json["product_sell_count"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "restaurant_name": restaurantName,
        "product_name": productName,
        "product_desciption": productDesciption,
        "product_image": productImage,
        "product_selling_price": productSellingPrice,
        "product_status": productStatus,
        "product_quantity": productQuantity,
        "product_rating": productRating,
        "product_rating_count": productRatingCount,
        "product_sell_count": productSellCount,
      };
}




// // To parse this JSON data, do
// //
// //     final PopularDishes = popularDishesFromJson(jsonString);

// import 'package:meta/meta.dart';
// import 'dart:convert';

// PopularDishes popularDishesFromJson(String str) =>
//     PopularDishes.fromJson(json.decode(str));

// String popularDishesToJson(PopularDishes data) => json.encode(data.toJson());

// class PopularDishes {
//   PopularDishes({
//     required this.data,
//   });

//   List<Datum> data;

//   factory PopularDishes.fromJson(Map<String, dynamic> json) => PopularDishes(
//         data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "data": List<dynamic>.from(data.map((x) => x.toJson())),
//       };
// }

// class Datum {
//   Datum({
//     required this.id,
//     required this.name,
//     required this.restaurantName,
//     required this.price,
//     required this.rating,
//     required this.totalRatings,
//     required this.image,
//   });

//   String id;
//   String name;
//   String restaurantName;
//   String price;
//   String rating;
//   String totalRatings;
//   String image;

//   factory Datum.fromJson(Map<String, dynamic> json) => Datum(
//         id: json["id"],
//         name: json["name"],
//         restaurantName: json["restaurantName"],
//         price: json["price"],
//         rating: json["rating"],
//         totalRatings: json["totalRatings"],
//         image: json["image"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "restaurantName": restaurantName,
//         "price": price,
//         "rating": rating,
//         "totalRatings": totalRatings,
//         "image": image,
//       };
// }
