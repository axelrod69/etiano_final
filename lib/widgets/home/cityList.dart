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
    'Kolkata',
    'Delhi',
    'Mumbai',
    'Bangalore'
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.11,
      // color: Colors.red,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Container(
          height: double.infinity,
          width: MediaQuery.of(context).size.width * 0.3,
          margin:
              EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.015),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.08,
                width: double.infinity,
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.02,
                    top: MediaQuery.of(context).size.height * 0.02,
                    right: MediaQuery.of(context).size.width * 0.02,
                    bottom: MediaQuery.of(context).size.height * 0.01),
                decoration: BoxDecoration(
                    // color: Colors.yellow,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: Colors.white)),
                child: _images[index],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.005),
              Text(_cityNames[index],
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold))
            ],
          ),
        ),
        itemCount: 8,
      ),
    );
  }
}
