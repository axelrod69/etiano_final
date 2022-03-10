import 'package:flutter/material.dart';

class ChangeLocation extends StatefulWidget {
  ChangeLocationState createState() => ChangeLocationState();
}

class ChangeLocationState extends State<ChangeLocation> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Text(
          'Change Address',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
