import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/membership/membership.dart';

class MembershipScreen extends StatefulWidget {
  MembershipScreenState createState() => MembershipScreenState();
}

class MembershipScreenState extends State<MembershipScreen> {
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<MembershipProvider>(context, listen: false)
        .getMembershipDetails()
        .then((_) {
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final textScale = MediaQuery.of(context).textScaleFactor * 1.2;
    final provider = Provider.of<MembershipProvider>(context).membership;

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: InkWell(
            onTap: () =>
                Navigator.of(context).pushReplacementNamed('/bottom-bar'),
            child: const Icon(Icons.arrow_back_ios, color: Colors.red)),
        title: Padding(
          padding: EdgeInsets.only(left: width * 0.16),
          child: Text('Membership',
              textScaleFactor: textScale,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold)),
        ),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            )
          : Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      child: Image.asset(
                        'assets/images/NoPath - Copy (14).png',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.05),
                Text('Unlock Everything',
                    textScaleFactor: textScale,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )),
                SizedBox(height: height * 0.02),
                Text(
                    'Excepteur sint occaecat cupidatat non proident, sunt\n in culpa qui officia deserunt mollit anim id est laborum.',
                    textScaleFactor: textScale,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 12,
                      // fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    )),
                SizedBox(height: height * 0.05),
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: height * 0.3,
                      // color: Colors.red,
                      padding: EdgeInsets.only(
                          left: width * 0.04,
                          top: height * 0.02,
                          right: width * 0.04,
                          bottom: height * 0.02),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              flex: 1,
                              fit: FlexFit.tight,
                              child: Container(
                                height: double.infinity,
                                decoration: BoxDecoration(
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.black,
                                          spreadRadius: 5,
                                          blurRadius: 10,
                                          offset: Offset(2, 1))
                                    ],
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Column(
                                  children: [
                                    Flexible(
                                      flex: 1,
                                      fit: FlexFit.tight,
                                      child: Container(
                                        width: double.infinity,
                                        decoration: const BoxDecoration(
                                            color: Color.fromRGBO(
                                                103, 103, 103, 1),
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                topRight: Radius.circular(20))),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: height * 0.01),
                                              child: Text(
                                                // 'SILVER',
                                                provider['data'][0]
                                                    ['membership_type_name'],
                                                textScaleFactor: textScale,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20),
                                              ),
                                            ),
                                            Text(
                                                provider['data'][0]
                                                    ['time_period'],
                                                textScaleFactor: textScale,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18)),
                                            Text('Months',
                                                textScaleFactor: textScale,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15))
                                          ],
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      flex: 1,
                                      fit: FlexFit.tight,
                                      child: Container(
                                        width: double.infinity,
                                        decoration: const BoxDecoration(
                                            color: Color.fromRGBO(
                                                103, 103, 103, 1),
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(20),
                                                bottomRight:
                                                    Radius.circular(20))),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                                '₹ ${provider['data'][0]['membership_price']}',
                                                textScaleFactor: textScale,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 30)),
                                            Text(
                                                '${int.parse(provider['data'][0]['membership_price']) / 12}/Month',
                                                textScaleFactor: textScale,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12))
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: width * 0.05),
                            Flexible(
                              flex: 1,
                              fit: FlexFit.tight,
                              child: Container(
                                height: double.infinity,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.black,
                                          spreadRadius: 5,
                                          blurRadius: 10,
                                          offset: Offset(2, 1))
                                    ],
                                    borderRadius: BorderRadius.circular(20)),
                                child: Column(
                                  children: [
                                    Flexible(
                                      flex: 1,
                                      fit: FlexFit.tight,
                                      child: Container(
                                        width: double.infinity,
                                        decoration: const BoxDecoration(
                                            color: Color.fromRGBO(
                                                103, 103, 103, 1),
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                topRight: Radius.circular(20))),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: height * 0.01),
                                              child: Text(
                                                provider['data'][1]
                                                    ['membership_type_name'],
                                                textScaleFactor: textScale,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20),
                                              ),
                                            ),
                                            Text(
                                                provider['data'][1]
                                                    ['time_period'],
                                                textScaleFactor: textScale,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18)),
                                            Text('Months',
                                                textScaleFactor: textScale,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15))
                                          ],
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      flex: 1,
                                      fit: FlexFit.tight,
                                      child: Container(
                                        width: double.infinity,
                                        decoration: const BoxDecoration(
                                            color: Color.fromRGBO(
                                                103, 103, 103, 1),
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(20),
                                                bottomRight:
                                                    Radius.circular(20))),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                                '₹ ${provider['data'][1]['membership_price']}',
                                                textScaleFactor: textScale,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 30)),
                                            Text(
                                                '${(int.parse(provider['data'][1]['membership_price'])) / 12}/Month',
                                                textScaleFactor: textScale,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12))
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            // SizedBox(width: width * 0.05),
                            // Flexible(
                            //   flex: 1,
                            //   fit: FlexFit.tight,
                            //   child: Container(
                            //     height: double.infinity,
                            //     decoration: BoxDecoration(
                            //         color: Colors.white,
                            //         boxShadow: const [
                            //           BoxShadow(
                            //               color: Colors.black,
                            //               spreadRadius: 5,
                            //               blurRadius: 10,
                            //               offset: Offset(2, 1))
                            //         ],
                            //         borderRadius: BorderRadius.circular(20)),
                            //     child: Column(
                            //       children: [
                            //         Flexible(
                            //           flex: 1,
                            //           fit: FlexFit.tight,
                            //           child: Container(
                            //             width: double.infinity,
                            //             decoration: const BoxDecoration(
                            //                 color: Color.fromRGBO(103, 103, 103, 1),
                            //                 borderRadius: BorderRadius.only(
                            //                     topLeft: Radius.circular(20),
                            //                     topRight: Radius.circular(20))),
                            //             child: Column(
                            //               mainAxisAlignment: MainAxisAlignment.center,
                            //               children: [
                            //                 Padding(
                            //                   padding:
                            //                       EdgeInsets.only(top: height * 0.01),
                            //                   child: Text(
                            //                     provider['data'][0]
                            //                         ['membership_type_name'],
                            //                     textScaleFactor: textScale,
                            //                     style: const TextStyle(
                            //                         color: Colors.white,
                            //                         fontWeight: FontWeight.bold,
                            //                         fontSize: 18),
                            //                   ),
                            //                 ),
                            //                 Text(provider['data'][0]['time_period'],
                            //                     textScaleFactor: textScale,
                            //                     style: const TextStyle(
                            //                         color: Colors.white,
                            //                         fontWeight: FontWeight.bold,
                            //                         fontSize: 18)),
                            //                 Text('Months',
                            //                     textScaleFactor: textScale,
                            //                     style: const TextStyle(
                            //                         color: Colors.white,
                            //                         fontWeight: FontWeight.bold,
                            //                         fontSize: 15))
                            //               ],
                            //             ),
                            //           ),
                            //         ),
                            //         Flexible(
                            //           flex: 1,
                            //           fit: FlexFit.tight,
                            //           child: Container(
                            //             width: double.infinity,
                            //             decoration: const BoxDecoration(
                            //                 color: Color.fromRGBO(103, 103, 103, 1),
                            //                 borderRadius: BorderRadius.only(
                            //                     bottomLeft: Radius.circular(20),
                            //                     bottomRight: Radius.circular(20))),
                            //             child: Column(
                            //               mainAxisAlignment: MainAxisAlignment.center,
                            //               children: [
                            //                 Text(
                            //                     '₹ ${provider['data'][0]['membership_price']}',
                            //                     textScaleFactor: textScale,
                            //                     style: const TextStyle(
                            //                         color: Colors.white,
                            //                         fontWeight: FontWeight.bold,
                            //                         fontSize: 30)),
                            //                 Text(
                            //                     '${int.parse(provider['data'][0]['membership_price']) / 12}/Month',
                            //                     textScaleFactor: textScale,
                            //                     style: const TextStyle(
                            //                         color: Colors.white,
                            //                         fontWeight: FontWeight.bold,
                            //                         fontSize: 12))
                            //               ],
                            //             ),
                            //           ),
                            //         )
                            //       ],
                            //     ),
                            //   ),
                            // )
                          ]),
                    ),
                    Positioned(
                      left: width * 0.4,
                      // top: height * 0.008,
                      child: Container(
                        width: width * 0.2,
                        height: height * 0.035,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(200, 225, 55, 1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                              '${provider['data'][1]['discount_percent']}% OFF',
                              textScaleFactor: textScale,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12)),
                        ),
                      ),
                    ),
                    Positioned(
                      left: width * 0.075,
                      // top: height * 0.0001,
                      child: Container(
                        width: width * 0.2,
                        height: height * 0.035,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(200, 225, 55, 1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                              '${provider['data'][0]['discount_percent']}% OFF',
                              textScaleFactor: textScale,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12)),
                        ),
                      ),
                    ),
                    // Positioned(
                    //   right: width * 0.075,
                    //   // top: height * 0.008,
                    //   child: Container(
                    //     width: width * 0.2,
                    //     height: height * 0.035,
                    //     decoration: BoxDecoration(
                    //       color: const Color.fromRGBO(200, 225, 55, 1),
                    //       borderRadius: BorderRadius.circular(20),
                    //     ),
                    //     child: Center(
                    //       child: Text(
                    //           '${provider['data'][0]['discount_percent']}% OFF',
                    //           textScaleFactor: textScale,
                    //           style: const TextStyle(
                    //               color: Colors.black,
                    //               fontWeight: FontWeight.bold,
                    //               fontSize: 12)),
                    //     ),
                    //   ),
                    // )
                  ],
                ),
                SizedBox(height: height * 0.05),
                Text(
                    'Excepteur sint occaecat cupidatat non proident, sunt\n in culpa qui officia deserunt mollit anim id est laborum.',
                    textScaleFactor: textScale,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 12,
                      // fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    )),
                SizedBox(height: height * 0.03),
                Padding(
                  padding:
                      EdgeInsets.only(left: width * 0.07, right: width * 0.07),
                  child: Container(
                    width: double.infinity,
                    height: height * 0.07,
                    decoration: BoxDecoration(
                        // color: Colors.green,
                        border: Border.all(
                            color: const Color.fromRGBO(200, 225, 55, 1),
                            width: 1),
                        borderRadius: BorderRadius.circular(30)),
                    child: Center(
                        child: Text('CONTINUE',
                            textScaleFactor: textScale,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ))),
                  ),
                )
              ],
            ),
    );
  }
}
