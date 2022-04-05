import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/popularRestaurants/popularRestaurantProvider.dart';

class Restaurants extends StatefulWidget {
  RestaurantsState createState() => RestaurantsState();
}

class RestaurantsState extends State<Restaurants> {
  bool _isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<PopularRestaurantProvider>(context, listen: false)
        .fetchRestaurants()
        .then((_) {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var textScale = MediaQuery.of(context).textScaleFactor;
    // final provider =
    //     Provider.of<PopularRestaurantProvider>(context).restaurantList;
    final response =
        Provider.of<PopularRestaurantProvider>(context).restaurants;
    // final response =
    //     Provider.of<PopularRestaurantProvider>(context).fetchAllRestaurants;

    // print('Response from widget $response');

    final Map<String, dynamic> _restaurants = {
      "data": [
        {
          "id": 1,
          "name": "Peter Cat",
          "type": "Continental",
          "rating": "4.9",
          "numberOfRatings": "124",
          "image": "assets/images/davide-cantelli-jpkfc5_d-DI-unsplash.png"
        },
        {
          "id": 2,
          "name": "Barista",
          "type": "Coffee",
          "rating": "4.9",
          "numberOfRatings": "124",
          "image": "assets/images/allison-griffith-VCXk_bO97VQ-unsplash.png"
        },
        {
          "id": 3,
          "name": "Pizza Rush Hour",
          "type": "Italian",
          "rating": "4.9",
          "numberOfRatings": "124",
          "image": "assets/images/davide-cantelli-jpkfc5_d-DI-unsplash.png"
        }
      ]
    };

    // TODO: implement build
    return _isLoading
        ? const Center(
            child: CircularProgressIndicator(
              color: Colors.red,
            ),
          )
        : Container(
            width: double.infinity,
            height: height * 0.5,
            // color: Colors.red,
            padding: EdgeInsets.only(top: height * 0.01, left: 0.05),
            margin: EdgeInsets.only(bottom: height * 0.05),
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => InkWell(
                onTap: () => Navigator.of(context)
                    .pushNamed('/restaurants-screen', arguments: {
                  // 'id': _restaurants["data"][index]["id"],
                  // 'id': provider[index]['restaurant_id'],
                  'id': response['data'][index]['restaurant_id'],
                  // 'name': _restaurants["data"][index]["name"],
                  'name': response['data'][index]['restaurant_name'],
                  'type': _restaurants["data"][index]["type"],
                  // 'rating': _restaurants["data"][index]["rating"],
                  'rating': response['data'][index]['restaurant_rating'],
                  // 'image': _restaurants["data"][index]["image"],
                  'image': response['data'][index]["restaurant_image"],
                  // 'numberOfRatings': _restaurants["data"][index]
                  //     ["numberOfRatings"]
                  'numberOfRatings': response['data'][index]
                      ['restaurant_rating_count'],
                  'distance': response['data'][index]['distance']
                }),
                child: Container(
                  width: double.infinity,
                  height: height * 0.14,
                  // color: Colors.yellow,
                  margin: EdgeInsets.only(bottom: height * 0.02),
                  child: Row(
                    children: [
                      // Image.asset(_restaurants["data"][index]["image"]),
                      Container(
                        width: width * 0.3,
                        height: height * 0.12,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 8,
                                  offset: Offset(2, 1))
                            ]),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                              'https://achievexsolutions.in/current_work/eatiano/${response['data'][index]['restaurant_image']}'),
                        ),
                      ),
                      SizedBox(width: width * 0.03),
                      Container(
                        width: width * 0.5,
                        height: double.infinity,
                        padding: EdgeInsets.only(top: height * 0.022),
                        // color: Colors.green,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              // _restaurants["data"][index]["name"],
                              response['data'][index]['restaurant_name'],
                              textScaleFactor: textScale,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                            SizedBox(height: height * 0.01),
                            Row(
                              children: [
                                Text(
                                  'Cafe',
                                  textScaleFactor: textScale,
                                  style: const TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(width: width * 0.02),
                                Text(
                                  '.${_restaurants["data"][index]["type"]}',
                                  textScaleFactor: textScale,
                                  style: const TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(height: height * 0.02),
                            Row(
                              children: [
                                Image.asset('assets/images/Path 8561.png'),
                                SizedBox(width: width * 0.02),
                                Text(
                                  response['data'][index]['restaurant_rating'],
                                  // _restaurants["data"][index]["rating"],
                                  textScaleFactor: textScale,
                                  style: const TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(width: width * 0.02),
                                Text(
                                  '(${response['data'][index]['restaurant_rating_count']} ratings)',
                                  textScaleFactor: textScale,
                                  style: const TextStyle(color: Colors.white),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              // itemCount: provider["data"]["data"].length,
              itemCount: 3,
            ),
          );
  }
}
