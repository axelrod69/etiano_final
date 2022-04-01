// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'dart:ui';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import './button.dart';
import 'package:provider/provider.dart';
import '../../../model/network_utils/authentication.dart';
import '../../model/location/location.dart';
import '../../model/network_utils/facebookModel.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInForm extends StatefulWidget {
  @override
  SignInFormState createState() => SignInFormState();
}

class SignInFormState extends State<SignInForm> {
  final _passwordFocus = FocusNode();
  final _key = GlobalKey<FormState>();
  late var inputEmail;
  late var inputPassword;

  @override
  void dispose() {
    _passwordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    // TODO: implement build
    return Container(
      padding: EdgeInsets.only(top: height * 0.05),
      decoration: BoxDecoration(
          border: Border.all(color: const Color.fromRGBO(198, 241, 74, 1))),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('Good Food Waiting For You',
              textScaleFactor: MediaQuery.of(context).textScaleFactor * 1.2,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.bold)),
          Padding(
            // padding: const EdgeInsets.fromLTRB(50, 40, 50, 0),
            padding: EdgeInsets.only(
                left: width * 0.12, top: height * 0.04, right: width * 0.12),
            child: Form(
              key: _key,
              child: Column(
                children: [
                  Container(
                    height: height * 0.06,
                    padding: EdgeInsets.only(left: width * 0.045),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black,
                              blurRadius: 20,
                              spreadRadius: 10,
                              offset: Offset(2, 1))
                        ]),
                    child: TextFormField(
                      decoration: InputDecoration(
                        label: Text(
                          'Your Email',
                          textScaleFactor:
                              MediaQuery.of(context).textScaleFactor * 1,
                        ),
                        focusedBorder: InputBorder.none,
                      ),
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) =>
                          FocusScope.of(context).requestFocus(_passwordFocus),
                      validator: (email) {
                        if (email!.isEmpty) {
                          return 'Please Enter Email';
                        } else {
                          inputEmail = email;
                          return null;
                        }
                      },
                    ),
                  ),
                  SizedBox(height: height * 0.03),
                  Container(
                    height: height * 0.06,
                    padding: EdgeInsets.only(left: width * 0.045),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black,
                              blurRadius: 20,
                              spreadRadius: 10,
                              offset: Offset(2, 1))
                        ]),
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        label: Text('Password',
                            textScaleFactor:
                                MediaQuery.of(context).textScaleFactor * 1),
                        focusedBorder: InputBorder.none,
                      ),
                      keyboardType: TextInputType.text,
                      focusNode: _passwordFocus,
                      onFieldSubmitted: (_) =>
                          FocusScope.of(context).requestFocus(_passwordFocus),
                      validator: (password) {
                        if (password!.isEmpty) {
                          return 'Please Enter Email';
                        } else {
                          inputPassword = password;
                          return null;
                        }
                      },
                    ),
                  ),
                  SizedBox(height: height * 0.03),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black,
                              blurRadius: 20,
                              spreadRadius: 10,
                              offset: Offset(2, 1))
                        ]),
                    child: InkWell(
                        // onTap: () => Navigator.of(context)
                        //     .pushReplacementNamed('/home-screen'),
                        // onTap: () => Navigator.of(context)
                        //     .pushReplacementNamed('/bottom-bar'),
                        onTap: () {
                          if (_key.currentState!.validate()) {
                            _login();
                          }
                        },
                        child: Button('Login')),
                  ),
                  SizedBox(height: height * 0.01),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed('/forgot-password');
                    },
                    child: Text('Forgot your Password?',
                        textScaleFactor:
                            MediaQuery.of(context).textScaleFactor * 0.95,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(height: height * 0.06),
                  Text('or Login With',
                      textScaleFactor:
                          MediaQuery.of(context).textScaleFactor * 1.1,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                  InkWell(
                    onTap: facebookSignIn,
                    child: Container(
                      height: height * 0.06,
                      width: double.infinity,
                      margin: EdgeInsets.only(
                          top: height * 0.015, bottom: height * 0.025),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(66, 103, 178, 0.8),
                          borderRadius: BorderRadius.circular(28),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black,
                                blurRadius: 20,
                                spreadRadius: 10,
                                offset: Offset(2, 1))
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/facebook-letter-logo.png',
                              width: width * 0.03, height: height * 0.03),
                          SizedBox(width: width * 0.05),
                          Text('Login with Facebook',
                              textScaleFactor:
                                  MediaQuery.of(context).textScaleFactor * 1,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: googleSignIn,
                    child: Container(
                      height: height * 0.06,
                      width: double.infinity,
                      // margin: EdgeInsets.only(bottom: height * 0.025),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(219, 74, 57, 0.8),
                          borderRadius: BorderRadius.circular(28),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black,
                                blurRadius: 20,
                                spreadRadius: 10,
                                offset: Offset(2, 1))
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/google-plus-logo.png',
                              width: width * 0.06, height: height * 0.06),
                          SizedBox(width: width * 0.02),
                          Text('Login with Google',
                              textScaleFactor:
                                  MediaQuery.of(context).textScaleFactor * 1.1,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void _login() async {
    final data = {'email': inputEmail, 'password': inputPassword};
    print('Email ${data['email']} Password ${data['password']}');
    var res = await Provider.of<Network>(context, listen: false)
        .authData(data, 'api/auth/login');
    final provider =
        Provider.of<LocationProvider>(context, listen: false).loading;
    print(json.decode(res.body));
    var body = json.decode(res.body);

    if (body['error'] == 'Unauthorized') {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Email or Password invalid',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        action: SnackBarAction(
            label: 'Close',
            onPressed: () => Scaffold.of(context).hideCurrentSnackBar()),
      ));
    } else {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      // localStorage.setString('token', json.encode(body['access_token']));
      localStorage.setString('token', body['access_token']);
      Navigator.of(context).pushReplacementNamed('/bottom-bar');
      Provider.of<Network>(context, listen: false)
          .getToken(); //This is where I access the token from
      print(
          'print Token ${Provider.of<Network>(context, listen: false).authToken}');
    }
  }

  void facebookSignIn() async {
    final result =
        await FacebookAuth.i.login(permissions: ['public_profile', 'email']);
    if (result.status == LoginStatus.success) {
      final userData = await FacebookAuth.i.getUserData();
      print(userData);
    }
  }

  void googleSignIn() async {
    final _googleSignIn = GoogleSignIn();
    var result = await _googleSignIn.signIn();
    print("Result $result");
  }
}
