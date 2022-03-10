import 'package:flutter/material.dart';
import '../widgets/otp/inputOtp.dart';

class OTP extends StatefulWidget {
  OTPState createState() => OTPState();
}

class OTPState extends State<OTP> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var statusBarPadding = MediaQuery.of(context).padding.top;
    var responsive = height - statusBarPadding;

    var textScale = MediaQuery.of(context).textScaleFactor * 1;

    // TODO: implement build
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/Hand_drawn.png'),
              fit: BoxFit.cover)),
      child: ListView(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: (height - MediaQuery.of(context).padding.top) * 0.3,
              width: double.infinity,
              // color: Colors.red,
              padding: EdgeInsets.only(
                  top: responsive * 0.09,
                  left: width * 0.02,
                  right: width * 0.02),
              child: Column(
                children: [
                  Text(
                    'We have sent an OTP to your Mobile',
                    textScaleFactor: textScale,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  Text(
                    'Please check your mobile number 071*****12 to continue to reset your password',
                    textScaleFactor: textScale,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      // fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: (height - MediaQuery.of(context).padding.top) * 0.7,
              width: double.infinity,
              // color: Colors.red,
              child: InputOTP(),
            ),
          ],
        ),
      ]),
    ));
  }
}
