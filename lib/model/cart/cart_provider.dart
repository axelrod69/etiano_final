import 'dart:convert';
import 'package:flutter/material.dart';
import '../network_utils/authentication.dart';
import 'package:http/http.dart' as http;
import './cartModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

// class CartItem {
//   final int id;
//   final String name;
//   final String restaurantName;
//   final double price;
//   final double quantity;
//   final String image;
//   // final String rating;
//   // final String totalRatings;
//   // final String restaurantId;
//   final String restaurantId;

//   CartItem(
//       {required this.id,
//       required this.name,
//       required this.restaurantName,
//       required this.price,
//       required this.quantity,
//       required this.image,
//       // required this.rating,
//       // required this.totalRatings,
//       required this.restaurantId});
// }

class CartItemProvider with ChangeNotifier {
  Map<String, dynamic> _cartItems = {};
  // Map<String, dynamic> _individualItems = {};
  final List<dynamic> _cartItemList = [];
  List<dynamic> _individualItems = [];
  // List<CartItem> _restaurantTotal = [];

  Network network = Network();

  String baseUrl = 'https://achievexsolutions.in/current_work/eatiano/';

  double deliveryCost = 40;
  double discountCost = 50;

  // List<CartItem> get cartItems {
  //   return [..._cartItems.toSet().toList()];
  // }

  List<dynamic> get cartItemList {
    return [..._cartItemList];
  }

  Map<String, dynamic> get cartItems {
    return {..._cartItems};
  }

  Future<void> fetchCartItems() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    final url = Uri.parse(baseUrl + 'api/auth/cart');
    // final response = await http.get(url, headers: {
    //   // 'Authorization': 'Bearer ${network.getToken()}',
    //   'Authorization': 'Bearer ${network.setHeaders()}',
    //   'Accept': 'application/json'
    // });
    final response = await http.get(url, headers: {
      'Authorization': 'Bearer ${localStorage.getString('token')}',
      'Accept': 'application/json'
    });
    Cart cartJson = cartFromJson(response.body);

    _cartItems = cartJson.toJson();
    // _cartItems.forEach((key, values) => _cartItemList.add(values['data']));

    // print('Cart Item $_cartItems');
  }

  Future<void> deleteCartItems(String id) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    final url = Uri.parse(baseUrl + 'api/auth/cart/$id');
    final response = await http.delete(url, headers: {
      'Authorization': 'Bearer ${localStorage.getString('token')}',
      'Accept': 'application/json'
    });
    // print(response.body);
    notifyListeners();
  }

  Future<void> addItems(
      int id,
      String name,
      String restaurantName,
      String price,
      int quantity,
      String image,
      String rating,
      String totalRatings,
      String restaurantId) async {
    // print(id);
    // print(quantity);
    // print(restaurantId);
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    final url = Uri.parse(baseUrl + 'api/auth/cart');
    final response = await http.post(url,
        // body: jsonEncode({
        //   'product_id': id,
        //   'restaurant_id': restaurantId,
        //   'quantity': quantity,
        // }),
        body: {
          'product_id': id.toString(),
          'restaurant_id': restaurantId,
          'quantity': quantity.toString(),
        },
        //     headers: {
        //   'Authorization': 'Bearer ${network.getToken()}',
        //   'Accept': 'application/json'
        // }
        headers: {
          'Authorization': 'Bearer ${localStorage.getString('token')}',
          'Accept': 'application/json'
        });
    // print(response.body);
    // print('Token ${network.getToken()}');
  }

  // String id
  void deleteItems(int id) {
    // _cartItems.removeWhere((element) => element.id == id);
    // _individualItems.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  // List<dynamic> getProductById(String id) {
  //   return _cartItems.where((element) => element.id == id).toList();
  // }

  // List<CartItem> getProductById(String id) {
  //   _individualItems = _cartItems.where((element) => element.id == id).toList();
  //   return _individualItems;
  // }

  // List<dynamic> getRestaurantTotal(String id) {
  //   _restaurantTotal = _cartItems.where((element) => element.id == id).toList();
  // }

  double get itemTotal {
    double total = 0.0;
    // cartItems.forEach(
    //     (value) => total += double.parse(value.price) * value.quantity);
    return total;
  }

  // double get itemAmount {
  //   double total = 0.0;
  //   _cartItems.forEach((value) => total += value.price * value.quantity);
  //   return total;
  // }
  double get itemAmount {
    double total = 0.0;
    // _cartItems['data'].forEach((key, value) => total +=
    //     double.parse(value['product_selling_price']) *
    //         double.parse(value['quantity']));
    // return total;
    total = _cartItems['data'].fold(
        0,
        (price, value) =>
            price +
            (double.parse(value['product_selling_price']) *
                double.parse(value['quantity'])));
    return total;
  }

  double get totalAmount {
    double total = 0.0;
    _individualItems.forEach((value) => total +=
        double.parse(value['data']['product_selling_price']) *
            double.parse(value['data']['quantity']));
    // notifyListeners();
    return deliveryCost + total;
  }

  double get checkOutAmount {
    double total = 0.0;
    _individualItems.forEach((value) => total += value.price * value.quantity);
    return (total + deliveryCost) - discountCost;
  }
}

// print(network.getToken());
    // print(restaurantName);
    // if (!_cartItems.any((element) => element.id == id)) {
    // if (_cartItems.contains(restaurantName) == restaurantName) {
    // if (_cartItems.contains(restaurantName)) {
    // _cartItems.add(CartItem(
    //     id: id,
    //     name: name,
    //     restaurantName: restaurantName,
    //     price: double.parse(price),
    //     quantity: quantity.toDouble(),
    //     image: image,
    //     rating: rating,
    //     totalRatings: totalRatings));
    // } else {
    //   _cartItems.clear();
    //   _cartItems.add(CartItem(
    //       id: id,
    //       name: name,
    //       restaurantName: restaurantName,
    //       price: double.parse(price),
    //       quantity: quantity.toDouble(),
    //       image: image,
    //       rating: rating,
    //       totalRatings: totalRatings));
    // notifyListeners();
    // }
