// ignore_for_file: sized_box_for_whitespace

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

class HomeScreen extends StatefulWidget {
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  bool _toggleDropDown = false;
  bool _searchIcon = false;
  final _controller = TextEditingController();

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   Provider.of<PopularDishesProvider>(context).fetchData();
  // }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    bool tabLayout = width > 600;
    bool largeLayout = width > 350 && width < 600;
    final provider = Provider.of<CartItemProvider>(context).cartItems;

    print('height $height');
    print('width $width');

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 5,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          // backgroundColor: Colors.green,
          titleSpacing: 0,
          toolbarHeight: tabLayout ? height * 0.15 : height * 0.13,
          title: Column(
            children: [
              Container(
                width: double.infinity,
                height: height * 0.048,
                // color: Colors.amber,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 10),
                      height: tabLayout
                          ? height * 0.016
                          : largeLayout
                              ? height * 0.014
                              : height * 0.018,
                      width: double.infinity,
                      // color: Colors.red,
                      child: Text(
                        'Delivering To',
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: tabLayout
                                ? 18
                                : largeLayout
                                    ? 13
                                    : 10),
                      ),
                    ),
                    // isLoading
                    //     ? Container(
                    //         height: height * 0.02,
                    //         width: width * 0.045,
                    //         child: const Center(
                    //           child: CircularProgressIndicator(
                    //             color: Colors.red,
                    //             strokeWidth: 2,
                    //           ),
                    //         ),
                    //       )
                    //     :
                    Container(
                      height: tabLayout ? height * 0.032 : height * 0.03,
                      width: double.infinity,
                      padding: const EdgeInsets.only(left: 10, right: 8),
                      // color: Colors.blue,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              Provider.of<LocationProvider>(context).address,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: tabLayout
                                      ? 20
                                      : largeLayout
                                          ? 12
                                          : 10),
                            ),
                          ),
                          // const SizedBox(width: 20),
                          Container(
                              height: double.infinity,
                              width: tabLayout ? width * 0.06 : 20,
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
                                  size: tabLayout ? 30 : 20,
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
                    height: height * 0.055,
                    width: double.infinity,
                    // color: Colors.red,
                    padding: const EdgeInsets.only(left: 6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.search,
                          size: tabLayout
                              ? 45
                              : largeLayout
                                  ? 30
                                  : 20,
                          color: Colors.grey,
                        ),
                        // if (_searchIcon)
                        Expanded(
                          child: Center(
                            child: InkWell(
                              onTap: () => Navigator.of(context)
                                  .pushNamed('/search-screen'),
                              child: Container(
                                margin: EdgeInsets.only(
                                    bottom: tabLayout ? 2 : 6, right: 4),
                                padding:
                                    EdgeInsets.only(left: tabLayout ? 15 : 6),
                                // height: double.infinity,
                                height: tabLayout
                                    ? height * 0.06
                                    : largeLayout
                                        ? 45
                                        : 60,
                                width: tabLayout ? width * 0.82 : width * 0.7,
                                decoration: BoxDecoration(
                                    // color: Colors.transparent,
                                    // color: Colors.amber,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(14)),
                                    border: Border.all(
                                        color: Colors.grey, width: 2)),
                                child: Row(
                                  children: [
                                    Text(
                                      'Search By Restaurant or Food',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: tabLayout
                                            ? 22
                                            : largeLayout
                                                ? 16
                                                : 12,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: width * 0.01),
                        Row(
                          children: [
                            InkWell(
                              onTap: () => Navigator.of(context)
                                  .pushNamed('/cart-screen'),
                              child: Icon(
                                Icons.shopping_cart_outlined,
                                color: Colors.grey,
                                size: tabLayout
                                    ? 38
                                    : largeLayout
                                        ? 30
                                        : 20,
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Icon(
                                Icons.notifications_none_outlined,
                                color: Colors.grey,
                                size: tabLayout
                                    ? 38
                                    : largeLayout
                                        ? 30
                                        : 20,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  provider.length > 0
                      ? Positioned(
                          right: tabLayout ? width * 0.035 : width * 0.06,
                          top: tabLayout
                              ? height * 0.01
                              : largeLayout
                                  ? height * 0.02
                                  : height * 0.006,
                          child: CircleAvatar(
                            radius: tabLayout
                                ? 10
                                : largeLayout
                                    ? 8
                                    : 6,
                            backgroundColor: Colors.red,
                            child: Text(
                              provider.length > 9
                                  ? '9+'
                                  : provider.length.toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: tabLayout
                                      ? 15
                                      : largeLayout
                                          ? 10
                                          : 8),
                            ),
                          ),
                        )
                      : Container(color: Colors.transparent),
                  Positioned(
                    right: width * 0.001,
                    top: tabLayout
                        ? height * 0.01
                        : largeLayout
                            ? height * 0.02
                            : height * 0.006,
                    child: CircleAvatar(
                      radius: tabLayout
                          ? 10
                          : largeLayout
                              ? 8
                              : 6,
                      backgroundColor: Colors.red,
                      child: Text(
                        '9+',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: tabLayout
                                ? 15
                                : largeLayout
                                    ? 10
                                    : 8),
                      ),
                    ),
                  )
                ],
              )
            ],
          )),
      body: Stack(
        children: [
          Container(
              height: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top * 1,
              width: MediaQuery.of(context).size.width * 1,
              // color: Colors.red,
              child: HomeContent()),
          // Positioned(
          //   right: width * 0.02,
          //   bottom: height * 0.05,
          //   child: Container(
          //     width: width * 0.15,
          //     height: height * 0.15,
          //     decoration: const BoxDecoration(
          //         color: Colors.black, shape: BoxShape.circle),
          //     child: Image.asset(
          //       'assets/images/3D Torus Loading.png',
          //       fit: BoxFit.cover,
          //     ),
          //   ),
          // ),
          // Positioned(
          //   right: width * 0.05,
          //   bottom: height * 0.115,
          //   child: Padding(
          //     padding: EdgeInsets.only(left: width * 0.05),
          //     child: const Text(
          //       'Hello',
          //       style: TextStyle(
          //           color: Colors.white,
          //           fontWeight: FontWeight.bold,
          //           fontSize: 15),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
