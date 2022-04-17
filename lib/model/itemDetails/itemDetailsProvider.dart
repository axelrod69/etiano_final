import 'package:flutter/material.dart';
import './itemDetailsModel.dart';
import 'package:http/http.dart' as http;

class ItemDetailsProvider with ChangeNotifier {
  String baseUrl = 'https://achievexsolutions.in/current_work/eatiano/';
  Map<String, dynamic> _itemDetails = {};

  Map<String, dynamic> get itemDetails {
    return {..._itemDetails};
  }

  Future<void> getItemDetails(String productId) async {
    final url = Uri.parse(baseUrl + 'api/all_products/$productId');
    final response = await http.get(url);
    // print('Item Details ${response.body}');
    ItemDetails itemDetailsJson = itemDetailsFromJson(response.body);
    _itemDetails = itemDetailsJson.toJson();
    print('Item Details $_itemDetails');
  }
}
