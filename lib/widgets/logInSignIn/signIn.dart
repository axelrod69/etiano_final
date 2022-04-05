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
import 'package:random_password_generator/random_password_generator.dart';

class SignInForm extends StatefulWidget {
  @override
  SignInFormState createState() => SignInFormState();
}

class SignInFormState extends State<SignInForm> {
  final _passwordFocus = FocusNode();
  final _key = GlobalKey<FormState>();
  final _fbKey = GlobalKey<FormState>();
  final _googleKey = GlobalKey<FormState>();
  bool isValidated = false;
  late var inputEmail;
  late var inputPassword;
  late var phoneNumber;
  final generatedPassword = RandomPasswordGenerator();
  String randomPassword = '';

  @override
  void dispose() {
    _passwordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    bool tabLayout = width > 600;
    bool largeLayout = width > 350 && width < 600;

    // print('Height $height');
    // print('Width $width');
    // print('Check Height $tabLayout')

    // TODO: implement build
    return Container(
      padding: EdgeInsets.only(
          top: tabLayout
              ? height * 0.08
              : largeLayout
                  ? height * 0.04
                  : height * 0.02),
      decoration: BoxDecoration(
          border: Border.all(color: const Color.fromRGBO(198, 241, 74, 1))),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('Good Food Waiting For You',
              textScaleFactor: MediaQuery.of(context).textScaleFactor * 1.2,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: tabLayout
                      ? 18
                      : largeLayout
                          ? 14
                          : 10,
                  fontWeight: FontWeight.bold)),
          Padding(
            // padding: const EdgeInsets.fromLTRB(50, 40, 50, 0),
            padding: EdgeInsets.only(
                left: width * 0.12, top: height * 0.04, right: width * 0.12),
            child: Form(
              key: _key,
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.07,
                    child: TextFormField(
                      // controller: textController,
                      decoration: InputDecoration(
                          errorStyle: TextStyle(
                              fontSize: tabLayout
                                  ? 16
                                  : largeLayout
                                      ? 14.0
                                      : 10),
                          // labelText: 'Hint text',
                          hintText: 'Enter Email',
                          hintStyle: TextStyle(),
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide(
                                color: Colors.blue,
                              )),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide:
                                  BorderSide(color: Colors.black, width: 1.0))),
                      style: TextStyle(color: Colors.black),
                      validator: (email) {
                        if (email!.isEmpty) {
                          return '\u26A0 Please Enter Email';
                        }
                        return null;
                      },
                    ),
                  ),
                  // Container(
                  //     height: tabLayout
                  //         ? height * 0.07
                  //         : largeLayout
                  //             ? height * 0.06
                  //             : height * 0.066,
                  //     // padding: EdgeInsets.only(left: width * 0.045),
                  //     decoration: BoxDecoration(
                  //         color: Colors.white,
                  //         borderRadius: BorderRadius.circular(30),
                  //         boxShadow: const [
                  //           BoxShadow(
                  //               color: Colors.black,
                  //               blurRadius: 20,
                  //               spreadRadius: 10,
                  //               offset: Offset(2, 1))
                  //         ]),
                  //     // child: TextFormField(
                  //     //   decoration: InputDecoration(
                  //     //       errorStyle: TextStyle(
                  //     //           fontSize: largeLayout
                  //     //               ? 8
                  //     //               : tabLayout
                  //     //                   ? 6
                  //     //                   : 7),
                  //     //       hintText: 'Your Email',
                  //     //       focusedBorder: InputBorder.none,
                  //     //       border: InputBorder.none),
                  //     //   keyboardType: TextInputType.emailAddress,
                  //     //   textInputAction: TextInputAction.next,
                  //     //   onFieldSubmitted: (_) =>
                  //     //       FocusScope.of(context).requestFocus(_passwordFocus),
                  //     //   validator: (email) {
                  //     //     if (email!.isEmpty) {
                  //     //       return '\u26A0 Please Enter Email';
                  //     //     } else {
                  //     //       inputEmail = email;
                  //     //       return null;
                  //     //     }
                  //     //   },
                  //     // )
                  //     child: TextFormField(
                  //         // controller: textController,
                  //         decoration: InputDecoration(
                  //             errorStyle: TextStyle(fontSize: 5.0),
                  //             // labelText: 'Hint text',
                  //             filled: true,
                  //             fillColor: Colors.white,
                  //             enabledBorder: OutlineInputBorder(
                  //               borderRadius: BorderRadius.circular(25.0),
                  //               borderSide: BorderSide(
                  //                 color: Colors.grey,
                  //               ),
                  //             ),
                  //             focusedBorder: OutlineInputBorder(
                  //                 borderRadius: BorderRadius.circular(25.0),
                  //                 borderSide: BorderSide(
                  //                   color: Colors.blue,
                  //                 )),
                  //             border: OutlineInputBorder(
                  //                 borderRadius: BorderRadius.circular(25.0),
                  //                 borderSide: BorderSide(
                  //                     color: Colors.black, width: 1.0))),
                  //         style: TextStyle(color: Colors.black),
                  //         validator: (email) {
                  //           if (email!.isEmpty) {
                  //             return '\u26A0 Field is empty.';
                  //           }
                  //           return null;
                  //         })),
                  SizedBox(height: height * 0.03),
                  SizedBox(
                    height: height * 0.07,
                    child: TextFormField(
                      // controller: textController,
                      decoration: InputDecoration(
                          errorStyle: TextStyle(
                              fontSize: tabLayout
                                  ? 16
                                  : largeLayout
                                      ? 14.0
                                      : 10),
                          // labelText: 'Hint text',
                          hintText: 'Enter Password',
                          hintStyle: TextStyle(),
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide(
                                color: Colors.blue,
                              )),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide:
                                  BorderSide(color: Colors.black, width: 1.0))),
                      style: TextStyle(color: Colors.black),
                      validator: (email) {
                        if (email!.isEmpty) {
                          return '\u26A0 Please Enter Password.';
                        }
                        return null;
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
                        textScaleFactor: tabLayout
                            ? MediaQuery.of(context).textScaleFactor * 0.95
                            : MediaQuery.of(context).textScaleFactor * 1.1,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(height: height * 0.06),
                  Text('or Login With',
                      textScaleFactor: tabLayout
                          ? MediaQuery.of(context).textScaleFactor * 1.1
                          : MediaQuery.of(context).textScaleFactor * 1.2,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                  InkWell(
                    onTap: facebookSignIn,
                    child: Container(
                      height: tabLayout ? height * 0.06 : height * 0.07,
                      width: double.infinity,
                      margin: EdgeInsets.only(
                          top: height * 0.015, bottom: height * 0.025),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(66, 103, 178, 0.8),
                          borderRadius: BorderRadius.circular(28),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black,
                                blurRadius: 8,
                                // spreadRadius: 10,
                                offset: Offset(2, 2))
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/facebook-letter-logo.png',
                              width: width * 0.03, height: height * 0.03),
                          SizedBox(width: width * 0.05),
                          Text('Login with Facebook',
                              textScaleFactor: tabLayout
                                  ? MediaQuery.of(context).textScaleFactor * 1
                                  : MediaQuery.of(context).textScaleFactor *
                                      1.1,
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
                      height: tabLayout ? height * 0.06 : height * 0.07,
                      width: double.infinity,
                      // margin: EdgeInsets.only(bottom: height * 0.025),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(219, 74, 57, 0.8),
                          borderRadius: BorderRadius.circular(28),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black,
                                blurRadius: 8,
                                // spreadRadius: 10,
                                offset: Offset(2, 2))
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/google-plus-logo.png',
                              width: width * 0.06, height: height * 0.06),
                          SizedBox(width: width * 0.02),
                          Text('Login with Google',
                              textScaleFactor: tabLayout
                                  ? MediaQuery.of(context).textScaleFactor * 1
                                  : MediaQuery.of(context).textScaleFactor *
                                      1.1,
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
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(
                'Please Enter Phone Number to Sign Up',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              content: Form(
                key: _fbKey,
                child: TextFormField(
                  decoration: InputDecoration(
                      label: Text('Phone Number'),
                      focusedBorder: InputBorder.none),
                  keyboardType: TextInputType.number,
                  validator: (phone) {
                    if (phone == null || phone.isEmpty) {
                      setState(() {
                        isValidated = true;
                      });
                      return 'Phone Number Required';
                    } else {
                      phoneNumber = phone;
                      return null;
                    }
                  },
                ),
              ),
              actions: [
                TextButton(
                    onPressed: () async {
                      // !isValidated ? null : Navigator.of(context).pop();
                      if (_fbKey.currentState != null &&
                          _fbKey.currentState!.validate()) {
                        Navigator.of(context).pop();
                        randomPassword = generatedPassword.randomPassword(
                            letters: false,
                            uppercase: false,
                            numbers: true,
                            specialChar: false,
                            passwordLength: 7);
                        final result = await FacebookAuth.i
                            .login(permissions: ['public_profile', 'email']);
                        if (result.status == LoginStatus.success) {
                          final userData = await FacebookAuth.i.getUserData();
                          print(userData);
                          print(phoneNumber);
                          print(randomPassword);
                          var data = {
                            'email': userData['email'],
                            'name': userData['name'],
                            'password': randomPassword,
                            'phone': phoneNumber,
                            'fb_id': userData['id'],
                            'country': 'India'
                          };
                          var res = Provider.of<Network>(context, listen: false)
                              .facebookSignUp(data, 'api/auth/signup');
                          var body = json.decode(res.body);
                          SharedPreferences localStorage =
                              await SharedPreferences.getInstance();
                          await localStorage.setString(
                              'token', body['access_token']);
                          print('Response $body');
                          Navigator.of(context).pushNamed('/bottom-bar');
                        }
                      } else {
                        print('error-response');
                      }
                    },
                    child: Text(
                      'Continue',
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ))
              ],
            ));
  }

  void googleSignIn() async {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(
                'Please Enter Phone Number to Sign Up',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              content: Form(
                key: _googleKey,
                child: TextFormField(
                  decoration: InputDecoration(
                      label: Text('Phone Number'),
                      focusedBorder: InputBorder.none),
                  keyboardType: TextInputType.number,
                  validator: (phone) {
                    if (phone == null || phone.isEmpty) {
                      setState(() {
                        isValidated = true;
                      });
                      return 'Phone Number Required';
                    } else {
                      phoneNumber = phone;
                      return null;
                    }
                  },
                ),
              ),
              actions: [
                TextButton(
                    onPressed: () async {
                      // !isValidated ? null : Navigator.of(context).pop();
                      if (_googleKey.currentState != null &&
                          _googleKey.currentState!.validate()) {
                        Navigator.of(context).pop();
                        randomPassword = generatedPassword.randomPassword(
                            letters: false,
                            uppercase: false,
                            numbers: true,
                            specialChar: false,
                            passwordLength: 7);
                        final _googleSignIn = GoogleSignIn();
                        var result = await _googleSignIn.signIn();
                        var data = {
                          'email': result!.email,
                          'name': result.displayName,
                          'password': randomPassword,
                          'phone': phoneNumber,
                          'o_auth': result.id,
                          'country': 'India'
                        };
                        print("Result $result");
                        print(phoneNumber);
                        print(randomPassword);
                        var res =
                            await Provider.of<Network>(context, listen: false)
                                .googleSignUp(data, 'api/auth/signup');
                        var body = json.decode(res.body);
                        print('Response $body');
                        SharedPreferences localStorage =
                            await SharedPreferences.getInstance();
                        await localStorage.setString(
                            'token', body['access_token']);
                        print('Response $body');
                        Navigator.of(context).pushNamed('/bottom-bar');
                      } else {
                        print('error-response');
                      }
                    },
                    child: Text(
                      'Continue',
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ))
              ],
            ));
  }
}
