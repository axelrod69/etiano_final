import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import './blogs_model.dart';

class BlogsProvider with ChangeNotifier {
  Map<String, dynamic> _blogs = {};
  String baseUrl = 'https://achievexsolutions.in/current_work/eatiano/';

  Map<String, dynamic> get blogs {
    return {..._blogs};
  }

  Future<void> fetchData() async {
    final url = Uri.parse(baseUrl + 'api/all_blogs');
    final response = await http.get(url);
    // print(response.body);
    Blogs blogs = blogsFromJson(response.body);
    _blogs = blogs.toJson();
    print(_blogs);
  }
}
