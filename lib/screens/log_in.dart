import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/logInSignIn/button.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    var height = MediaQuery.of(context).size.height;
    // var width = MediaQuery.of(context).size.width;

    // TODO: implement build
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: (height - MediaQuery.of(context).padding.top) * 0.6,
            width: double.infinity,
            padding: EdgeInsets.only(
                top: (MediaQuery.of(context).size.height -
                        MediaQuery.of(context).padding.top) *
                    0.1),
            child: Center(
              child: Text(
                'LOGO',
                textScaleFactor: MediaQuery.of(context).textScaleFactor * 1.2,
                style: const TextStyle(color: Colors.white, fontSize: 40),
              ),
            ),
          ),
          Container(
            height: (height - MediaQuery.of(context).padding.top) * 0.4,
            width: double.infinity,
            // padding: const EdgeInsets.only(bottom: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
                  textAlign: TextAlign.center,
                  textScaleFactor: MediaQuery.of(context).textScaleFactor * 1.2,
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
                SizedBox(
                    height: (MediaQuery.of(context).size.height -
                            MediaQuery.of(context).padding.top) *
                        0.05),
                InkWell(
                    onTap: () {
                      Navigator.of(context).pushReplacementNamed('/sign-in');
                    },
                    borderRadius: BorderRadius.circular(28),
                    splashColor: const Color.fromRGBO(242, 196, 187, 1),
                    child: Button('Login')),
                SizedBox(
                    height: (MediaQuery.of(context).size.height -
                            MediaQuery.of(context).padding.top) *
                        0.025),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed('/sign-up');
                  },
                  borderRadius: BorderRadius.circular(28),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.75,
                    height: MediaQuery.of(context).size.height * 0.055,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(28),
                        border: Border.all(
                            color: const Color.fromRGBO(252, 96, 17, 1))),
                    child: Center(
                      child: Text(
                        'Create An Account',
                        textScaleFactor:
                            MediaQuery.of(context).textScaleFactor * 1.2,
                        style: const TextStyle(
                            color: Color.fromRGBO(252, 96, 17, 1),
                            fontSize: 15),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                    height: (MediaQuery.of(context).size.height -
                            MediaQuery.of(context).padding.top) *
                        0.1),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur',
                  textScaleFactor: MediaQuery.of(context).textScaleFactor * 1.2,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                      fontWeight: FontWeight.bold),
                ),
                // SizedBox(height: 10)
              ],
            ),
          )
        ],
      ),
    );
  }
}
