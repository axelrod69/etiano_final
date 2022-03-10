import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../logInSignIn/button.dart';

class InputOTP extends StatefulWidget {
  InputOTPState createState() => InputOTPState();
}

class InputOTPState extends State<InputOTP> {
  final _focusSecond = FocusNode();
  final _focusThird = FocusNode();
  final _focusFourth = FocusNode();
  final _key = GlobalKey<FormState>();

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
                          FocusScope.of(context).requestFocus(_focusFourth)),
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
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: height * 0.045),
        SizedBox(height: height * 0.075, child: Button('Next')),
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
                        onTap: () {},
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
        // const SizedBox(height: 305),
        // Text(
        //   'Lorem ipsum dolor sit amet, consectetur',
        //   textScaleFactor: textScale,
        //   style: const TextStyle(
        //       color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold),
        // ),
      ],
    );
  }
}
