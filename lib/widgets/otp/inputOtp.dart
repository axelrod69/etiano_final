import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../logInSignIn/button.dart';
import 'package:provider/provider.dart';
import '../../model/network_utils/authentication.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class InputOTP extends StatefulWidget {
  InputOTPState createState() => InputOTPState();
  final String email;

  InputOTP(this.email);
}

class InputOTPState extends State<InputOTP> {
  final _focusSecond = FocusNode();
  final _focusThird = FocusNode();
  final _focusFourth = FocusNode();
  final _key = GlobalKey<FormState>();
  var _firstPin = '';
  var _secondPin = '';
  var _thirdPin = '';
  var _fourthPin = '';

  @override
  void dispose() {
    // TODO: implement dispose
    _focusSecond.dispose();
    _focusThird.dispose();
    _focusFourth.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var textScale = MediaQuery.of(context).textScaleFactor;

    // TODO: implement build
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Form(
          key: _key,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: Container(
                  width: width * 0.18,
                  height: height * 0.08,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: TextFormField(
                    showCursor: true,
                    cursorHeight: 45,
                    inputFormatters: [LengthLimitingTextInputFormatter(1)],
                    keyboardType: TextInputType.number,
                    style: const TextStyle(fontSize: 45),
                    textAlign: TextAlign.center,
                    obscureText: true,
                    obscuringCharacter: '*',
                    decoration: const InputDecoration(
                        focusedBorder: InputBorder.none,
                        border: InputBorder.none),
                    onFieldSubmitted: (_) =>
                        FocusScope.of(context).requestFocus(_focusSecond),
                    validator: (first) {
                      _firstPin = first.toString();
                      return null;
                    },
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: width * 0.18,
                  height: height * 0.08,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: TextFormField(
                      showCursor: true,
                      cursorHeight: 45,
                      inputFormatters: [LengthLimitingTextInputFormatter(1)],
                      keyboardType: TextInputType.number,
                      focusNode: _focusSecond,
                      style: const TextStyle(fontSize: 45),
                      textAlign: TextAlign.center,
                      obscureText: true,
                      obscuringCharacter: '*',
                      decoration: const InputDecoration(
                          focusedBorder: InputBorder.none,
                          border: InputBorder.none),
                      onFieldSubmitted: (_) =>
                          FocusScope.of(context).requestFocus(_focusThird),
                      validator: (second) {
                        _secondPin = second.toString();
                        return null;
                      }),
                ),
              ),
              Center(
                child: Container(
                  width: width * 0.18,
                  height: height * 0.08,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: TextFormField(
                      showCursor: true,
                      cursorHeight: 45,
                      inputFormatters: [LengthLimitingTextInputFormatter(1)],
                      focusNode: _focusThird,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(fontSize: 45),
                      textAlign: TextAlign.center,
                      obscureText: true,
                      obscuringCharacter: '*',
                      decoration: const InputDecoration(
                          focusedBorder: InputBorder.none,
                          border: InputBorder.none),
                      onFieldSubmitted: (_) =>
                          FocusScope.of(context).requestFocus(_focusFourth),
                      validator: (third) {
                        _thirdPin = third.toString();
                        return null;
                      }),
                ),
              ),
              Center(
                child: Container(
                  width: width * 0.18,
                  height: height * 0.08,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: TextFormField(
                      showCursor: true,
                      cursorHeight: 45,
                      inputFormatters: [LengthLimitingTextInputFormatter(1)],
                      focusNode: _focusFourth,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(fontSize: 45),
                      textAlign: TextAlign.center,
                      obscureText: true,
                      obscuringCharacter: '*',
                      decoration: const InputDecoration(
                          focusedBorder: InputBorder.none,
                          border: InputBorder.none),
                      validator: (fourth) {
                        _fourthPin = fourth.toString();
                        return null;
                      }),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: height * 0.045),
        InkWell(
            onTap: () {
              if (_key.currentState!.validate()) {
                checkOtp();
              }
            },
            child: SizedBox(height: height * 0.075, child: Button('Next'))),
        SizedBox(height: height * 0.035),
        Expanded(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            padding: EdgeInsets.only(top: height * 0.01, bottom: height * 0.01),
            // color: Colors.green,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Didn\'t Receive?',
                        textScaleFactor: textScale,
                        style: const TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold)),
                    const SizedBox(width: 2),
                    InkWell(
                        onTap: sendAgain(),
                        child: Text('Send Again',
                            textScaleFactor: textScale,
                            style: const TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold))),
                  ],
                ),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur',
                  textScaleFactor: MediaQuery.of(context).textScaleFactor * 1.2,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void checkOtp() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    String otp = _firstPin + _secondPin + _thirdPin + _fourthPin;
    // print(otp);
    var data = {'email': widget.email, 'otp': otp};
    final response = await Provider.of<Network>(context, listen: false)
        .authData(data, 'api/auth/check_otp');
    var body = json.decode(response.body);
    if (body['status'] == 'success') {
      localStorage.setString(
          'forgotPasswordToken', body['forget_password_token']);
      print(
          'Forgot Password Token ${localStorage.getString('forgotPasswordToken')}');
    }
  }

  sendAgain() async {
    var data = {'email': widget.email};
    // print('Email ${data['email']}');
    // var provider = await Provider.of<Network>(context, listen: false)
    //     .authData(data, 'api/auth/forget_password');
    var provider = await Provider.of<Network>(context, listen: false)
        .authData(data, 'api/auth/forget_password');

    // print(json.decode(provider.body));
    var body = json.decode(provider.body);

    if (body['staus'] == 'success') {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(body['data'].toString(),
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold)),
          action: SnackBarAction(
              label: 'Close',
              onPressed: () => Scaffold.of(context).hideCurrentSnackBar())));
      // Navigator.of(context).pushReplacementNamed('/otp-screen',
      //     arguments: {'email': recoveryEmail});
    }
  }
}
