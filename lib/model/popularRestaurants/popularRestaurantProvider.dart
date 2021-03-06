import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './popularRestaurantModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PopularRestaurantProvider with ChangeNotifier {
  String baseUrl = 'https://achievexsolutions.in/current_work/eatiano/';
  Map<String, dynamic> _restaurants = {};
  Map<String, dynamic> _temp = {};
  Map<String, dynamic> _searchRestaurants = {};
  List<dynamic> _fetchRestaurants = [];
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

  List<dynamic> get fetchAllRestaurants {
    return [..._fetchRestaurants];
  }

  Future<void> fetchRestaurants(double latitude, double longitude) async {
    // final url = Uri.https('achievexsolutions.in/current_work/eatiano/',
    //     'api/all_restaurant', queryParams);
    // SharedPreferences localStorage = await SharedPreferences.getInstance();
    final url = Uri.parse(baseUrl +
        'api/all_restaurant' +
        '?' +
        // 'lat=${latitude.toString()}' +
        'lat=${queryParams['lat']}'
            '&' +
        // 'lng=${longitude.toString()}'
        'lng=${queryParams['lng']}');
    final response = await http.get(url);

    // print(response.body);
    PopularRestaurants popularRestaurants =
        popularRestaurantsFromJson(response.body);
    _restaurants = popularRestaurants.toJson();
    // _restaurantsList = _restaurants['data']['data'] as List;
    // print('Restaurant List $_restaurants');
    print('Fetch Restaurants $_restaurants');
  }

  Future<void> searchRestaurant() async {
    final url = Uri.parse(baseUrl +
        'api/all_restaurant' +
        '?' +
        // 'lat=${latitude.toString()}' +
        'lat=${queryParams['lat']}' +
        '&' +
        // 'lng=${longitude.toString()}'
        'lng=${queryParams['lng']}');
    final response = await http.get(url);
    PopularRestaurants popularRestaurants =
        popularRestaurantsFromJson(response.body);
    _temp = popularRestaurants.toJson();
    _restaurantsList = _temp['data'] as List;
    print(_restaurantsList);
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
