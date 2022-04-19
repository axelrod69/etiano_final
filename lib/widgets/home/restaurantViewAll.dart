import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/popularRestaurants/popularRestaurantProvider.dart';

class RestaurantList extends StatefulWidget {
  RestaurantListState createState() => RestaurantListState();
}

class RestaurantListState extends State<RestaurantList> {
  bool isLoading = true;

  // final Map<String, dynamic> _restaurants = {
  //   "data": [
  //     {
  //       "id": 1,
  //       "name": "Peter Cat",
  //       "type": "Continental",
  //       "rating": "4.9",
  //       "numberOfRatings": "124",
  //       "image": "assets/images/davide-cantelli-jpkfc5_d-DI-unsplash.png"
  //     },
  //     {
  //       "id": 2,
  //       "name": "Barista",
  //       "type": "Coffee",
  //       "rating": "4.9",
  //       "numberOfRatings": "124",
  //       "image": "assets/images/allison-griffith-VCXk_bO97VQ-unsplash.png"
  //     },
  //     {
  //       "id": 3,
  //       "name": "Pizza Rush Hour",
  //       "type": "Italian",
  //       "rating": "4.9",
  //       "numberOfRatings": "124",
  //       "image": "assets/images/davide-cantelli-jpkfc5_d-DI-unsplash.png"
  //     }
  //   ]
  // };

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
        Provider.of<PopularRestaurantProvider>(context).restaurants;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    bool tabLayout = width > 600;
    bool largeLayout = width > 350 && width < 600;

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        elevation: 0,
        leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Icon(Icons.arrow_back_ios, color: Colors.red)),
        title: Text(
          'Popular Restaurants',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: tabLayout
                  ? 28
                  : largeLayout
                      ? 25
                      : 20),
        ),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            )
          : Container(
              width: double.infinity,
              height: double.infinity,
              child: ListView.builder(
                itemBuilder: (context, index) => InkWell(
                  onTap: () => Navigator.of(context)
                      .pushNamed('/restaurants-screen', arguments: {
                    // 'id': _restaurants["data"][index]["id"],
                    // 'id': provider[index]['restaurant_id'],
                    'id': provider['data'][index]['restaurant_id'],
                    // 'name': _restaurants["data"][index]["name"],
                    'name': provider['data'][index]['restaurant_name'],
                    'type': 'Continental',
                    // 'type': _restaurants["data"][index]["type"],
                    // 'rating': _restaurants["data"][index]["rating"],
                    'rating': provider['data'][index]['restaurant_rating'],
                    // 'image': _restaurants["data"][index]["image"],
                    'image': provider['data'][index]["restaurant_image"],
                    // 'numberOfRatings': _restaurants["data"][index]
                    //     ["numberOfRatings"]
                    'numberOfRatings': provider['data'][index]
                        ['restaurant_rating_count'],
                    'distance': provider['data'][index]['distance']
                  }),
                  child: Container(
                    height: height * 0.15,
                    width: double.infinity,
                    // color: Colors.red,
                    margin: EdgeInsets.only(bottom: height * 0.03),
                    padding: EdgeInsets.only(
                        left: width * 0.01, right: width * 0.01),
                    child: Row(
                      children: [
                        Container(
                          height: double.infinity,
                          width: width * 0.35,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.green, width: 2),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 8,
                                  offset: Offset(1, 2))
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              'https://achievexsolutions.in/current_work/eatiano/${provider['data'][index]['restaurant_image']}',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: width * 0.02),
                        Expanded(
                          child: Container(
                            height: double.infinity,
                            // color: Colors.amber,
                            // padding: EdgeInsets.only(top: height * 0.005),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  provider['data'][index]['restaurant_name'],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: tabLayout
                                          ? 25
                                          : largeLayout
                                              ? 20
                                              : 18),
                                ),
                                SizedBox(height: height * 0.005),
                                Row(
                                  children: [
                                    const Icon(Icons.map, color: Colors.green),
                                    Expanded(
                                      child: Text(
                                        provider['data'][index]
                                            ['restaurant_address'],
                                        // overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: tabLayout
                                                ? 16
                                                : largeLayout
                                                    ? 13
                                                    : 11),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: height * 0.005),
                                Row(
                                  children: [
                                    const Icon(Icons.location_on,
                                        color: Colors.green),
                                    Expanded(
                                      child: Text(
                                        '${provider['data'][index]['distance'].toString()} Kms',
                                        // overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: tabLayout
                                                ? 16
                                                : largeLayout
                                                    ? 13
                                                    : 11),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: height * 0.001),
                                Row(
                                  children: [
                                    const Icon(Icons.star,
                                        color: Colors.yellow),
                                    Text(
                                      provider['data'][index]
                                          ['restaurant_rating'],
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: tabLayout
                                              ? 18
                                              : largeLayout
                                                  ? 15
                                                  : 13),
                                    ),
                                    SizedBox(width: width * 0.01),
                                    Text(
                                      '(${provider['data'][index]['restaurant_rating']} Ratings)',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: tabLayout
                                              ? 18
                                              : largeLayout
                                                  ? 15
                                                  : 13),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                itemCount: provider['data'].length,
              ),
            ),
    );
  }
}
