import 'package:flutter/material.dart';

class NotifyBell extends StatefulWidget {
  NotifyBellState createState() => NotifyBellState();
}

class NotifyBellState extends State<NotifyBell> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    bool tabLayout = width > 600;
    bool largeLayout = width > 350 && width < 600;

    // TODO: implement build
    return Container(
      // color: Colors.green,
      // padding: EdgeInsets.only(top: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 50,
            width: 50,
            padding: const EdgeInsets.only(top: 15, left: 5, bottom: 10),
            // color: Colors.yellow,
            child: Stack(
              children: [
                Icon(Icons.notifications,
                    color: Colors.white,
                    size: tabLayout
                        ? 50
                        : largeLayout
                            ? 24
                            : 20),
                Positioned(
                  left: tabLayout
                      ? 20
                      : largeLayout
                          ? 15
                          : 10,
                  bottom: tabLayout
                      ? 15
                      : largeLayout
                          ? 10
                          : 14,
                  child: Container(
                    width: tabLayout
                        ? 20
                        : largeLayout
                            ? 15
                            : 11,
                    height: tabLayout
                        ? 20
                        : largeLayout
                            ? 15
                            : 11,
                    decoration: const BoxDecoration(
                        color: Colors.red, shape: BoxShape.circle),
                    child: Center(
                      child: Text('9+',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: tabLayout
                                  ? 15
                                  : largeLayout
                                      ? 10
                                      : 8)),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
