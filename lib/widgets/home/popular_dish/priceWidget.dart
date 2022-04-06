import 'package:flutter/material.dart';

class PriceWidget extends StatelessWidget {
  final String price;

  PriceWidget(this.price);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var textScale = MediaQuery.of(context).textScaleFactor * 1.1;
    bool tabLayout = width > 600;
    bool largeLayout = width > 350 && width < 600;

    // TODO: implement build
    return Container(
      width: MediaQuery.of(context).size.width * 0.12,
      height: MediaQuery.of(context).size.height * 0.028,
      decoration: const BoxDecoration(
          color: Colors.lightGreenAccent,
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: Center(
        child: Text('₹${price}',
            textScaleFactor: textScale,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: !largeLayout ? 12 : null)),
      ),
    );
  }
}

// ₹