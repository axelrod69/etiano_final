import 'package:flutter/material.dart';
import './profileModel.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class ProfileProvider with ChangeNotifier {
  String baseUrl = 'https://achievexsolutions.in/current_work/eatiano/';
  Map<String, dynamic> _profile = {};

  Map<String, dynamic> get profile {
    return {..._profile};
  }

  Future<void> fetchData() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    print('Profile Token ${localStorage.getString('token')}');
    final url = Uri.parse(baseUrl + 'api/auth/me');
    final response = await http.get(url, headers: {
      'Authorization': 'Bearer ${localStorage.getString('token')}',
      'Accept': 'application/json'
    });
    _profile = json.decode(response.body);
    // print(response.body);
    // Profile profileData = profileFromJson(response.body);
    // _profile = profileData.toJson();
    // print(_profile);
    print('Profile Data $_profile');
  }
}
