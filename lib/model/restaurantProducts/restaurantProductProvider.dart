import 'package:flutter/material.dart';
import './restaurantProductModel.dart';
import 'package:http/http.dart' as http;

class RestaurantProductProvider with ChangeNotifier {
  String baseUrl = 'https://achievexsolutions.in/current_work/eatiano/';
  Map<String, dynamic> _map = {};
  List<dynamic> list = [];
  List<dynamic> _products = [];
  List<dynamic> _productList = [];
  List<dynamic> _category = [];

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

  Future<List<dynamic>> fetchCategory(String id) async {
    final url = Uri.parse(baseUrl + 'api/restaurant_product/$id');
    final response = await http.get(url);
    Category category = categoryFromJson(response.body);

    _map = category.toJson();
    // _map['data'].forEach((value) => list.add(value['category_name'][0]));

    // list = _map['data'].forEach((value) => value['category_name'][0]);

    // _map['data'].forEach((value) => _products.add(value));

    list = _map['data'].map((value) => value['category_name'][0]).toList();

    _products = _map['data'];

    // for (int index in _map['data']) {
    //   print(_map['data'][index]['category_name'][0]);
    // }

    // !_category.contains(list[0]) ? _category.add(list[0]) : null;
    print('Productssssssssssssss $_products');
    print('List $list');
    // print('Category From Response $_category');

    // list.forEach((value) {
    //   !_category.contains(value) ? _category.add(value) : null;
    // });
    _category = list.toSet().toList();
    print('Category From Responseeeee $_category');

    return _category;
  }

  Future<void> productFilter(String category) async {
    // _productList.clear();
    _productList = _products.where((element) {
      return element['category_name'].contains(category);
    }).toList();
    print('Product List $_productList');
    notifyListeners();
  }

  Future<void> clearData() async {
    // _productList.clear();
    _category.clear();
    print('Products Clear $_productList');
    print('Category Clear $_category');
    notifyListeners();
  }
}
