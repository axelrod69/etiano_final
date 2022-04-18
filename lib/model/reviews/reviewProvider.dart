import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import './reviewModel.dart';

class ReviewProvider with ChangeNotifier {
  String baseUrl = 'https://achievexsolutions.in/current_work/eatiano/';
  Map<String, dynamic> _ratingsAndReviews = {};

  Map<String, dynamic> get ratingsAndReviews {
    return {..._ratingsAndReviews};
  }

  Future<void> fetchReview(String restaurantId) async {
    final url = Uri.parse(baseUrl + 'api/rating/$restaurantId');
    final response = await http.get(url);

    Review reviewModel = reviewFromJson(response.body);
    _ratingsAndReviews = reviewModel.toJson();

    print(_ratingsAndReviews);
  }

  Future<Map<String, dynamic>> postReview(
      String restaurantId, String rating, String review, String userId) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();

    final url = Uri.parse(baseUrl + 'api/auth/rating');
    final response = await http.post(url, body: {
      'restaurant_id': restaurantId,
      'rating': rating,
      'review': rating,
      'user_id': userId
    }, headers: {
      'Authorization': 'Bearer ${localStorage.getString('token')}',
      'Accept': 'application/json'
    });

    Map<String, dynamic> result = json.decode(response.body);
    print(result);

    return result;
  }
}
