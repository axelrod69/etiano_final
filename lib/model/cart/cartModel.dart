// To parse this JSON data, do
//
//     final cart = cartFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Cart> cartFromJson(String str) =>
    List<Cart>.from(json.decode(str).map((x) => Cart.fromJson(x)));

String cartToJson(List<Cart> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Cart {
  Cart({
    required this.cartId,
    required this.restaurantId,
    required this.productId,
    required this.restaurantName,
    required this.productName,
    required this.productDescription,
    required this.productImage,
    required this.productSellingPrice,
    required this.productStatus,
    required this.productQuantity,
    required this.quantity,
  });

  final int cartId;
  final String restaurantId;
  final String productId;
  final String restaurantName;
  final String productName;
  final String productDescription;
  final String productImage;
  final String productSellingPrice;
  final String productStatus;
  final String productQuantity;
  final String quantity;

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        cartId: json["cart_id"],
        restaurantId: json["restaurant_id"],
        productId: json["product_id"],
        restaurantName: json["restaurant_name"],
        productName: json["product_name"],
        productDescription: json["product_description"],
        productImage: json["product_image"],
        productSellingPrice: json["product_selling_price"],
        productStatus: json["product_status"],
        productQuantity: json["product_quantity"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "cart_id": cartId,
        "restaurant_id": restaurantId,
        "product_id": productId,
        "restaurant_name": restaurantName,
        "product_name": productName,
        "product_description": productDescription,
        "product_image": productImage,
        "product_selling_price": productSellingPrice,
        "product_status": productStatus,
        "product_quantity": productQuantity,
        "quantity": quantity,
      };
}

// // To parse this JSON data, do
// //
// //     final cart = cartFromJson(jsonString);

// import 'package:meta/meta.dart';
// import 'dart:convert';

// Cart cartFromJson(String str) => Cart.fromJson(json.decode(str));

// String cartToJson(Cart data) => json.encode(data.toJson());

// class Cart {
//   Cart({
//     required this.status,
//     required this.data,
//   });

//   final String status;
//   final List<Datum> data;

//   factory Cart.fromJson(Map<String, dynamic> json) => Cart(
//         status: json["status"],
//         data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "status": status,
//         "data": List<dynamic>.from(data.map((x) => x.toJson())),
//       };
// }

// class Datum {
//   Datum({
//     required this.cartId,
//     required this.restaurantId,
//     required this.productId,
//     required this.restaurantName,
//     required this.productName,
//     required this.productDescription,
//     required this.productImage,
//     required this.productSellingPrice,
//     required this.productStatus,
//     required this.productQuantity,
//     required this.quantity,
//   });

//   final int cartId;
//   final String restaurantId;
//   final String productId;
//   final String restaurantName;
//   final String productName;
//   final String productDescription;
//   final String productImage;
//   final String productSellingPrice;
//   final String productStatus;
//   final String productQuantity;
//   final String quantity;

//   factory Datum.fromJson(Map<String, dynamic> json) => Datum(
//         cartId: json["cart_id"],
//         restaurantId: json["restaurant_id"],
//         productId: json["product_id"],
//         restaurantName: json["restaurant_name"],
//         productName: json["product_name"],
//         productDescription: json["product_description"],
//         productImage: json["product_image"],
//         productSellingPrice: json["product_selling_price"],
//         productStatus: json["product_status"],
//         productQuantity: json["product_quantity"],
//         quantity: json["quantity"],
//       );

//   Map<String, dynamic> toJson() => {
//         "cart_id": cartId,
//         "restaurant_id": restaurantId,
//         "product_id": productId,
//         "restaurant_name": restaurantName,
//         "product_name": productName,
//         "product_description": productDescription,
//         "product_image": productImage,
//         "product_selling_price": productSellingPrice,
//         "product_status": productStatus,
//         "product_quantity": productQuantity,
//         "quantity": quantity,
//       };
// }
