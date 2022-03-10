import 'package:flutter/material.dart';
import '../painters/logInOutBorderPaint.dart';
import '../widgets/logInSignIn/signUp.dart';

class SignUp extends StatefulWidget {
  SignUpState createState() => SignUpState();
}

class SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    // var statusBarPadding = MediaQuery.of(context).padding.top;
    var responsive =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    var textScale = MediaQuery.of(context).textScaleFactor * 1.2;

    // TODO: implement build
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/Hand_drawn.png'),
                fit: BoxFit.cover)),
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.end,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // color: Colors.red,
              height: (height - MediaQuery.of(context).padding.top) * 0.80,
              padding: EdgeInsets.only(
                  left: width * 0.04,
                  top: responsive * 0.06,
                  right: width * 0.04,
                  bottom: responsive * 0.01),
              width: double.infinity,
              // color: Colors.red,
              child: Container(
                height: double.infinity,
                width: double.infinity,
                child: CustomPaint(
                  painter: LogInOutBorderPaint(),
                  child: SignUpForm(),
                ),
              ),
            ),
            Container(
              height: (height - MediaQuery.of(context).padding.top) * 0.20,
              width: double.infinity,
              padding: EdgeInsets.only(
                  top: responsive * 0.01, bottom: responsive * 0.01),
              // color: Colors.green,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an Account?',
                        textScaleFactor: textScale,
                        style: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      const SizedBox(width: 2),
                      InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .pushReplacementNamed('/sign-in');
                        },
                        child: Text(
                          'Sign In',
                          textScaleFactor: textScale,
                          style: const TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur',
                    textScaleFactor: textScale,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
