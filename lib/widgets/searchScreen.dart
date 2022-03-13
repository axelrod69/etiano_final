import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/popularRestaurants/popularRestaurantProvider.dart';
import '../model/popular_dishes/popular_dishes_provider.dart';

class SearchScreenWidget extends StatefulWidget {
  SearchScreenWidgetState createState() => SearchScreenWidgetState();
}

class SearchScreenWidgetState extends State<SearchScreenWidget> {
  bool value = true;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textScale = MediaQuery.of(context).textScaleFactor * 1.2;
    final popularRestaurants =
        Provider.of<PopularRestaurantProvider>(context).restaurants;
    final popularDishes =
        Provider.of<PopularDishesProvider>(context).popularDishes;

    // TODO: implement build
    return Column(
      children: [
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Restaurants',
                textScaleFactor: textScale,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12),
              ),
              Transform.scale(
                scale: 1.2,
                child: Switch.adaptive(
                    thumbColor: value
                        ? MaterialStateProperty.all(Colors.red)
                        : MaterialStateProperty.all(Colors.amber),
                    trackColor: value
                        ? MaterialStateProperty.all(
                            Color.fromRGBO(255, 194, 168, 1))
                        : MaterialStateProperty.all(
                            const Color.fromRGBO(255, 250, 168, 1)),
                    value: value,
                    onChanged: (value) {
                      setState(() {
                        this.value = value;
                      });
                    }),
              ),
              Text(
                'Food',
                textScaleFactor: textScale,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
