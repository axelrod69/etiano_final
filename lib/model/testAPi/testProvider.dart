import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './model.dart';

class TestProvider with ChangeNotifier {
  Map<String, dynamic> _data = {};

  Map<String, dynamic> get data {
    return {..._data};
  }

  Future<void> getTestData() async {
    final url = Uri.parse('http://worldtimeapi.org/api/timezone/Asia/Kolkata');
    final response = await http.get(url);
    print(response.body);
  }
}
