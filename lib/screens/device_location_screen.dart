import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/location/location.dart';
import '../widgets/home/bottom_navigation.dart';

class DeviceLocationPage extends StatefulWidget {
  DeviceLocationPageState createState() => DeviceLocationPageState();
}

class DeviceLocationPageState extends State<DeviceLocationPage> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(
        Duration(seconds: 5),
        () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => BottomNavigation())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var isLoading = Provider.of<LocationProvider>(context).loading;

    // TODO: implement build
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/Frying Pan Breakfast.png'),
          isLoading == true
              ? const CircularProgressIndicator(
                  backgroundColor: Colors.red,
                )
              : Text(
                  Provider.of<LocationProvider>(context).address,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )
        ],
      ),
    );
  }
}
