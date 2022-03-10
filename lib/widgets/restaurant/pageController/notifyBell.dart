import 'package:eatiano_app/widgets/menu/cart.dart';
import 'package:flutter/material.dart';

class NotifyBell extends StatefulWidget {
  NotifyBellState createState() => NotifyBellState();
}

class NotifyBellState extends State<NotifyBell> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    // TODO: implement build
    return Container(
      height: double.infinity,
      // color: Colors.deepPurple,
      child: Stack(
        children: [
          Center(child: Icon(Icons.notifications, color: Colors.white)),
          Positioned(
            left: width * 0.08,
            top: height * 0.008,
            child: Container(
              width: 15,
              height: 15,
              decoration: const BoxDecoration(
                  color: Colors.red, shape: BoxShape.circle),
              child: const Center(
                child: Text('9+',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 10)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
