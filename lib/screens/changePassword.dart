import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/logInSignIn/button.dart';
import 'package:provider/provider.dart';
import '../model/network_utils/authentication.dart';
import 'dart:convert';

class ChangePassword extends StatefulWidget {
  ChangePasswordState createState() => ChangePasswordState();
}

class ChangePasswordState extends State<ChangePassword> {
  final _changePassword = GlobalKey<FormState>();
  var newPassword = '';
  var updatePassword = '';
  final TextEditingController _newPassword = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var textScale = MediaQuery.of(context).textScaleFactor * 1.2;

    // TODO: implement build
    return Scaffold(
      body: Container(
        width: width * 1,
        height: height * 1,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/Hand_drawn.png'),
                fit: BoxFit.cover)),
        child: Form(
          key: _changePassword,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(left: width * 0.06),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Enter New Password',
                        textScaleFactor: textScale,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
              ),
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
                    controller: _newPassword,
                    obscureText: true,
                    obscuringCharacter: '*',
                    decoration: InputDecoration(
                      label: Text(
                        'New Password',
                        textScaleFactor:
                            MediaQuery.of(context).textScaleFactor * 1,
                      ),
                      focusedBorder: InputBorder.none,
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.next,
                    // onFieldSubmitted: (_) =>
                    //     FocusScope.of(context).requestFocus(_passwordFocus),
                    validator: (password) {
                      if (password!.isEmpty) {
                        return 'Please Enter Email';
                      } else {
                        newPassword = password;
                        print(password);
                        return null;
                      }
                    },
                  ),
                ),
              ),
              SizedBox(height: height * 0.04),
              // Padding(
              //   padding: EdgeInsets.only(left: width * 0.06),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     children: [
              //       Text('Enter New Password',
              //           textScaleFactor: textScale,
              //           style: const TextStyle(
              //             color: Colors.white,
              //             fontWeight: FontWeight.bold,
              //           )),
              //     ],
              //   ),
              // ),
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
                    controller: _confirmPassword,
                    obscureText: true,
                    obscuringCharacter: '*',
                    decoration: InputDecoration(
                      label: Text(
                        'Confirm Password',
                        textScaleFactor:
                            MediaQuery.of(context).textScaleFactor * 1,
                      ),
                      focusedBorder: InputBorder.none,
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.next,
                    // onFieldSubmitted: (_) =>
                    //     FocusScope.of(context).requestFocus(_passwordFocus),
                    validator: (password) {
                      if (password!.isEmpty) {
                        return 'Please Enter Email';
                      } else {
                        updatePassword = password;
                        print(password);
                        return null;
                      }
                    },
                  ),
                ),
              ),
              SizedBox(height: height * 0.04),
              InkWell(
                onTap: () {
                  if (_newPassword.text != _confirmPassword.text) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Passwords don\'t match',
                            textScaleFactor: textScale,
                            style: const TextStyle(
                              color: Colors.white,
                            ))));
                  } else {
                    if (_changePassword.currentState!.validate()) {
                      _changePasswordMethod(context);
                    }
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
                  child: Button('Change Password'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _changePasswordMethod(BuildContext context) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var data = {
      'forget_password_token': localStorage.getString('forgotPasswordToken'),
      'password': updatePassword
    };

    final response = await Provider.of<Network>(context, listen: false)
        .authData(data, 'api/auth/change_password');

    print(response.body);

    var res = json.decode(response.body);

    if (res['error'] == 'Unauthorized') {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(res['error'].toString(),
            // textScaleFactor: textScale,
            style: const TextStyle(
              color: Colors.white,
            )),
        action: SnackBarAction(
          label: 'Close',
          onPressed: () => Scaffold.of(context).hideCurrentSnackBar(),
        ),
      ));
    }
  }
}
