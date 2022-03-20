import 'package:flutter/material.dart';
import './membershipModel.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class MembershipProvider with ChangeNotifier {
  Map<String, dynamic> _membership = {};

  Map<String, dynamic> get membership {
    return {..._membership};
  }

  String baseUrl = 'https://achievexsolutions.in/current_work/eatiano/';

  Future<void> getMembershipDetails() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    final url = Uri.parse(baseUrl + 'api/auth/member');
    final response = await http.get(url, headers: {
      'Authorization': 'Bearer ${localStorage.getString('token')}',
      'Accept': 'application/json'
    });
    Membership membershipData = membershipFromJson(response.body);
    _membership = membershipData.toJson();
    print(_membership);
  }
}
