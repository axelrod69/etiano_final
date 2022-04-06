import 'package:flutter/material.dart';

class TasteBudRelief extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    bool tabLayout = width > 600;
    bool largeLayout = width > 350 && width < 600;
    var textScale = MediaQuery.of(context).textScaleFactor * 1.2;

    final List _tasteBud = [
      'assets/images/Path 4360.png',
      'assets/images/Path 4257.png',
      'assets/images/Group 6848.png',
      'assets/images/Group 6852.png',
      'assets/images/Group 6849.png',
      'assets/images/Path 4257.png',
    ];

    // TODO: implement build
    return Container(
      width: double.infinity,
      height: height * 0.16,
      // color: Colors.red,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Taste Buds',
              textScaleFactor: textScale,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: tabLayout
                      ? 25
                      : largeLayout
                          ? 20
                          : 15)),
          SizedBox(height: height * 0.01),
          Container(
            width: double.infinity,
            height: height * 0.11,
            padding: EdgeInsets.only(left: width * 0.08, right: width * 0.08),
            // color: Colors.black,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Container(
                width: width * 0.12,
                height: 0.12,
                margin: EdgeInsets.only(right: width * 0.1),
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white)),
                child: Image.asset(_tasteBud[index]),
              ),
              itemCount: _tasteBud.length,
            ),
          )
        ],
      ),
    );
  }
}
