import 'package:eatiano_app/model/restaurantProducts/restaurantProductProvider.dart';
import 'package:eatiano_app/screens/itemDetails.dart';
import 'package:flutter/material.dart';
import '../widgets/home/homeContent.dart';
import 'package:provider/provider.dart';
import '../model/cart/cart_provider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import '../model/location/location.dart';
import '../model/popular_dishes/popular_dishes_provider.dart';
import '../model/popularRestaurants/popularRestaurantProvider.dart';
import '../widgets/searchScreen.dart';

class SearchScreen extends StatefulWidget {
  SearchScreenState createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen> {
  bool _toggleDropDown = false;
  // bool _searchIcon = false;
  final _controller = TextEditingController();
  bool switchState = true;
  bool isLoading = true;
  List<dynamic> query = [];
  List<dynamic> data = [];
  List<dynamic> queryRestaurant = [];
  List<dynamic> restauranData = [];

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

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<PopularDishesProvider>(context, listen: false)
        .searchFoodData()
        .then((_) {
      setState(() {
        isLoading = false;
        data = Provider.of<PopularDishesProvider>(context, listen: false)
            .searchDish;
        query = data;
      });
    });

    Provider.of<PopularRestaurantProvider>(context, listen: false)
        .searchRestaurant()
        .then((_) {
      isLoading = false;
      restauranData =
          Provider.of<PopularRestaurantProvider>(context, listen: false)
              .restaurantList;
      queryRestaurant = restauranData;
    });
    super.initState();
  }

  searchByQuery(String search) {
    setState(() {
      query = data
          .where((element) => element['product_name']
              .toLowerCase()
              .contains(search.toLowerCase()))
          .toList();
    });
    setState(() {
      queryRestaurant = restauranData
          .where((element) => element['restaurant_name']
              .toLowerCase()
              .contains(search.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    bool tabLayout = width > 600;
    bool largeLayout = width > 350 && width < 600;
    // final textScale = MediaQuery.of(context).textScaleFactor * 1.2;
    final provider = Provider.of<CartItemProvider>(context).cartItems;

    print('Controller ${_controller.text}');

    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 5,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            // backgroundColor: Colors.green,
            titleSpacing: 0,
            toolbarHeight: 100,
            title: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 40,
                  // color: Colors.amber,
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 10),
                        height: 14,
                        width: double.infinity,
                        // color: Colors.red,
                        child: const Text(
                          'Delivering To',
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 13),
                        ),
                      ),
                      Container(
                        height: 26,
                        width: double.infinity,
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        // color: Colors.blue,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                Provider.of<LocationProvider>(context).address,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: const TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                            ),
                            // const SizedBox(width: 20),
                            Container(
                                height: double.infinity,
                                width: 20,
                                // color: Colors.yellow,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      _toggleDropDown = !_toggleDropDown;
                                    });
                                    _toggleDropDown
                                        ? Navigator.of(context)
                                            .pushNamed('/change-location')
                                        : null;
                                  },
                                  child: Icon(
                                    !_toggleDropDown
                                        ? Icons.keyboard_arrow_down
                                        : Icons.keyboard_arrow_up,
                                    color: Colors.red,
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      height: 60,
                      width: double.infinity,
                      // color: Colors.red,
                      padding: const EdgeInsets.only(top: 8, left: 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.search,
                            size: 30,
                            color: Colors.grey,
                          ),
                          // if (_searchIcon)
                          Expanded(
                            child: Center(
                              child: Container(
                                margin:
                                    const EdgeInsets.only(bottom: 6, right: 4),
                                padding: tabLayout
                                    ? EdgeInsets.only(left: 6)
                                    : largeLayout
                                        ? EdgeInsets.only(left: 6)
                                        : EdgeInsets.only(
                                            left: 6, right: 4, bottom: 2),
                                // height: double.infinity,
                                height: tabLayout
                                    ? 45
                                    : largeLayout
                                        ? 45
                                        : 39,
                                width: width * 0.7,
                                decoration: BoxDecoration(
                                    // color: Colors.transparent,
                                    // color: Colors.amber,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(14)),
                                    border: Border.all(
                                        color: Colors.grey, width: 2)),
                                child: Row(
                                  children: [
                                    Flexible(
                                        flex: 9,
                                        fit: FlexFit.tight,
                                        child: Center(
                                          child: TextField(
                                            controller: _controller,
                                            onChanged: (value) =>
                                                searchByQuery(value),
                                            autofocus: true,
                                            cursorColor: Colors.grey,
                                            style: const TextStyle(
                                                color: Colors.grey,
                                                fontSize: 18),
                                            decoration: const InputDecoration(
                                              border: InputBorder.none,
                                              // hintText:
                                              //     'Search By Restaurant or Food',
                                              // hintStyle: TextStyle(
                                              //     color: Colors.grey,
                                              //     fontSize: tabLayout
                                              //         ? 22
                                              //         : largeLayout
                                              //             ? 16
                                              //             : 12),
                                              // suffixIcon: Icon(
                                              //   Icons.send,
                                              //   color: Colors.grey,
                                              //   size: 20,
                                              // )
                                            ),
                                          ),
                                        )),
                                    Flexible(
                                      flex: 1,
                                      fit: FlexFit.tight,
                                      child: InkWell(
                                        onTap: () =>
                                            Navigator.of(context).pop(),
                                        child: const Icon(Icons.close,
                                            color: Colors.grey),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          // SizedBox(width: width * 0.01),
                          Row(
                            children: [
                              InkWell(
                                onTap: () => Navigator.of(context)
                                    .pushReplacementNamed('/cart-screen'),
                                child: const Icon(
                                  Icons.shopping_cart_outlined,
                                  color: Colors.grey,
                                  size: 30,
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: const Icon(
                                  Icons.notifications_none_outlined,
                                  color: Colors.grey,
                                  size: 30,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    provider.length > 0
                        ? Positioned(
                            right: width * 0.06,
                            top: height * 0.02,
                            child: CircleAvatar(
                              radius: 8,
                              backgroundColor: Colors.red,
                              child: Text(
                                provider.length > 9
                                    ? '9+'
                                    : provider.length.toString(),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10),
                              ),
                            ),
                          )
                        : Container(color: Colors.transparent),
                    Positioned(
                      right: width * 0.001,
                      top: height * 0.02,
                      child: const CircleAvatar(
                        radius: 8,
                        backgroundColor: Colors.red,
                        child: Text(
                          '9+',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 10),
                        ),
                      ),
                    )
                  ],
                )
              ],
            )),
        body: Column(
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Restaurants',
                    // textScaleFactor: textScale,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: tabLayout
                            ? 18
                            : largeLayout
                                ? 16
                                : 14),
                  ),
                  Transform.scale(
                    scale: 1.2,
                    child: Switch.adaptive(
                        thumbColor: switchState
                            ? MaterialStateProperty.all(Colors.red)
                            : MaterialStateProperty.all(Colors.amber),
                        trackColor: switchState
                            ? MaterialStateProperty.all(
                                Color.fromRGBO(255, 194, 168, 1))
                            : MaterialStateProperty.all(
                                const Color.fromRGBO(255, 250, 168, 1)),
                        value: switchState,
                        onChanged: (value) {
                          setState(() {
                            switchState = value;
                          });
                        }),
                  ),
                  Text(
                    'Food',
                    // textScaleFactor: textScale,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: tabLayout
                            ? 18
                            : largeLayout
                                ? 16
                                : 14),
                  ),
                ],
              ),
            ),
            switchState
                ? (isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : Expanded(
                        child: Container(
                          width: double.infinity,
                          // color: Colors.red,
                          child: ListView.builder(
                            itemBuilder: (context, index) => InkWell(
                              onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (_) => ItemDetails(query[index]
                                              ['product_id']
                                          .toString()))),
                              child: Container(
                                margin: EdgeInsets.only(bottom: height * 0.01),
                                padding: EdgeInsets.only(left: width * 0.02),
                                child: Row(
                                  children: [
                                    Container(
                                      width: width * 0.25,
                                      // height: height * 0.2,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.green, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          'https://achievexsolutions.in/current_work/eatiano/${query[index]['product_image']}',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: width * 0.02),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          query[index]['product_name'],
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: tabLayout
                                                  ? 18
                                                  : largeLayout
                                                      ? 16
                                                      : 14),
                                        ),
                                        Text(
                                          'from ${query[index]['restaurant_name']}',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: tabLayout
                                                  ? 18
                                                  : largeLayout
                                                      ? 16
                                                      : 14),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            // dishProvider['data'][index]['product_name']),
                            // provider[index]['product_name'])),
                            // itemCount: dishProvider["data"].length,
                            itemCount: query.length,
                          ),
                        ),
                      ))
                : (isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : Expanded(
                        child: Container(
                          width: double.infinity,
                          // color: Colors.blue,
                          child: ListView.builder(
                            itemBuilder: (context, index) => InkWell(
                              onTap: () => Navigator.of(context)
                                  .pushNamed('/restaurants-screen', arguments: {
                                // 'id': _restaurants["data"][index]["id"],
                                // 'id': provider[index]['restaurant_id'],
                                'id': query[index]['restaurant_id'],
                                // 'name': _restaurants["data"][index]["name"],
                                'name': query[index]['restaurant_name'],
                                'type': _restaurants["data"][index]["type"],
                                // 'rating': _restaurants["data"][index]["rating"],
                                'rating': query[index]['restaurant_rating'],
                                // 'image': _restaurants["data"][index]["image"],
                                'image': query[index]["restaurant_image"],
                                // 'numberOfRatings': _restaurants["data"][index]
                                //     ["numberOfRatings"]
                                'numberOfRatings': query[index]
                                    ['restaurant_rating_count'],
                                'distance': query[index]['distance']
                              }),
                              child: Container(
                                margin: EdgeInsets.only(bottom: height * 0.01),
                                padding: EdgeInsets.only(left: width * 0.02),
                                child: Row(
                                  children: [
                                    Container(
                                      width: width * 0.25,
                                      // height: height * 0.2,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.green, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          'https://achievexsolutions.in/current_work/eatiano/${queryRestaurant[index]['restaurant_image']}',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: width * 0.02),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          queryRestaurant[index]
                                              ['restaurant_name'],
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: tabLayout
                                                  ? 18
                                                  : largeLayout
                                                      ? 16
                                                      : 14),
                                        ),
                                        SizedBox(height: height * 0.01),
                                        Text(
                                          queryRestaurant[index]
                                              ['restaurant_address'],
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: tabLayout
                                                  ? 15
                                                  : largeLayout
                                                      ? 13
                                                      : 11),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            itemCount: queryRestaurant.length,
                          ),
                        ),
                      ))
          ],
        ));
  }
}
