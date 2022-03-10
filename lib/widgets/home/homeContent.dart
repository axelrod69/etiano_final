import 'package:flutter/material.dart';
import './cityList.dart';
import 'popular_dish/popularDishes.dart';
import 'momsGenieWidget.dart';
import './tasteBudRelief.dart';
import './bonusOffer.dart';
import './expertChoice.dart';
import './restaurants.dart';

class HomeContent extends StatefulWidget {
  HomeContentState createState() => HomeContentState();
}

class HomeContentState extends State<HomeContent> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var textScale = MediaQuery.of(context).textScaleFactor * 1.2;
    // var responsive =
    //     MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

    // TODO: implement build
    return Padding(
      padding: EdgeInsets.only(
          left: width * 0.02, top: height * 0.01, right: width * 0.01),
      child: ListView(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Text('Lorem ipsum dolor sit amet, \nconsectetur',
              textScaleFactor: textScale,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20)),
          SizedBox(height: height * 0.04),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('City With Foods',
                  textScaleFactor: textScale,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
              Container(
                child: Row(
                  children: [
                    Text('View All',
                        textScaleFactor: textScale,
                        style: const TextStyle(
                            color: Colors.yellow,
                            fontWeight: FontWeight.bold,
                            fontSize: 8)),
                    const Icon(Icons.keyboard_arrow_right_outlined,
                        color: Colors.yellow)
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: height * 0.04),
          CityList(),
          SizedBox(height: height * 0.04),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Popular Dishes',
                  textScaleFactor: textScale,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
              Container(
                child: Row(
                  children: [
                    Text('View All',
                        textScaleFactor: textScale,
                        style: const TextStyle(
                            color: Colors.yellow,
                            fontWeight: FontWeight.bold,
                            fontSize: 8)),
                    const Icon(Icons.keyboard_arrow_right_outlined,
                        color: Colors.yellow)
                  ],
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
              height: height * 0.32,
              padding: EdgeInsets.only(left: width * 0.02, right: width * 0.02),
              // color: Colors.yellow,
              child: Center(child: MomsGenieWidget())),
          SizedBox(height: height * 0.05),
          TasteBudRelief(),
          SizedBox(height: height * 0.02),
          Text('Bonus For You',
              textScaleFactor: textScale,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20)),
          BonusOffer(),
          SizedBox(height: height * 0.05),
          Text('Expert Choice',
              textScaleFactor: textScale,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20)),
          SizedBox(height: height * 0.03),
          ExpertChoice(),
          SizedBox(height: height * 0.05),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Popular Restaurants',
                  textScaleFactor: textScale,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
              Container(
                child: Row(
                  children: [
                    Text('View All',
                        textScaleFactor: textScale,
                        style: const TextStyle(
                            color: Colors.yellow,
                            fontWeight: FontWeight.bold,
                            fontSize: 8)),
                    const Icon(Icons.keyboard_arrow_right_outlined,
                        color: Colors.yellow)
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: height * 0.03),
          Restaurants(),
          SizedBox(height: height * 0.01),
        ],
      ),
    );
  }
}
