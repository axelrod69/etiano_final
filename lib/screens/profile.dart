import 'package:flutter/material.dart';
import '../widgets/profile/cart.dart';
import '../widgets/profile/notifyBell.dart';
import '../widgets/profile/details.dart';
import '../widgets/profile/edit.dart';
import 'dart:convert';
import 'package:provider/provider.dart';
import '../model/network_utils/authentication.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './sign_in.dart';
import '../model/profile/profileProvider.dart';

class Profile extends StatefulWidget {
  ProfileState createState() => ProfileState();
}

class ProfileState extends State<Profile> {
  bool clicked = false;
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<ProfileProvider>(context, listen: false).fetchData().then((_) {
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textScale = MediaQuery.of(context).textScaleFactor * 1.2;
    final provider = Provider.of<ProfileProvider>(context).profile;

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Profile',
          textScaleFactor: textScale,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [Cart(), NotifyBell()],
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            )
          : Center(
              child: ListView(
                children: [
                  CircleAvatar(
                    radius: 50,
                    child: Image.asset(
                      'assets/images/NoPath - Copy (14).png',
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  InkWell(
                    onTap: () {
                      setState(() {
                        clicked = !clicked;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.edit, color: Colors.red),
                        SizedBox(width: width * 0.01),
                        Text(
                          'Edit Profile',
                          textScaleFactor: textScale,
                          style: const TextStyle(
                            color: Colors.red,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.002),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(left: width * 0.04),
                      child: Text(
                        'Hi there ${provider['name'].substring(0, 3)}',
                        textScaleFactor: textScale,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.003),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(left: width * 0.04),
                      child: InkWell(
                        onTap: () async {
                          // var res = await Provider.of<Network>.getData('/logout');
                          var res =
                              await Provider.of<Network>(context, listen: false)
                                  .getData('api/auth/logout');
                          var body = json.decode(res.body);
                          // if (body['success']) {
                          SharedPreferences localStorage =
                              await SharedPreferences.getInstance();
                          // localStorage.remove('user');
                          localStorage.setString('token', '').then((_) =>
                              Navigator.of(context).pushNamed('/sign-in'));
                          localStorage.clear();
                          print(
                              'Token Value ${localStorage.getString('token')}');
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (context) => SignIn()));
                          // Navigator.of(context).pushReplacementNamed('/sign-in');
                        },
                        child: Text(
                          'Sign Out',
                          textScaleFactor: textScale,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  !clicked ? Details() : EditProfile()
                ],
              ),
            ),
    );
  }
}
