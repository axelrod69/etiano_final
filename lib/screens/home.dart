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
    final provider = Provider.of<CartItemProvider>(context).cartItems;

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
                        InkWell(
                            onTap: () {
                              setState(() {
                                _searchIcon = !_searchIcon;
                              });
                            },
                            child: const Icon(
                              Icons.search,
                              size: 30,
                              color: Colors.grey,
                            )),
                        if (_searchIcon)
                          Expanded(
                            child: Center(
                              child: Container(
                                margin:
                                    const EdgeInsets.only(bottom: 6, right: 4),
                                padding: const EdgeInsets.only(left: 6),
                                // height: double.infinity,
                                height: 45,
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
                                            autofocus: true,
                                            cursorColor: Colors.grey,
                                            style: const TextStyle(
                                                color: Colors.grey,
                                                fontSize: 18),
                                            decoration: const InputDecoration(
                                                border: InputBorder.none,
                                                hintText: 'Enter City or Food',
                                                hintStyle: TextStyle(
                                                    color: Colors.grey),
                                                suffixIcon: Icon(
                                                  Icons.send,
                                                  color: Colors.grey,
                                                  size: 20,
                                                )),
                                          ),
                                        )),
                                    Flexible(
                                      flex: 1,
                                      fit: FlexFit.tight,
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            _searchIcon = !_searchIcon;
                                          });
                                        },
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
