import 'package:flutter/material.dart';
import '../../widgets/restaurant/cart.dart';
import '../../widgets/restaurant/notifyBell.dart';
// import './pageViewScreen.dart';
import '../../widgets/restaurant/reviews.dart';

class PostReview extends StatefulWidget {
  PostReviewState createState() => PostReviewState();
}

class PostReviewState extends State<PostReview> {
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final id = arguments["id"];
    final name = arguments["name"];
    final type = arguments["type"];
    final rating = arguments["rating"];

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final responsive = height - MediaQuery.of(context).padding.top;
    final textScale = MediaQuery.of(context).textScaleFactor * 1.2;
    // final nameController = TextEditingController();
    // final _key = GlobalKey<FormState>();
    final _reviewFocus = FocusNode();

    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: height * 1,
          width: width * 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: height * 0.44,
                width: double.infinity,
                // color: Colors.green,
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: height * 0.4,
                      // color: Colors.yellow,
                      child: Container(
                        // height: height * 0.25,
                        child: Image.asset(
                          'assets/images/peter-cat-restaurant-park-street-kolkata-restaurants-2dxpzo0.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: height * 0.01,
                      right: width * 0.01,
                      child: CircleAvatar(
                        radius: 35,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 33,
                          backgroundColor:
                              const Color.fromRGBO(161, 218, 46, 1),
                          child: Text(
                            rating,
                            textScaleFactor: textScale,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 25),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: height * 0.04,
                      left: width * 0.03,
                      child: InkWell(
                        onTap: () => Navigator.of(context)
                            .pushReplacementNamed('/restaurants-screen'),
                        child: Container(
                          decoration: const BoxDecoration(boxShadow: [
                            BoxShadow(
                                color: Colors.black,
                                // spreadRadius: 1,
                                blurRadius: 10,
                                offset: Offset(0, 0))
                          ]),
                          child: const CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.keyboard_arrow_left,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                  width: double.infinity,
                  height: height * 0.07,
                  padding:
                      EdgeInsets.only(left: width * 0.01, right: width * 0.01),
                  // padding: EdgeInsets.only(left: width * 0.02),
                  // color: Colors.blue,
                  child: Row(
                    children: [
                      Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Container(
                          // color: Colors.yellow,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                name,
                                textScaleFactor: textScale,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25),
                              ),
                              Text(
                                type,
                                textScaleFactor: textScale,
                                style: const TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        fit: FlexFit.loose,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                                // padding: EdgeInsets.only(top: height * 0.005),
                                // color: Colors.red,
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // ignore: avoid_unnecessary_containers
                                Container(
                                  child: Row(
                                    children: [Cart(), NotifyBell()],
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        '₹',
                                        textScaleFactor: textScale,
                                        style: const TextStyle(
                                            color: Colors.greenAccent),
                                      ),
                                      Text(
                                        '₹',
                                        textScaleFactor: textScale,
                                        style: const TextStyle(
                                            color: Colors.greenAccent),
                                      ),
                                      Text(
                                        '₹',
                                        textScaleFactor: textScale,
                                        style: const TextStyle(
                                            color: Colors.greenAccent),
                                      ),
                                      Text(
                                        '₹',
                                        textScaleFactor: textScale,
                                        style: const TextStyle(
                                            color: Colors.white),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )),
                          ],
                        ),
                      )
                    ],
                  )),
              SizedBox(height: height * 0.04),
              Padding(
                padding:
                    EdgeInsets.only(left: width * 0.05, right: width * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        height: height * 0.045,
                        width: width * 0.5,
                        padding: EdgeInsets.only(
                            left: width * 0.02, top: height * 0.008),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.white, width: 2)),
                        child: Text(
                          'Siddhartha Chatterjee',
                          textScaleFactor: textScale,
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )),
                    SizedBox(height: height * 0.02),
                    Form(
                      key: _key,
                      child: Container(
                          height: height * 0.2,
                          width: double.infinity,
                          padding: EdgeInsets.only(
                              left: width * 0.02, top: height * 0.005),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(color: Colors.white, width: 2)),
                          child: TextFormField(
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                            decoration: InputDecoration(
                                label: Text(
                                  'Write A Review',
                                  textScaleFactor: textScale,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                border: InputBorder.none),
                          )),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'Post',
                        textScaleFactor: textScale,
                        style: const TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
                      ))
                ],
              ),
              SizedBox(height: height * 0.05),
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      height: height * 0.05,
                      // color: Colors.amber,
                      child: Center(
                        child: Text(
                          'Details',
                          textScaleFactor: textScale,
                          style: const TextStyle(
                              color: const Color.fromRGBO(161, 218, 46, 1),
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              shadows: [
                                Shadow(
                                    color: Colors.grey,
                                    blurRadius: 10,
                                    offset: Offset(0, 2))
                              ]),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: InkWell(
                      onTap: () => Navigator.of(context).pushReplacementNamed(
                          '/page-view-screen',
                          arguments: {'id': id, 'name': name}),
                      child: Container(
                        height: height * 0.05,
                        // color: Colors.green,
                        child: Center(
                          child: Text(
                            'Menu',
                            textScaleFactor: textScale,
                            style: const TextStyle(
                                color: const Color.fromRGBO(161, 218, 46, 1),
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                shadows: [
                                  Shadow(
                                      color: Colors.grey,
                                      blurRadius: 10,
                                      offset: Offset(0, 2))
                                ]),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      height: height * 0.05,
                      // color: Colors.blue,
                      child: Center(
                        child: Text(
                          'Reviews',
                          textScaleFactor: textScale,
                          style: const TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              shadows: [
                                Shadow(
                                    color: Colors.grey,
                                    blurRadius: 10,
                                    offset: Offset(0, 2))
                              ]),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
