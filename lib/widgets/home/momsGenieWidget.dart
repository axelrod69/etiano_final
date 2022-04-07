import 'package:flutter/material.dart';

class MomsGenieWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var textScale = MediaQuery.of(context).textScaleFactor * 1.2;
    bool tabLayout = width > 600;
    bool largeLayout = width > 350 && width < 600;

    // TODO: implement build
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed('/moms-genie-screen'),
      child: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            // color: Colors.red,
          ),
          Positioned(
            top: height * 0.035,
            child: Container(
              height: tabLayout || largeLayout
                  ? MediaQuery.of(context).size.height * 0.25
                  : MediaQuery.of(context).size.height * 0.3,
              // width: double.infinity,
              width: width * 0.914,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        // Color.fromRGBO(20, 18, 59, 1),
                        Colors.black,
                        Color.fromRGBO(19, 15, 108, 1)
                      ]),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black,
                        // spreadRadius: 10,
                        blurRadius: 5,
                        offset: Offset(8, 3))
                  ]),
              child: Column(
                children: [
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          // color: Colors.green,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      child: Center(
                        child: Text(
                          'Delivering Food \nThroughout The World',
                          textScaleFactor: textScale,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: tabLayout || largeLayout ? 20 : 15),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(
                          left: width * 0.08,
                          // top: height * 0.01,
                          right: width * 0.08,
                          bottom: height * 0.02),
                      decoration: const BoxDecoration(
                          // color: Colors.pink,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                      child: Image.asset('assets/images/OBJECTS.png',
                          fit: BoxFit.cover),
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: height * 0.004,
            left: MediaQuery.of(context).size.width * 0.28,
            right: MediaQuery.of(context).size.width * 0.28,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.05,
              height: MediaQuery.of(context).size.height * 0.05,
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(103, 103, 103, 1),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black,
                        spreadRadius: 5,
                        blurRadius: 15,
                        offset: Offset(5, 1))
                  ]),
              child: Center(
                child: Text('Mom\'s Genie',
                    textScaleFactor: textScale,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: tabLayout || largeLayout ? 20 : 15)),
              ),
              // color: Colors.white,
            ),
          ),
          Positioned(
            bottom: height * 0.004,
            left: MediaQuery.of(context).size.width * 0.18,
            right: MediaQuery.of(context).size.width * 0.18,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.05,
              height: MediaQuery.of(context).size.height * 0.05,
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(103, 103, 103, 1),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black,
                        spreadRadius: 5,
                        blurRadius: 15,
                        offset: Offset(5, 4))
                  ]),
              child: Center(
                child: Text('Check The Genie',
                    textScaleFactor: textScale,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: tabLayout || largeLayout ? 20 : 15)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
