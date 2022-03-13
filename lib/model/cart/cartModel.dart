// To parse this JSON data, do
//
//     final cart = cartFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Cart cartFromJson(String str) => Cart.fromJson(json.decode(str));

String cartToJson(Cart data) => json.encode(data.toJson());

class Cart {
  Cart({
    required this.status,
    required this.data,
  });

  String status;
  List<Datum> data;

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
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
    required this.productRating,
    required this.productRatingCount,
    required this.productSellCount,
    required this.quantity,
  });

  int cartId;
  String restaurantId;
  String productId;
  String restaurantName;
  String productName;
  String productDescription;
  String productImage;
  String productSellingPrice;
  String productStatus;
  String productQuantity;
  dynamic productRating;
  dynamic productRatingCount;
  dynamic productSellCount;
  String quantity;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
        productRating: json["product_rating"],
        productRatingCount: json["product_rating_count"],
        productSellCount: json["product_sell_count"],
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
        "product_rating": productRating,
        "product_rating_count": productRatingCount,
        "product_sell_count": productSellCount,
        "quantity": quantity,
      };
}
