import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;

  Button(this.text);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    bool checkHeight = height > 800;

    // TODO: implement build
    return Container(
      width: MediaQuery.of(context).size.width * 0.75,
      height: checkHeight ? height * 0.055 : height * 0.065,
      child: Center(
          child: Text(text,
              textScaleFactor: checkHeight
                  ? MediaQuery.of(context).textScaleFactor * 1.2
                  : MediaQuery.of(context).textScaleFactor * 1.4,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: checkHeight ? 15 : 12))),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 0, 0, 1),
        borderRadius: BorderRadius.circular(28),
      ),
    );
  }
}
