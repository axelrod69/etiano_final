import 'package:flutter/material.dart';
import './restaurantProductModel.dart';
import 'package:http/http.dart' as http;

class RestaurantProductProvider with ChangeNotifier {
  String baseUrl = 'https://achievexsolutions.in/current_work/eatiano/';
  Map<String, dynamic> _map = {};
  List<dynamic> list = [];
  final List<dynamic> _products = [];
  List<dynamic> _productList = [];
  final List<dynamic> _category = [];

  Map<String, dynamic> get map {
    return {..._map};
  }

  List<dynamic> get category {
    return [..._category];
  }

  List<dynamic> get products {
    return [..._products];
  }

  List<dynamic> get productList {
    return [..._productList];
  }

  Future<void> fetchCategory(String id) async {
    final url = Uri.parse(baseUrl + 'api/restaurant_product/$id');
    final response = await http.get(url);

    Category category = categoryFromJson(response.body);

    _map = category.toJson();
    _map['data'].forEach((value) => list.add(value['category_name'][0]));
    _map['data'].forEach((value) => _products.add(value));
    // !_category.contains(list[0]) ? _category.add(list[0]) : null;
    list.forEach((value) {
      !_category.contains(value) ? _category.add(value) : null;
    });

    print('List $list');
    print('Category From Response $_category');

    // print('Category Response ${response.body}');
    // _products = _products.where((element) {
    //   return element['category_name'].contains('efg');
    // }).toList();
    // print(_products);
    // // print(list);
    // print('Category List $_category');
  }

  Future<void> productFilter(String category) async {
    _productList = _products.where((element) {
      return element['category_name'].contains(category);
    }).toList();
    print('Product List $_productList');
    notifyListeners();
  }

  Future<void> clearData() async {
    _productList.clear();
    _category.clear();
    notifyListeners();
  }
}
