import 'package:flutter/material.dart';

class CartItems {
  final String id;
  final String name;
  final String restaurantName;
  final String price;
  final int quantity;
  final String image;
  final String rating;
  final String totalRatings;

  CartItems(
      {required this.id,
      required this.name,
      required this.restaurantName,
      required this.price,
      required this.quantity,
      required this.image,
      required this.rating,
      required this.totalRatings});
}

class CartItemProvider with ChangeNotifier {
  final List<CartItems> _cartItems = [];
  List<CartItems> _individualItems = [];
  List<CartItems> _restaurantTotal = [];

  double deliveryCost = 40;
  double discountCost = 50;

  List<CartItems> get cartItems {
    return [..._cartItems.toSet().toList()];
  }

  void addItems(String id, String name, String restaurantName, String price,
      int quantity, String image, String rating, String totalRatings) {
    // if (!_cartItems.any((element) => element.id == id)) {
    _cartItems.add(CartItems(
        id: id,
        name: name,
        restaurantName: restaurantName,
        price: price,
        quantity: quantity,
        image: image,
        rating: rating,
        totalRatings: totalRatings));
    notifyListeners();
  }

  void deleteItems(String id) {
    _cartItems.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  // List<dynamic> getProductById(String id) {
  //   return _cartItems.where((element) => element.id == id).toList();
  // }

  List<CartItems> getProductById(String id) {
    _individualItems = _cartItems.where((element) => element.id == id).toList();
    return _individualItems;
  }

  // List<dynamic> getRestaurantTotal(String id) {
  //   _restaurantTotal = _cartItems.where((element) => element.id == id).toList();
  // }

  double get itemTotal {
    double total = 0.0;
    // cartItems.forEach(
    //     (value) => total += double.parse(value.price) * value.quantity);
    return total;
  }

  double get totalAmount {
    double total = 0.0;
    _individualItems.forEach(
        (value) => total += double.parse(value.price) * value.quantity);
    return deliveryCost + total;
  }

  double get checkOutAmount {
    double total = 0.0;
    _individualItems.forEach(
        (value) => total += double.parse(value.price) * value.quantity);
    return (total + deliveryCost) - discountCost;
  }
}
