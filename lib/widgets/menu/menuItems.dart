import 'package:flutter/material.dart';

class MenuItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var textScale = MediaQuery.of(context).textScaleFactor * 1.2;

    final Map<String, dynamic> _menuItems = {
      "data": [
        {
          "id": 1,
          "item": "Food",
          "numberOfItems": "120 Items",
          "images": "assets/images/davide-cantelli-jpkfc5_d-DI-unsplash.png"
        },
        {
          "id": 2,
          "item": "Beverages",
          "numberOfItems": "220 Items",
          "images": "assets/images/allison-griffith-VCXk_bO97VQ-unsplash.png"
        },
        {
          "id": 3,
          "item": "Desserts",
          "numberOfItems": "155 Items",
          "images": "assets/images/Group 6844.png"
        },
        {
          "id": 4,
          "item": "Promotions",
          "numberOfItems": "25 Items",
          "images": "assets/images/Group 6845.png"
        },
        {
          "id": 5,
          "item": "Food",
          "numberOfItems": "120 Items",
          "images": "assets/images/davide-cantelli-jpkfc5_d-DI-unsplash.png"
        },
        {
          "id": 6,
          "item": "Beverages",
          "numberOfItems": "220 Items",
          "images": "assets/images/allison-griffith-VCXk_bO97VQ-unsplash.png"
        },
        {
          "id": 7,
          "item": "Desserts",
          "numberOfItems": "155 Items",
          "images": "assets/images/Group 6844.png"
        },
        {
          "id": 8,
          "item": "Promotions",
          "numberOfItems": "25 Items",
          "images": "assets/images/Group 6845.png"
        }
      ]
    };

    return ListView.builder(
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
                    height: height * 0.12,
                    padding: EdgeInsets.only(
                        bottom: height * 0.015, left: width * 0.15),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(35),
                            topRight: Radius.circular(18),
                            bottomLeft: Radius.circular(35),
                            bottomRight: Radius.circular(18))),
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _menuItems["data"][index]["item"],
                            textScaleFactor: textScale,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 23),
                          ),
                          SizedBox(height: height * 0.003),
                          Text(
                            _menuItems["data"][index]["numberOfItems"],
                            textScaleFactor: textScale,
                            style: const TextStyle(fontSize: 10),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              right: width * 0.63,
              // left: width * 0.02,
              bottom: height * 0.0008,
              child: Container(
                  width: width * 0.35,
                  height: height * 0.12,
                  // color: Colors.yellow,
                  child: Image.asset(_menuItems["data"][index]["images"])),
            ),
            Positioned(
              top: height * 0.008,
              left: width * 0.815,
              child: Container(
                width: width * 0.1,
                height: height * 0.1,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black,
                          spreadRadius: 10,
                          blurRadius: 100,
                          offset: Offset(3, 2))
                    ]),
                child: const Center(
                  child: Icon(Icons.keyboard_arrow_right_outlined,
                      color: Colors.red, size: 30),
                ),
              ),
            )
          ],
        ),
      ),
      itemCount: _menuItems["data"].length,
    );
  }
}
