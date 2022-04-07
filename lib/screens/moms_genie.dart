import 'dart:ui';

import 'package:flutter/material.dart';
import '../widgets/home/bottom_navigation.dart';
import '../widgets/home/popular_dish/priceWidget.dart';

class MomsGenie extends StatefulWidget {
  MomsGenieState createState() => MomsGenieState();
}

class MomsGenieState extends State<MomsGenie> {
  bool _toggleDropDown = false;
  bool _searchIcon = false;
  final _controller = TextEditingController();

  final _initialValue =
      '48, Tarun Sengupta Sarani, Dum Dum, PO.Italgacha, Kolkata - 700079';

  final Map<String, dynamic> _popularDishes = {
    "data": [
      {
        "id": "1",
        "name": "Chicken Tandoor Combo",
        "restaurantName": "Tandoori House",
        "price": "455",
        "rating": "4.3",
        "totalRatings": "154",
        "image": "assets/images/Rectangle 17323.png"
      },
      {
        "id": "2",
        "name": "Pan Cake",
        "restaurantName": "The Pancake Centre",
        "price": "250",
        "rating": "4.7",
        "totalRatings": "256",
        "image": "assets/images/Rectangle 17324.png"
      }
    ]
  };

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    bool tabLayout = width > 600;
    bool largeLayout = width > 350 && width < 600;
    final textScale = MediaQuery.of(context).textScaleFactor * 1.2;

    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
            elevation: 5,
            automaticallyImplyLeading: false,
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
                                _initialValue,
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
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  // color: Colors.transparent,
                                  // color: Colors.red,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(14)),
                                  border:
                                      Border.all(color: Colors.grey, width: 2)),
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
                                              color: Colors.grey, fontSize: 18),
                                          decoration: const InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'Enter City or Food',
                                              hintStyle:
                                                  TextStyle(color: Colors.grey),
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
                      const SizedBox(width: 2),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {},
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
                )
              ],
            )),
        body: Padding(
          padding: EdgeInsets.only(left: width * 0.02, right: width * 0.02),
          child: ListView(
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () => Navigator.of(context).pop(),
                    child: CircleAvatar(
                      radius: tabLayout ? 20 : 12,
                      backgroundColor: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(left: width * 0.01),
                        child: const Icon(Icons.arrow_back_ios,
                            color: Colors.red, size: 12),
                      ),
                    ),
                  ),
                  SizedBox(width: width * 0.03),
                  Expanded(
                    child: Text(
                      'Lorem ipsum dolor, iscing elit, sed do eiusmod tempor incididunt',
                      textScaleFactor: textScale,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: tabLayout
                              ? 22
                              : largeLayout
                                  ? 15
                                  : 12),
                    ),
                  )
                ],
              ),
              SizedBox(height: height * 0.02),
              Stack(
                children: [
                  Container(
                    width: width * 1,
                    height: height * 0.15,
                    // color: Colors.red,
                    child: Center(
                      child: Container(
                          width: width * 0.7,
                          height: tabLayout || largeLayout
                              ? height * 0.07
                              : height * 0.08,
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(58, 69, 84, 1),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color.fromRGBO(66, 67, 68, 1),
                                    // spreadRadius: 1,
                                    blurRadius: 5,
                                    offset: Offset(0, 1))
                              ]),
                          child: Padding(
                            padding: EdgeInsets.only(right: width * 0.1),
                            child: Center(
                              child: Text(
                                'From The Mom\'s',
                                textScaleFactor: textScale,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: tabLayout
                                        ? 30
                                        : largeLayout
                                            ? 20
                                            : 16),
                              ),
                            ),
                          )),
                    ),
                  ),
                  Positioned(
                    bottom: height * 0.001,
                    left: width * 0.65,
                    child: Image.asset('assets/images/Untitled design (2).png',
                        width: width * 0.2, height: height * 0.25),
                  )
                ],
              ),
              Stack(
                children: [
                  Container(
                    height: height * 0.4,
                    width: double.infinity,
                    // color: Colors.blue,
                    padding: EdgeInsets.only(
                        left: width * 0.02,
                        top: height * 0.01,
                        right: width * 0.19,
                        bottom: height * 0.12),
                    child: Container(
                      width: double.infinity,
                      height: height * 0.30,
                      decoration: const BoxDecoration(
                          // color: Colors.green,
                          border: Border(
                              top: BorderSide(
                                color: Colors.red,
                              ),
                              left: BorderSide(
                                color: Colors.red,
                              ))),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => Container(
                          // margin: EdgeInsets.only(right: width * 0.02),
                          // padding: EdgeInsets.only(
                          //   // left: width * 0.02,
                          //   top: height * 0.001,
                          //   // right: width * 0.02
                          // ),
                          height: double.infinity,
                          width: width * 0.4,
                          // color: Colors.yellow,
                          child: Column(
                            children: [
                              Container(
                                  height: height * 0.17,
                                  width: double.infinity,
                                  margin: EdgeInsets.only(top: height * 0.006),
                                  child: Container(
                                    margin: EdgeInsets.only(left: width * 0.02),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.asset(
                                          _popularDishes["data"][index]
                                              ["image"],
                                          fit: BoxFit.cover),
                                    ),
                                  )),
                              SizedBox(height: height * 0.005),
                              Container(
                                width: double.infinity,
                                // height: 0.085,
                                // color: Colors.blue,
                                padding: EdgeInsets.only(left: width * 0.03),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _popularDishes["data"][index]["name"],
                                      textScaleFactor: textScale,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: tabLayout
                                              ? 15
                                              : largeLayout
                                                  ? 10
                                                  : 8),
                                    ),
                                    SizedBox(height: height * 0.01),
                                    Text(
                                      _popularDishes["data"][index]
                                          ["restaurantName"],
                                      textScaleFactor: textScale,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: tabLayout
                                              ? 12
                                              : largeLayout
                                                  ? 8
                                                  : 7),
                                    ),
                                    SizedBox(height: height * 0.005),
                                    Row(
                                      children: [
                                        PriceWidget(_popularDishes["data"]
                                            [index]["price"]),
                                        SizedBox(width: width * 0.01),
                                        Image.asset(
                                            'assets/images/Icon ionic-ios-star.png'),
                                        Text(
                                            _popularDishes["data"][index]
                                                ["rating"],
                                            textScaleFactor: textScale,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: tabLayout
                                                    ? 12
                                                    : largeLayout
                                                        ? 8
                                                        : 7)),
                                        Text(
                                          '(${_popularDishes["data"][index]["totalRatings"]})',
                                          textScaleFactor: textScale,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: tabLayout
                                                  ? 12
                                                  : largeLayout
                                                      ? 8
                                                      : 7),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        itemCount: _popularDishes["data"].length,
                      ),
                    ),
                  ),
                  Positioned(
                    // top: height * 0.235,
                    top: height * 0.28,
                    child: Image.asset('assets/images/Mom\'s Suggestion.png',
                        height: height * 0.11),
                  ),
                  Positioned(
                    top: height * 0.001,
                    left: width * 0.82,
                    child: InkWell(
                      onTap: () => Navigator.of(context)
                          .popAndPushNamed('/moms-genie-screen-view'),
                      child: Container(
                        width: width * 0.2,
                        height: height * 0.02,
                        // color: Colors.white,
                        child: Row(
                          children: [
                            Text(
                              'View All',
                              textScaleFactor: textScale,
                              style: TextStyle(
                                color: Colors.amber,
                                fontSize: tabLayout
                                    ? 12
                                    : largeLayout
                                        ? 8
                                        : 7,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: width * 0.01),
                            Icon(Icons.arrow_forward_ios,
                                color: Colors.amber,
                                size: tabLayout || largeLayout ? 12 : 8)
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: height * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Status',
                    textScaleFactor: textScale,
                    // textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: tabLayout
                            ? 22
                            : largeLayout
                                ? 20
                                : 18),
                  ),
                ],
              ),
              SizedBox(height: height * 0.02),
              Container(
                  width: width * 0.7,
                  height: height * 0.065,
                  margin: !largeLayout && !tabLayout
                      ? EdgeInsets.only(left: width * 0.04, right: width * 0.04)
                      : null,
                  padding: EdgeInsets.only(
                      left: tabLayout || largeLayout
                          ? width * 0.04
                          : width * 0.08,
                      right: tabLayout || largeLayout
                          ? width * 0.04
                          : width * 0.08),
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(58, 69, 84, 1),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                            color: Color.fromRGBO(66, 67, 68, 1),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: Offset(0, 1))
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Estimated Time',
                          textScaleFactor: textScale,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: tabLayout
                                  ? 22
                                  : largeLayout
                                      ? 20
                                      : 16)),
                      Text('2 Days',
                          textScaleFactor: textScale,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: tabLayout
                                  ? 22
                                  : largeLayout
                                      ? 20
                                      : 16))
                    ],
                  )),
              SizedBox(height: height * 0.02),
              Container(
                  width: width * 0.7,
                  height: height * 0.065,
                  margin: !largeLayout && !tabLayout
                      ? EdgeInsets.only(
                          left: width * 0.04,
                          right: width * 0.04,
                          bottom: height * 0.04)
                      : null,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(58, 69, 84, 1),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                            color: Color.fromRGBO(66, 67, 68, 1),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: Offset(0, 1))
                      ]),
                  child: Center(
                    child: Text(
                      'Track Order',
                      textScaleFactor: textScale,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: tabLayout
                              ? 22
                              : largeLayout
                                  ? 20
                                  : 16),
                    ),
                  )),
            ],
          ),
        )
        // bottomNavigationBar: BottomNavigation(),
        );
  }
}
