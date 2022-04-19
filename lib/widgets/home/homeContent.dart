import 'package:flutter/material.dart';
import './cityList.dart';
import 'popular_dish/popularDishes.dart';
import 'momsGenieWidget.dart';
import './tasteBudRelief.dart';
import './bonusOffer.dart';
import './expertChoice.dart';
import './restaurants.dart';
import '../../model/location/location.dart';
import 'package:provider/provider.dart';

class HomeContent extends StatefulWidget {
  HomeContentState createState() => HomeContentState();
}

class HomeContentState extends State<HomeContent> {
  double lat = 0.0;
  double lng = 0.0;
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   Provider.of<CouponProvider>(context, listen: false).fetchCoupons();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    // var textScale = MediaQuery.of(context).textScaleFactor * 1.2;
    bool tabLayout = width > 600;
    bool largeLayout = width > 350 && width < 600;
    lat = Provider.of<LocationProvider>(context).coorDinates['lat'];
    lng = Provider.of<LocationProvider>(context).coorDinates['lng'];

    // final provider = Provider.of<CouponProvider>(context).coupons;

    // print('Length ${provider['data'][0]['coupon_image'].length}');
    // var responsive =
    //     MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

    // TODO: implement build
    return Padding(
      padding: EdgeInsets.only(
          left: width * 0.02, top: height * 0.01, right: width * 0.01),
      child: ListView(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Row(
            children: [
              Expanded(
                child: Text('Lorem ipsum dolor sit amet, consectetur',
                    // textScaleFactor: textScale,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: tabLayout
                            ? 30
                            : largeLayout
                                ? 20
                                : 18)),
              ),
            ],
          ),
          SizedBox(height: height * 0.04),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('City With Foods',
                  // textScaleFactor: textScale,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: tabLayout
                          ? 25
                          : largeLayout
                              ? 20
                              : 15)),
              // Container(
              //   child: Row(
              //     children: [
              //       Text('View All',
              // textScaleFactor: textScale,
              //           style: TextStyle(
              //               color: Colors.yellow,
              //               fontWeight: FontWeight.bold,
              //               fontSize: tabLayout
              //                   ? 14
              //                   : largeLayout
              //                       ? 8
              //                       : 6)),
              //       Icon(
              //         Icons.keyboard_arrow_right_outlined,
              //         color: Colors.yellow,
              //         size: tabLayout
              //             ? 30
              //             : largeLayout
              //                 ? 20
              //                 : 18,
              //       )
              //     ],
              //   ),
              // ),
            ],
          ),
          SizedBox(height: height * 0.04),
          CityList(),
          SizedBox(height: height * 0.04),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Popular Dishes',
                  // textScaleFactor: textScale,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: tabLayout
                          ? 25
                          : largeLayout
                              ? 20
                              : 15)),
              InkWell(
                onTap: () => Navigator.of(context).pushNamed('/dishview-all'),
                child: SizedBox(
                  child: Row(
                    children: [
                      Text('View All',
                          // textScaleFactor: textScale,
                          style: TextStyle(
                              color: Colors.yellow,
                              fontWeight: FontWeight.bold,
                              fontSize: tabLayout
                                  ? 14
                                  : largeLayout
                                      ? 8
                                      : 6)),
                      Icon(
                        Icons.keyboard_arrow_right_outlined,
                        color: Colors.yellow,
                        size: tabLayout
                            ? 30
                            : largeLayout
                                ? 20
                                : 18,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: height * 0.02),
          PopularDishes(),
          SizedBox(height: height * 0.04),
          Container(
              // width: double.infinity,
              width: width * 1,
              height: tabLayout || largeLayout ? height * 0.32 : height * 0.375,
              padding: EdgeInsets.only(left: width * 0.02, right: width * 0.02),
              // color: Colors.yellow,
              child: Center(child: MomsGenieWidget())),
          SizedBox(height: height * 0.05),
          TasteBudRelief(),
          SizedBox(height: height * 0.04),
          Text('Bonus For You',
              // textScaleFactor: textScale,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: tabLayout
                      ? 25
                      : largeLayout
                          ? 20
                          : 15)),
          BonusOffer(),
          SizedBox(height: height * 0.05),
          Text('Expert\'s Choice',
              // textScaleFactor: textScale,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: tabLayout
                      ? 25
                      : largeLayout
                          ? 20
                          : 15)),
          SizedBox(height: height * 0.03),
          ExpertChoice(),
          SizedBox(height: height * 0.05),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Popular Restaurants',
                  // textScaleFactor: textScale,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: tabLayout
                          ? 25
                          : largeLayout
                              ? 20
                              : 15)),
              InkWell(
                onTap: () =>
                    Navigator.of(context).pushNamed('/restaurant-list'),
                child: Container(
                  child: Row(
                    children: [
                      Text('View All',
                          // textScaleFactor: textScale,
                          style: TextStyle(
                              color: Colors.yellow,
                              fontWeight: FontWeight.bold,
                              fontSize: tabLayout
                                  ? 14
                                  : largeLayout
                                      ? 8
                                      : 6)),
                      Icon(
                        Icons.keyboard_arrow_right_outlined,
                        color: Colors.yellow,
                        size: tabLayout
                            ? 30
                            : largeLayout
                                ? 20
                                : 18,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: height * 0.03),
          Restaurants(lat, lng),
          SizedBox(height: height * 0.01),
        ],
      ),
    );
  }
}
