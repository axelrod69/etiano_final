import 'package:flutter/material.dart';

class MomsGenieViewAll extends StatefulWidget {
  MomsGenieViewAllState createState() => MomsGenieViewAllState();
}

class MomsGenieViewAllState extends State<MomsGenieViewAll> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var textScale = MediaQuery.of(context).textScaleFactor * 1.2;

    final Map<String, dynamic> _menuItems = {
      "data": [
        {
          "id": 1,
          "name": "Steak Raw",
          "restaurant": "King Burgers",
          "rating_star": 4.9,
          "rating_number": 124,
          "price": 1109,
          "type": "Burger",
          "cuisine": "Continental",
          "images": "assets/images/davide-cantelli-jpkfc5_d-DI-unsplash.png"
        },
        {
          "id": 2,
          "name": "Steak Raw",
          "restaurant": "King Burgers",
          "rating_star": 4.9,
          "rating_number": 124,
          "price": 1109,
          "type": "Burger",
          "cuisine": "Continental",
          "images": "assets/images/davide-cantelli-jpkfc5_d-DI-unsplash.png"
        },
        {
          "id": 3,
          "name": "Steak Raw",
          "restaurant": "King Burgers",
          "rating_star": 4.9,
          "rating_number": 124,
          "price": 1109,
          "type": "Burger",
          "cuisine": "Continental",
          "images": "assets/images/davide-cantelli-jpkfc5_d-DI-unsplash.png"
        },
        {
          "id": 4,
          "name": "Steak Raw",
          "restaurant": "King Burgers",
          "rating_star": 4.9,
          "rating_number": 124,
          "price": 1109,
          "type": "Burger",
          "cuisine": "Continental",
          "images": "assets/images/davide-cantelli-jpkfc5_d-DI-unsplash.png"
        },
        {
          "id": 5,
          "name": "Steak Raw",
          "restaurant": "King Burgers",
          "rating_star": 4.9,
          "rating_number": 124,
          "price": 1109,
          "type": "Burger",
          "cuisine": "Continental",
          "images": "assets/images/davide-cantelli-jpkfc5_d-DI-unsplash.png"
        },
        {
          "id": 6,
          "name": "Steak Raw",
          "restaurant": "King Burgers",
          "rating_star": 4.9,
          "rating_number": 124,
          "price": 1109,
          "type": "Burger",
          "cuisine": "Continental",
          "images": "assets/images/davide-cantelli-jpkfc5_d-DI-unsplash.png"
        },
        {
          "id": 7,
          "name": "Steak Raw",
          "restaurant": "King Burgers",
          "rating_star": 4.9,
          "rating_number": 124,
          "price": 1109,
          "type": "Burger",
          "cuisine": "Continental",
          "images": "assets/images/davide-cantelli-jpkfc5_d-DI-unsplash.png"
        },
        {
          "id": 8,
          "name": "Steak Raw",
          "restaurant": "King Burgers",
          "rating_star": 4.9,
          "rating_number": 124,
          "price": 1109,
          "type": "Burger",
          "cuisine": "Continental",
          "images": "assets/images/davide-cantelli-jpkfc5_d-DI-unsplash.png"
        }
      ]
    };

    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          leading: InkWell(
              onTap: () => Navigator.of(context)
                  .pushReplacementNamed('/moms-genie-screen'),
              child: const Icon(Icons.arrow_back_ios, color: Colors.red)),
          title: Padding(
            padding: EdgeInsets.only(left: width * 0.17),
            child: Text('Mom\'s Menu',
                textScaleFactor: textScale,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) => Container(
            margin: EdgeInsets.only(bottom: height * 0.05),
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: width * 0.08),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: width * 0.76,
                        height: height * 0.11,
                        padding: EdgeInsets.only(
                            // bottom: height * 0.015,
                            left: width * 0.12),
                        decoration: const BoxDecoration(
                            // color: Colors.white,
                            color: Color.fromRGBO(58, 69, 84, 1),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(35),
                                topRight: Radius.circular(18),
                                bottomLeft: Radius.circular(35),
                                bottomRight: Radius.circular(18))),
                        child: Container(
                          margin: EdgeInsets.only(top: height * 0.005),
                          child: Row(
                            children: [
                              Flexible(
                                flex: 2,
                                fit: FlexFit.tight,
                                child: Container(
                                  height: double.infinity,
                                  // color: Colors.red,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          _menuItems["data"][index]["name"]
                                              .toString(),
                                          textScaleFactor: textScale,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold)),
                                      SizedBox(height: height * 0.005),
                                      Text(
                                          _menuItems["data"][index]
                                              ["restaurant"],
                                          textScaleFactor: textScale,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 10)),
                                      SizedBox(height: height * 0.005),
                                      Row(
                                        children: [
                                          Image.asset(
                                              'assets/images/Path 8561.png'),
                                          SizedBox(width: width * 0.01),
                                          Text(
                                              _menuItems["data"][index]
                                                      ["rating_star"]
                                                  .toString(),
                                              textScaleFactor: textScale,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 10)),
                                          SizedBox(width: width * 0.01),
                                          Text(
                                              '(${_menuItems["data"][index]["rating_number"].toString()} ratings)',
                                              textScaleFactor: textScale,
                                              style: const TextStyle(
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 10))
                                        ],
                                      ),
                                      SizedBox(height: height * 0.008),
                                      Row(
                                        children: [
                                          Text(
                                              _menuItems["data"][index]["type"],
                                              textScaleFactor: textScale,
                                              style: const TextStyle(
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 10)),
                                          SizedBox(width: width * 0.05),
                                          Text(
                                              _menuItems["data"][index]
                                                  ["cuisine"],
                                              textScaleFactor: textScale,
                                              style: const TextStyle(
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 10))
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                fit: FlexFit.tight,
                                child: Container(
                                  height: double.infinity,
                                  // color: Colors.yellow,
                                  child: Center(
                                    child: Row(
                                      children: [
                                        Text('₹',
                                            textScaleFactor: textScale,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            )),
                                        SizedBox(width: width * 0.01),
                                        Text(
                                            _menuItems["data"][index]["price"]
                                                .toString(),
                                            textScaleFactor: textScale,
                                            style: const TextStyle(
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold,
                                            ))
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: width * 0.65,
                  // left: width * 0.02,
                  // bottom: height * 0.0008,
                  bottom: height * 0.004,
                  child: Container(
                      width: width * 0.35,
                      height: height * 0.1,
                      // color: Colors.yellow,
                      child: Image.asset(_menuItems["data"][index]["images"])),
                ),
              ],
            ),
          ),
          itemCount: _menuItems["data"].length,
        ));
  }
}
