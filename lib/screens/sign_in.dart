import 'package:flutter/material.dart';
import '../painters/logInOutBorderPaint.dart';
import '../widgets/logInSignIn/signIn.dart';

class SignIn extends StatefulWidget {
  SignInState createState() => SignInState();
}

class SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var statusBarPadding = MediaQuery.of(context).padding.top;
    bool tabLayout = width > 600;
    bool largeLayout = width > 350 && width < 600;

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
              height: tabLayout
                  ? (height - statusBarPadding) * 0.80
                  : (height - statusBarPadding) * 0.85,
              // padding: const EdgeInsets.fromLTRB(10, 60, 10, 10),
              padding: EdgeInsets.only(
                  left: width * 0.04,
                  top: (height - statusBarPadding) * 0.06,
                  right: width * 0.04,
                  bottom: (height - statusBarPadding) * 0.01),
              width: double.infinity,
              // color: Colors.red,
              child: Container(
                height: double.infinity,
                width: double.infinity,
                child: CustomPaint(
                  painter: LogInOutBorderPaint(),
                  child: SignInForm(),
                ),
              ),
            ),
            Container(
              height: tabLayout
                  ? (height - MediaQuery.of(context).padding.top) * 0.20
                  : (height - MediaQuery.of(context).padding.top) * 0.15,
              width: double.infinity,
              padding: EdgeInsets.only(
                  top: (height - statusBarPadding) * 0.006,
                  bottom: (height - statusBarPadding) * 0.015),
              // color: Colors.green,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an Account?',
                        textScaleFactor:
                            MediaQuery.of(context).textScaleFactor * 1.2,
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: tabLayout
                                ? 20
                                : largeLayout
                                    ? 15
                                    : 12),
                      ),
                      SizedBox(width: width * 0.01),
                      InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .pushReplacementNamed('/sign-up');
                        },
                        child: Text(
                          'Sign Up',
                          textScaleFactor:
                              MediaQuery.of(context).textScaleFactor * 1.2,
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: tabLayout
                                  ? 20
                                  : largeLayout
                                      ? 15
                                      : 12),
                        ),
                      )
                    ],
                  ),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur',
                    textScaleFactor:
                        MediaQuery.of(context).textScaleFactor * 1.2,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: tabLayout
                            ? 12
                            : largeLayout
                                ? 8
                                : 6,
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
