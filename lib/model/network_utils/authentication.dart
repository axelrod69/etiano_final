import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Network with ChangeNotifier {
  String url = 'https://achievexsolutions.in/current_work/eatiano/';
  var token = '';
  var _authToken = '';
  bool _isAuth = false;

  bool get auth {
    return _isAuth;
  }

  Future<String?> get authToken async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    _authToken = localStorage.getString('token')!;
    return _authToken;
  }

  // String get token {
  //   return _token;
  // }

  getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    // token = jsonDecode(localStorage.getString('token') ?? '')['access_token'];
    // token = jsonDecode(localStorage.getString('token') ?? '')['token'];
    token = localStorage.getString('token')!;
    // _authToken = localStorage.getString('token')!;
    // print('Token $token');
  }

  authData(data, apiUrl) async {
    var fullUrl = url + apiUrl;
    return await http.post(Uri.parse(fullUrl),
        body: jsonEncode(data), headers: setHeaders());
  }

  forgotPassword(data, apiUrl) async {
    var fullUrl = url + apiUrl;
    return await http.post(Uri.parse(fullUrl),
        body: data, headers: setHeader());
  }

  getData(apiUrl) async {
    var fullUrl = url + apiUrl;
    await getToken();
    return await http.get(Uri.parse(fullUrl), headers: setHeaders());
  }

  setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };

  setHeader() => {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      };

  // checkIfLoggedIn() async {
  //   SharedPreferences localStorage = await SharedPreferences.getInstance();
  //   token = localStorage.getString('token')!;
  //   if (token != '') {
  //     _isAuth = true;
  //   }
  //   return _isAuth ? true : false;
  // }
}
