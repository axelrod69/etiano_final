// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import '../popular_dishes/popular_dishes_model.dart';
// import 'dart:convert';

// class Dishes with ChangeNotifier {
//   Map<String, dynamic> _dishes = {};
//   String baseUrl = 'https://achievexsolutions.in/current_work/eatiano/';

//   Map<String, dynamic> get dishes {
//     return {..._dishes};
//   }

//   Future<Map<String, dynamic>> getBooks(String query) async {
//     final url = Uri.parse(baseUrl + 'api/all_products');
//     final response = await http.get(url);
//     Map<String, dynamic> popularDish = json.decode(response.body);
//     return popularDish.map((key, value) => Popular)
//   }
// }
