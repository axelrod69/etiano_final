import 'package:flutter/material.dart';
import '../../widgets/restaurant/cart.dart';
import '../../widgets/restaurant/notifyBell.dart';
import './pageViewScreen.dart';
import '../../widgets/restaurant/reviews.dart';

class ReviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final id = arguments["id"];
    final name = arguments["name"];
    final type = arguments["type"];
    final rating = arguments["rating"];
    final image = arguments["image"];

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final responsive = height - MediaQuery.of(context).padding.top;
    // final textScale = MediaQuery.of(context).textScaleFactor * 1.2;

    final Map<String, dynamic> _reviews = {
      'data': [
        {
          'id': '1',
          'name': 'John',
          'description':
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit,\n sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\n Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris\n nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\n cillum dolore eu fugiat nulla pariatur.',
          'rating': 5.0
        },
        {
          'id': '2',
          'name': 'Leo',
          'description':
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit,\n sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\n Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris\n nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\n cillum dolore eu fugiat nulla pariatur.',
          'rating': 4.0
        },
        {
          'id': '3',
          'name': 'Tom',
          'description':
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit,\n sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\n Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris\n nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\n cillum dolore eu fugiat nulla pariatur.',
          'rating': 3.0
        },
        {
          'id': '4',
          'name': 'Henry',
          'description':
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit,\n sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\n Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris\n nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\n cillum dolore eu fugiat nulla pariatur.',
          'rating': 3.0
        },
        {
          'id': '5',
          'name': 'John',
          'description':
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit,\n sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\n Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris\n nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\n cillum dolore eu fugiat nulla pariatur.',
          'rating': 5.0
        },
        {
          'id': '6',
          'name': 'Leo',
          'description':
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit,\n sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\n Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris\n nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\n cillum dolore eu fugiat nulla pariatur.',
          'rating': 4.0
        },
        {
          'id': '7',
          'name': 'Tom',
          'description':
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit,\n sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\n Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris\n nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\n cillum dolore eu fugiat nulla pariatur.',
          'rating': 3.5
        },
        {
          'id': '8',
          'name': 'Henry',
          'description':
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit,\n sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\n Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris\n nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\n cillum dolore eu fugiat nulla pariatur.',
          'rating': 3.0
        }
      ]
    };

    // TODO: implement build
    return Scaffold(
      body: Container(
        height: height * 1,
        width: width * 1,
        child: Column(
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
                      child: Image.network(
                        'https://achievexsolutions.in/current_work/eatiano/$image',
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
                        backgroundColor: const Color.fromRGBO(161, 218, 46, 1),
                        child: Text(
                          rating,
                          // textScaleFactor: textScale,
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
                      onTap: () => Navigator.of(context).pop(),
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
                              // textScaleFactor: textScale,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25),
                            ),
                            Text(
                              type,
                              // textScaleFactor: textScale,
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
                                      // textScaleFactor: textScale,
                                      style: const TextStyle(
                                          color: Colors.greenAccent),
                                    ),
                                    Text(
                                      '₹',
                                      // textScaleFactor: textScale,
                                      style: const TextStyle(
                                          color: Colors.greenAccent),
                                    ),
                                    Text(
                                      '₹',
                                      // textScaleFactor: textScale,
                                      style: const TextStyle(
                                          color: Colors.greenAccent),
                                    ),
                                    Text(
                                      '₹',
                                      // textScaleFactor: textScale,
                                      style:
                                          const TextStyle(color: Colors.white),
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
            Container(
                width: width * 0.9,
                height: height * 0.35,
                // color: Colors.purpleAccent,
                padding:
                    EdgeInsets.only(left: width * 0.02, right: width * 0.02),
                child: ListView.builder(
                    itemBuilder: (context, index) => Reviews(
                          _reviews['data'][index]['name'],
                          _reviews['data'][index]['description'],
                          _reviews['data'][index]['rating'],
                        ),
                    itemCount: 5)),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () => Navigator.of(context)
                            .pushNamed('/post-review', arguments: {
                          'id': id,
                          'name': name,
                          'type': type,
                          'rating': rating
                        }),
                    child: Text(
                      'Write A Review',
                      // textScaleFactor: textScale,
                      style: const TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    )),
              ],
            ),
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
                        // textScaleFactor: textScale,
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
                          // textScaleFactor: textScale,
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
                        // textScaleFactor: textScale,
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
    );
  }
}
