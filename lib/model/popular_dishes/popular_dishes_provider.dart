import 'package:flutter/material.dart';
import './popular_dishes_model.dart';
import 'package:http/http.dart' as http;

class PopularDishesProvider with ChangeNotifier {
  Map<String, dynamic> _popularDishes = {};
  String baseUrl = 'https://achievexsolutions.in/current_work/eatiano/';

  Map<String, dynamic> get popularDishes {
    return {..._popularDishes};
  }

  Future<void> fetchData() async {
    final url = Uri.parse(baseUrl + 'api/all_products');
    final response = await http.get(url);
    // print(response.body);
    PopularDishes popularDishes = popularDishesFromJson(response.body);
    _popularDishes = popularDishes.toJson();
    // print(_popularDishes);
  }
}


// import 'package:flutter/material.dart';
// import './popular_dishes_model.dart';


// class PopularDishesProvider with ChangeNotifier {
//   final Map<String, dynamic> _popularDishes = {
//     "data": [
//       {
//         "id": "1",
//         "name": "Chicken Tandoor Combo",
//         "restaurantName": "Tandoori House",
//         "price": "455",
//         "rating": "4.3",
//         "totalRatings": "154",
//         "image": "assets/images/Rectangle 17323.png",
//         "isFavourite": false
//       },
//       {
//         "id": "2",
//         "name": "Pan Cake",
//         "restaurantName": "The Pancake Centre",
//         "price": "250",
//         "rating": "4.7",
//         "totalRatings": "256",
//         "image": "assets/images/Rectangle 17324.png",
//         "isFavourite": false
//       },
//       {
//         "id": "3",
//         "name": "Salad",
//         "restaurantName": "The Pancake House",
//         "price": "180",
//         "rating": "4.1",
//         "totalRatings": "203",
//         "image": "assets/images/Rectangle 17325.png",
//         "isFavourite": false
//       },
//       {
//         "id": "4",
//         "name": "Roast Chicken",
//         "restaurantName": "Kentucky\"s Fried Chicken",
//         "price": "550",
//         "rating": "4.8",
//         "totalRatings": "1000",
//         "image": "assets/images/Rectangle 17323 (2).png",
//         "isFavourite": false
//       },
//       {
//         "id": "5",
//         "name": "Ice Cream",
//         "restaurantName": "Naturals",
//         "price": "80",
//         "rating": "5.0",
//         "totalRatings": "1500",
//         "image": "assets/images/Rectangle 17324 (2).png",
//         "isFavourite": false
//       },
//       {
//         "id": "6",
//         "name": "Chicken Tandoor Combo",
//         "restaurantName": "Tandoori House",
//         "price": "455",
//         "rating": "4.3",
//         "totalRatings": "154",
//         "image": "assets/images/Rectangle 17323.png",
//         "isFavourite": false
//       },
//       {
//         "id": "7",
//         "name": "Pan Cake",
//         "restaurantName": "The Pancake Centre",
//         "price": "250",
//         "rating": "4.7",
//         "totalRatings": "256",
//         "image": "assets/images/Rectangle 17324.png",
//         "isFavourite": false
//       },
//       {
//         "id": "8",
//         "name": "Salad",
//         "restaurantName": "The Pancake House",
//         "price": "180",
//         "rating": "4.1",
//         "totalRatings": "203",
//         "image": "assets/images/Rectangle 17325.png",
//         "isFavourite": false
//       },
//       {
//         "id": "9",
//         "name": "Roast Chicken",
//         "restaurantName": "Kentucky\"s Fried Chicken",
//         "price": "550",
//         "rating": "4.8",
//         "totalRatings": "1000",
//         "image": "assets/images/Rectangle 17323 (2).png",
//         "isFavourite": false
//       },
//       {
//         "id": "10",
//         "name": "Ice Cream",
//         "restaurantName": "Naturals",
//         "price": "80",
//         "rating": "5.0",
//         "totalRatings": "1500",
//         "image": "assets/images/Rectangle 17324 (2).png",
//         "isFavourite": false
//       }
//     ]
//   };

//   Map<String, dynamic> get popularDishes {
//     return {..._popularDishes};
//   }

//   List<Map<String, dynamic>> getProductById(String id) {
//     //The filter method that I've tried to write that yields the error
//     return _popularDishes["data"].where((value) => value["id"] == id).toList();
//   }

//   // void fetchData() {
//   //   final Map<String, dynamic> data = popularDishesFromJson(_popularDishes.toString()) as Map<String, dynamic>;
//   // }
// }
