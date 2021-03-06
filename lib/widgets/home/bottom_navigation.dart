import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import '../../screens/home.dart';
import '../../screens/menu.dart';
import '../../screens/profile.dart';
import '../../screens/more_screen.dart';
import '../../screens/offer_screen.dart';

class BottomNavigation extends StatefulWidget {
  BottomNavigationState createState() => BottomNavigationState();
}

class BottomNavigationState extends State<BottomNavigation> {
  final bool pointer = false;
  int index = 2;
  final screens = [
    Menu(),
    Profile(),
    HomeScreen(),
    MoreScreen(),
    OfferScreen()
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    // var height = MediaQuery.of(context).size.height;
    // var width = MediaQuery.of(context).size.width;
    var textScale = MediaQuery.of(context).textScaleFactor;
    bool tabLayout = width > 600;
    bool largeLayout = width > 350 && width < 600;

    final items = [
      // Icon(Icons.window_outlined,
      //     color: index == 0 ? Colors.white : Colors.grey,
      //     size: index == 0
      //         ? tabLayout
      //             ? height * 0.07
      //             : width * 0.098
      //         : width * 0.09),
      tabLayout
          ? Image.asset(
              'assets/images/Icon material-dashboard.png',
              width: index == 0 ? width * 0.20 : width * 0.10,
              height: index == 0 ? height * 0.08 : height * 0.10,
              color: index == 0 ? Colors.white : Colors.grey,
            )
          : Image.asset(
              'assets/images/Icon material-dashboard.png',
              width: index == 0 ? width * 0.15 : width * 0.05,
              height: index == 0 ? height * 0.04 : height * 0.05,
              color: index == 0 ? Colors.white : Colors.grey,
            ),
      tabLayout
          ? Image.asset('assets/images/man-user.png',
              width: index == 1 ? width * 0.20 : width * 0.10,
              height: index == 1 ? height * 0.08 : height * 0.10,
              color: index == 1 ? Colors.white : Colors.grey)
          : Image.asset('assets/images/man-user.png',
              width: index == 1 ? width * 0.15 : width * 0.05,
              height: index == 1 ? height * 0.04 : height * 0.05,
              color: index == 1 ? Colors.white : Colors.grey),
      tabLayout
          ? Image.asset('assets/images/Icon ionic-ios-home.png',
              width: index == 2 ? width * 0.20 : width * 0.10,
              height: index == 2 ? height * 0.08 : height * 0.10,
              color: index == 2 ? Colors.white : Colors.white)
          : Image.asset('assets/images/Icon ionic-ios-home.png',
              width: index == 2 ? width * 0.15 : width * 0.05,
              height: index == 2 ? height * 0.04 : height * 0.05,
              color: index == 2 ? Colors.white : Colors.white),
      tabLayout
          ? Image.asset(
              'assets/images/Group 6814.png',
              width: index == 3 ? width * 0.20 : width * 0.10,
              height: index == 3 ? height * 0.08 : height * 0.10,
              color: index == 3 ? Colors.white : Colors.grey,
            )
          : Image.asset(
              'assets/images/Group 6814.png',
              width: index == 3 ? width * 0.15 : width * 0.05,
              height: index == 3 ? height * 0.04 : height * 0.05,
              color: index == 3 ? Colors.white : Colors.grey,
            ),
      tabLayout
          ? Image.asset(
              'assets/images/002-shopping-bag.png',
              width: index == 4 ? width * 0.20 : width * 0.10,
              height: index == 4 ? height * 0.08 : height * 0.10,
              color: index == 4 ? Colors.white : Colors.grey,
            )
          : Image.asset(
              'assets/images/002-shopping-bag.png',
              width: index == 4 ? width * 0.15 : width * 0.05,
              height: index == 4 ? height * 0.04 : height * 0.05,
              color: index == 4 ? Colors.white : Colors.grey,
            )
    ];

    // TODO: implement build
    return Scaffold(
      body: screens[index],
      extendBody: true,
      bottomNavigationBar: Container(
        // padding: EdgeInsets.only(top: ),
        decoration: const BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.black,
              spreadRadius: 20,
              blurRadius: 30,
              offset: Offset(1, 2))
        ]),
        child: CurvedNavigationBar(
          items: items,
          index: index,
          height: tabLayout ? 75 : 60,
          color: const Color.fromRGBO(103, 103, 103, 1),
          backgroundColor: Colors.transparent,
          buttonBackgroundColor: const Color.fromRGBO(189, 186, 186, 1),
          onTap: (index) => setState(() {
            this.index = index;
            // HomeScreen(index);
            // Navigator.of(context)
            //     .pushNamed('/home-screen', arguments: this.index);
          }),
        ),
      ),
    );
  }
}
