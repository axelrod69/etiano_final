import 'package:flutter/material.dart';
import '../../widgets/restaurant/cart.dart';
import '../../widgets/restaurant/notifyBell.dart';
import './pageViewScreen.dart';
import '../../model/restaurantProducts/restaurantProductProvider.dart';
import 'package:provider/provider.dart';

class RestaurantScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final id = arguments["id"];
    final name = arguments["name"];
    final type = arguments["type"];
    final rating = arguments["rating"];
    final image = arguments["image"];
    final numberOfRatings = arguments["numberOfRatings"];
    final distance = arguments["distance"];

    double time = distance / 40;

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    bool tabLayout = width > 600;
    bool largeLayout = width > 350 && width < 600;
    final responsive = height - MediaQuery.of(context).padding.top;
    final textScale = MediaQuery.of(context).textScaleFactor * 1.2;

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
                      // child: Image.asset(
                      //   'assets/images/peter-cat-restaurant-park-street-kolkata-restaurants-2dxpzo0.png',
                      //   fit: BoxFit.cover,
                      // ),
                      child: Image.network(
                          'https://achievexsolutions.in/current_work/eatiano/$image',
                          fit: BoxFit.cover),
                    ),
                  ),
                  Positioned(
                    bottom: height * 0.01,
                    right: width * 0.01,
                    child: CircleAvatar(
                      radius: tabLayout
                          ? 52
                          : largeLayout
                              ? 35
                              : 24,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: tabLayout
                            ? 50
                            : largeLayout
                                ? 33
                                : 22,
                        backgroundColor: const Color.fromRGBO(161, 218, 46, 1),
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
                      onTap: () => Navigator.of(context).pop(),
                      child: Container(
                        decoration: const BoxDecoration(boxShadow: [
                          BoxShadow(
                              color: Colors.black,
                              // spreadRadius: 1,
                              blurRadius: 10,
                              offset: Offset(0, 0))
                        ]),
                        child: CircleAvatar(
                          radius: tabLayout ? 20 : 15,
                          backgroundColor: Colors.white,
                          child: const Icon(
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
                height: tabLayout
                    ? height * 0.1
                    : largeLayout
                        ? height * 0.07
                        : height * 0.1,
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
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: tabLayout
                                      ? 35
                                      : largeLayout
                                          ? 25
                                          : 18),
                            ),
                            Text(
                              type,
                              textScaleFactor: textScale,
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: tabLayout
                                      ? 20
                                      : largeLayout
                                          ? 12
                                          : 11),
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
              width: double.infinity,
              height: tabLayout
                  ? height * 0.2
                  : largeLayout
                      ? height * 0.1
                      : height * 0.085,
              // color: Colors.pink,
              child: Row(
                children: [
                  Flexible(
                    flex: 1,
                    fit: FlexFit.loose,
                    child: Container(
                      height: double.infinity,
                      // color: Colors.amber,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/Icon ionic-md-time (2).png',
                              height: tabLayout
                                  ? 60
                                  : largeLayout
                                      ? 40
                                      : 30,
                              width: tabLayout
                                  ? 60
                                  : largeLayout
                                      ? 40
                                      : 30,
                            ),
                            Text(
                              '${time.toStringAsFixed(1)} hr',
                              textScaleFactor: textScale,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: tabLayout
                                      ? 15
                                      : largeLayout
                                          ? 11
                                          : 8),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  //  'assets/images/Icon material-location-on.png',
                  //double.parse(distance.toStringAsFixed(1))
                  Flexible(
                    flex: 1,
                    fit: FlexFit.loose,
                    child: Container(
                      height: double.infinity,
                      // color: Colors.amber,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/Icon material-location-on.png',
                              height: tabLayout
                                  ? 60
                                  : largeLayout
                                      ? 40
                                      : 30,
                              width: tabLayout
                                  ? 60
                                  : largeLayout
                                      ? 40
                                      : 30,
                            ),
                            Text(
                              '${double.parse(distance.toStringAsFixed(1))} km',
                              textScaleFactor: textScale,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: tabLayout
                                      ? 15
                                      : largeLayout
                                          ? 11
                                          : 8),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  // 'assets/images/bbq (2).png'
                  //Delivery
                  Flexible(
                    flex: 1,
                    fit: FlexFit.loose,
                    child: Container(
                      height: double.infinity,
                      // color: Colors.amber,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/bbq (2).png',
                              height: tabLayout
                                  ? 60
                                  : largeLayout
                                      ? 40
                                      : 30,
                              width: tabLayout
                                  ? 60
                                  : largeLayout
                                      ? 40
                                      : 30,
                            ),
                            Text(
                              'Delivery',
                              textScaleFactor: textScale,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: tabLayout
                                      ? 15
                                      : largeLayout
                                          ? 11
                                          : 8),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //Adjust the height of this container when bottom bar is being put
            Expanded(
              child: Container(
                width: double.infinity,
                // color: Colors.red,
                padding:
                    EdgeInsets.only(top: height * 0.065, bottom: height * 0.07),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Tincidunt dui ut ornare lectus sit amet est. Luctus venenatis lectus magna fringilla urna porttitor rhoncus.',
                        textAlign: TextAlign.center,
                        textScaleFactor: textScale,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: tabLayout
                                ? 18
                                : largeLayout
                                    ? 12
                                    : 10),
                      ),
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
                                textScaleFactor: textScale,
                                style: TextStyle(
                                    color: Colors.red,
                                    // const Color.fromRGBO(161, 218, 46, 1),
                                    fontWeight: FontWeight.bold,
                                    fontSize: tabLayout
                                        ? 25
                                        : largeLayout
                                            ? 18
                                            : 15,
                                    shadows: const [
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
                            onTap: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                          PageViewScreen(id, name, type, rating,
                                              image, numberOfRatings)));
                              // Navigator.of(context)
                              //     .pushNamed('/page-view-screen', arguments: {
                              //   'id': id,
                              //   'name': name,
                              //   'type': type,
                              //   'rating': rating,
                              //   'image': image,
                              //   'numberOfRatings': numberOfRatings
                              // });
                              // Provider.of<RestaurantProductProvider>(context,
                              //         listen: false)
                              //     .fetchCategory(id.toString());
                            },
                            child: Container(
                              height: height * 0.05,
                              // color: Colors.green,
                              child: Center(
                                child: Text(
                                  'Menu',
                                  textScaleFactor: textScale,
                                  style: TextStyle(
                                      color:
                                          const Color.fromRGBO(161, 218, 46, 1),
                                      fontWeight: FontWeight.bold,
                                      fontSize: tabLayout
                                          ? 25
                                          : largeLayout
                                              ? 18
                                              : 15,
                                      shadows: const [
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
                          child: InkWell(
                            onTap: () => Navigator.of(context)
                                .pushNamed('/review-screen', arguments: {
                              'id': id,
                              'name': name,
                              'type': type,
                              'rating': rating,
                              'image': image,
                            }),
                            child: Container(
                              height: height * 0.05,
                              // color: Colors.blue,
                              child: Center(
                                child: Text(
                                  'Review',
                                  textScaleFactor: textScale,
                                  style: TextStyle(
                                      color:
                                          const Color.fromRGBO(161, 218, 46, 1),
                                      fontWeight: FontWeight.bold,
                                      fontSize: tabLayout
                                          ? 25
                                          : largeLayout
                                              ? 18
                                              : 15,
                                      shadows: const [
                                        Shadow(
                                            color: Colors.grey,
                                            blurRadius: 10,
                                            offset: Offset(0, 2))
                                      ]),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
