import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class OrderIdProvider with ChangeNotifier {
  String baseUrl = 'https://achievexsolutions.in/current_work/eatiano/';
  Map<String, dynamic> _orderId = {};

  Map<String, dynamic> get orderId {
    return {..._orderId};
  }

  Future<void> getOrderId(String state, String couponCode) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    final url = Uri.parse(baseUrl + 'api/auth/order_id');
    final response = await http.post(url, body: {
      'state': state,
      'coupon_code': couponCode
    }, headers: {
      'Authorization': 'Bearer ${localStorage.getString('token')}',
      'Accept': 'application/json'
    });

    print(response.body);
  }
}
