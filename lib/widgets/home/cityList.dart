import 'package:flutter/material.dart';

class CityList extends StatefulWidget {
  CityListState createState() => CityListState();
}

class CityListState extends State<CityList> {
  final List _images = [
    Image.asset('assets/images/Group 9065.png', fit: BoxFit.fill),
    Image.asset(
        'assets/images/india-gate-delhi-sketch-vector-historical-monument-india-enterance-to-india-india-gate-delhi-sketch-vector-146554751.png',
        fit: BoxFit.fill),
    Image.asset(
        'assets/images/favpng_gateway-of-india-india-gate-coloring-book-drawing.png',
        fit: BoxFit.fill),
    Image.asset('assets/images/Bangalore Palace copy.png', fit: BoxFit.fill),
    Image.asset('assets/images/Group 9065.png', fit: BoxFit.fill),
    Image.asset(
        'assets/images/india-gate-delhi-sketch-vector-historical-monument-india-enterance-to-india-india-gate-delhi-sketch-vector-146554751.png',
        fit: BoxFit.fill),
    Image.asset(
        'assets/images/favpng_gateway-of-india-india-gate-coloring-book-drawing.png',
        fit: BoxFit.fill),
    Image.asset('assets/images/Bangalore Palace copy.png', fit: BoxFit.fill)
  ];

  final List<String> _cityNames = [
    'Kolkata',
    'Delhi',
    'Mumbai',
    'Bangalore',
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    bool tabLayout = width > 600;
    bool largeLayout = width > 350 && width < 600;

    // TODO: implement build
    return Container(
      width: double.infinity,
      height: tabLayout
          ? MediaQuery.of(context).size.height * 0.15
          : largeLayout
              ? MediaQuery.of(context).size.height * 0.11
              : MediaQuery.of(context).size.height * 0.14,
      // height: tabLayout
      //     ? MediaQuery.of(context).size.height * 0.15
      //     : MediaQuery.of(context).size.height * 0.12,
      // color: Colors.red,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Container(
          height: double.infinity,
          width: MediaQuery.of(context).size.width * 0.23,
          // color: Colors.blue,
          margin:
              EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.012),
          child: Column(
            children: [
              Container(
                height: tabLayout
                    ? MediaQuery.of(context).size.height * 0.12
                    : largeLayout
                        ? MediaQuery.of(context).size.height * 0.08
                        : MediaQuery.of(context).size.height * 0.11,
                width: double.infinity,
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.02,
                    top: MediaQuery.of(context).size.height * 0.02,
                    right: MediaQuery.of(context).size.width * 0.02,
                    bottom: MediaQuery.of(context).size.height * 0.01),
                decoration: BoxDecoration(
                    // color: Colors.yellow,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: Colors.white, width: 2)),
                child: _images[index],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.005),
              Text(_cityNames[index],
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: tabLayout
                          ? 18
                          : largeLayout
                              ? 15
                              : 10))
            ],
          ),
        ),
        itemCount: 4,
      ),
    );
  }
}
