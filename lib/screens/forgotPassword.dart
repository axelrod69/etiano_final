import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/network_utils/authentication.dart';
import '../widgets/logInSignIn/button.dart';
import 'dart:convert';

class ForgotPassword extends StatefulWidget {
  ForgotPasswordState createState() => ForgotPasswordState();
}

class ForgotPasswordState extends State<ForgotPassword> {
  final _forgotKey = GlobalKey<FormState>();
  var recoveryEmail = '';

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var textScale = MediaQuery.of(context).textScaleFactor * 1.2;

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: const Icon(Icons.arrow_back_ios, color: Colors.red)),
      ),
      body: Container(
        width: width * 1,
        height: height * 1,
        // margin: EdgeInsets.only(bottom: height * 0.2),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/Hand_drawn.png'),
                fit: BoxFit.cover)),
        child: Form(
          key: _forgotKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Enter Email',
                  textScaleFactor: textScale,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(height: height * 0.02),
              Padding(
                padding:
                    EdgeInsets.only(left: width * 0.04, right: width * 0.04),
                child: Container(
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
                    // onFieldSubmitted: (_) =>
                    //     FocusScope.of(context).requestFocus(_passwordFocus),
                    validator: (email) {
                      if (email!.isEmpty) {
                        return 'Please Enter Email';
                      } else {
                        recoveryEmail = email;
                        print(email);
                        return null;
                      }
                    },
                  ),
                ),
              ),
              SizedBox(height: height * 0.03),
              InkWell(
                onTap: () {
                  if (_forgotKey.currentState!.validate()) {
                    _forgotPassword(context);
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black,
                            blurRadius: 20,
                            spreadRadius: 10,
                            offset: Offset(2, 1))
                      ]),
                  child: Button('Request OTP'),
                ),
              ),
              SizedBox(height: height * 0.02),
              Text('Please Check Your Email For The OTP',
                  textScaleFactor: textScale,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12))
            ],
          ),
        ),
      ),
    );
  }

  void _forgotPassword(BuildContext context) async {
    final data = {'email': recoveryEmail};
    print('Email ${data['email']}');
    // var provider = await Provider.of<Network>(context, listen: false)
    //     .authData(data, 'api/auth/forget_password');
    var provider = await Provider.of<Network>(context, listen: false)
        .authData(data, 'api/auth/forget_password');

    print(json.decode(provider.body));
    var body = json.decode(provider.body);

    if (body['staus'] == 'success') {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(body['data'].toString(),
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold)),
          action: SnackBarAction(
              label: 'Close',
              onPressed: () => Scaffold.of(context).hideCurrentSnackBar())));
      Navigator.of(context).pushReplacementNamed('/otp-screen',
          arguments: {'email': recoveryEmail});
    }
  }
}
