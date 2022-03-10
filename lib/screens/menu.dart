import 'package:flutter/material.dart';
import '../widgets/menu/cart.dart';
import '../widgets/menu/notifyBell.dart';
import '../widgets/menu/menuSearchBar.dart';
import '../widgets/menu/menuItems.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var responsive =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        // toolbarHeight: 120,
        elevation: 0,
        centerTitle: true,
        title: const Text('Menu',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25)),
        leading: InkWell(
          onTap: () {},
          child: const Icon(
            Icons.keyboard_arrow_left_outlined,
            color: Colors.red,
            size: 30,
          ),
        ),
        actions: [Cart(), NotifyBell()],
      ),
      body: Padding(
        padding: EdgeInsets.only(
            left: width * 0.04, top: height * 0.04, right: width * 0.04),
        child: ListView(
          children: [
            Container(
              width: width * 1,
              height: responsive * 0.07,
              // color: Colors.red,
              child: Padding(
                padding: EdgeInsets.only(
                    top: responsive * 0.002, bottom: responsive * 0.002),
                child: MenuSearchBar(),
              ),
            ),
            SizedBox(height: responsive * 0.04),
            Container(
                width: width * 0.8,
                height: responsive * 0.93,
                // color: Colors.red,
                padding: EdgeInsets.only(top: responsive * 0.02),
                child: MenuItems())
          ],
        ),
      ),
    );
  }
}
