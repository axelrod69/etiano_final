import 'package:flutter/material.dart';

class ExpertChoice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var textScale = MediaQuery.of(context).textScaleFactor * 1.1;

    final Map<String, dynamic> _experts = {
      "data": [
        {
          "id": 1,
          "name": "Clarie",
          "restaurant": "Peter Cat",
          "image": "assets/images/Rectangle -2.png"
        },
        {
          "id": 2,
          "name": "Clarie",
          "restaurant": "Mocambo",
          "image": "assets/images/Rectangle 17899.png"
        },
        {
          "id": 3,
          "name": "Clarie",
          "restaurant": "Olypub",
          "image": "assets/images/Rectangle -1.png"
        },
        {
          "id": 4,
          "name": "Clarie",
          "restaurant": "B B Q",
          "image": "assets/images/Rectangle -3.png"
        },
        {
          "id": 5,
          "name": "Clarie",
          "restaurant": "Peter Cat",
          "image": "assets/images/Rectangle -2.png"
        },
        {
          "id": 6,
          "name": "Clarie",
          "restaurant": "Mocambo",
          "image": "assets/images/Rectangle 17899.png"
        },
        {
          "id": 7,
          "name": "Clarie",
          "restaurant": "Olypub",
          "image": "assets/images/Rectangle -1.png"
        },
        {
          "id": 8,
          "name": "Clarie",
          "restaurant": "B B Q",
          "image": "assets/images/Rectangle -3.png"
        }
      ]
    };

    // TODO: implement build
    return Container(
      width: double.infinity,
      height: height * 0.25,
      color: const Color.fromRGBO(103, 103, 103, 1),
      padding: EdgeInsets.only(
          left: width * 0.05,
          top: height * 0.02,
          right: width * 0.05,
          bottom: height * 0.02),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Container(
          width: width * 0.3,
          margin: EdgeInsets.only(right: width * 0.06),
          padding: EdgeInsets.only(
              left: width * 0.02,
              top: height * 0.01,
              right: width * 0.02,
              bottom: height * 0.001),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              border: Border.all(
                  color: Colors.red, width: 2, style: BorderStyle.solid)),
          child: Column(
            children: [
              Flexible(
                flex: 2,
                child: Container(
                  width: double.infinity,
                  // color: Colors.yellow,
                  child: Image.asset(_experts["data"][index]["image"]),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  width: double.infinity,
                  // color: Colors.green,
                  child: Column(
                    children: [
                      Text(
                        _experts["data"][index]["name"],
                        textScaleFactor: textScale,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Text('Choice Of Restaurant',
                          textScaleFactor: textScale,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 8,
                              fontWeight: FontWeight.bold)),
                      Text(
                        _experts["data"][index]["restaurant"],
                        textScaleFactor: textScale,
                        style: const TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        itemCount: _experts["data"].length,
      ),
    );
  }
}
