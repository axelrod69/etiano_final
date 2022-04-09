import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './couponModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CouponProvider with ChangeNotifier {
  String baseUrl = 'https://achievexsolutions.in/current_work/eatiano/';
  Map<String, dynamic> _coupons = {};
  Map<String, dynamic> _discount = {};

  Map<String, dynamic> get coupons {
    return {..._coupons};
  }

  Map<String, dynamic> get discount {
    return {..._discount};
  }

  Future<void> fetchCoupons() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    final url = Uri.parse(baseUrl + 'api/auth/coupon');
    final response = await http.get(url, headers: {
      'Authorization': 'Bearer ${localStorage.getString('token')}',
      'Accept': 'application/json'
    });
    Coupon couponModel = couponFromJson(response.body);
    _coupons = couponModel.toJson();
    print(_coupons);
  }

  void selectedCoupon(String code, double amount) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.setString('couponCode', code);
    localStorage.setDouble('discountAmount', amount);
    _discount = {
      'code': localStorage.getString('couponCode'),
      'amount': localStorage.getDouble('discountAmount')
    };
    print(_discount);
    print(localStorage.getDouble('discountAmount'));
    notifyListeners();
  }

  void deleteCoupon(String code, double amount) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.remove('couponCode');
    localStorage.remove('discountAmount');
    _discount = {'code': '', 'amount': 0};
    notifyListeners();
  }
}
