import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './popularRestaurantModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PopularRestaurantProvider with ChangeNotifier {
  String baseUrl = 'https://achievexsolutions.in/current_work/eatiano/';
  Map<String, dynamic> _restaurants = {};
  Map<String, dynamic> _searchRestaurants = {};
  List<dynamic> _restaurantsList = [];
  final queryParams = {'lat': '22.5735314', 'lng': '88.4331189'};

  Map<String, dynamic> get restaurants {
    return {..._restaurants};
  }

  Map<String, dynamic> get searchRestaurants {
    return {..._searchRestaurants};
  }

  List<dynamic> get restaurantList {
    return [..._restaurantsList];
  }

  Future<void> fetchRestaurants() async {
    // final url = Uri.https('achievexsolutions.in/current_work/eatiano/',
    //     'api/all_restaurant', queryParams);
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    if (localStorage.getString('token') != null) {
      final url = Uri.parse(baseUrl +
          'api/all_restaurant' +
          '?' +
          'lat=${queryParams['lat']}' +
          '&' +
          'lng=${queryParams['lng']}');
      final response = await http.get(url);

      // print(response.body);
      PopularRestaurants popularRestaurants =
          popularRestaurantsFromJson(response.body);
      _restaurants = popularRestaurants.toJson();
      _restaurantsList = _restaurants['data']['data'] as List;
      print(_restaurants);
    } else {
      print('error');
    }
    // print(_restaurantsList);
  }

  // Future<void> searchRestaurants(String query) async {
  //   final url = Uri.parse(baseUrl +
  //       'api/all_restaurant' +
  //       '?' +
  //       'lat=${queryParams['lat']}' +
  //       '&' +
  //       'lng=${queryParams['lng']}');
  //   final response = await http.get(url);
  //   PopularRestaurants popularRestaurants =
  //       popularRestaurantsFromJson(response.body);
  //   _searchRestaurants = popularRestaurants
  //       .toJson()
  //       .map((key, value) => value.where((value) {
  //         return value['data']['data'][]
  //       }));
  // }
}
