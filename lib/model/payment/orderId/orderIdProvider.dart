import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import './orderIdModel.dart';
import 'dart:convert';

class OrderIdProvider with ChangeNotifier {
  String baseUrl = 'https://achievexsolutions.in/current_work/eatiano/';
  Map<String, dynamic> _orderId = {};

  Map<String, dynamic> get orderId {
    return {..._orderId};
  }

  // List<dynamic> _orderId = [];

  // List<dynamic> get orderId {
  //   return [..._orderId];
  // }

  Future<Map<String, dynamic>> getOrderId(
    String state,
    // String couponCode,
    String couponId,
  ) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    final url = Uri.parse(baseUrl + 'api/auth/order_id');
    final response = await http.post(url, body: {
      'state': state,
      'coupon_code': couponId
    }, headers: {
      'Authorization': 'Bearer ${localStorage.getString('token')}',
      'Accept': 'application/json'
    });

    var res = json.decode(response.body);

    var jsonData = jsonDecode(response.body);
    OrderId fetchOrderId = OrderId.fromJson(jsonData['data']);
    _orderId = fetchOrderId.toJson();

    print(_orderId);

    return _orderId;
    // return _orderId;
    // res['data'].map((element) => _orderId.add(element)).toList();
    // // res['data'].forEach((key, value) => _orderId.add(value));
    // // _orderId = ;
    // print(' $_orderId');

    // OrderId idOrder = orderIdFromJson(res['data'].toString());
    // _orderId = idOrder.toJson();
    // print(_orderId);
  }
}
