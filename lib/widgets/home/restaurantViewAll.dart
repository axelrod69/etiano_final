import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/popularRestaurants/popularRestaurantProvider.dart';

class RestaurantList extends StatefulWidget {
  RestaurantListState createState() => RestaurantListState();
}

class RestaurantListState extends State<RestaurantList> {
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<PopularRestaurantProvider>(context, listen: false)
        .fetchRestaurants()
        .then((_) {
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider =
        Provider.of<PopularRestaurantProvider>(context).restaurantList;

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Icon(Icons.arrow_back_ios, color: Colors.red)),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            )
          : Container(
              width: double.infinity,
              height: double.infinity,
              child: ListView.builder(
                itemBuilder: (context, index) => Container(
                  color: Colors.red,
                  child: Text(provider[index]['restaurant_name']),
                ),
                itemCount: provider.length,
              ),
            ),
    );
  }
}
