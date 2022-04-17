import 'package:eatiano_app/widgets/itemList/moreItems.dart';
import 'package:flutter/material.dart';
import '../util/curvedAppBar.dart';
import 'package:provider/provider.dart';
import '../model/cart/cart_provider.dart';
import '../model/itemDetails/itemDetailsProvider.dart';

class ItemDetails extends StatefulWidget {
  ItemDetailsState createState() => ItemDetailsState();
  final String productId;

  ItemDetails(this.productId);
}

class ItemDetailsState extends State<ItemDetails> {
  int quantity = 1;
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<ItemDetailsProvider>(context, listen: false)
        .getItemDetails(widget.productId)
        .then((_) {
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ItemDetailsProvider>(context).itemDetails;
    // final routes =
    //     ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    // final id = routes["id"];
    // final restaurantName = routes['restaurantName'];
    // final restaurantId = routes['restaurantId'];
    // final name = routes['name'];
    // final description = routes['description'];
    // final image = routes['image'];
    // final price = routes['price'];

    // final rating = routes["rating"];
    // final totalRatings = routes["totalRatings"];

    // print('Fetched Restaurant ID $restaurantId');
    // print('Fetched Restaurant Description $description');

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    bool tabLayout = width > 600;
    bool largeLayout = width > 350 && width < 600;
    // var textScale = MediaQuery.of(context).textScaleFactor * 1.2;
    //var subTitleScale = MediaQuery.of(context).textScaleFactor * 1.4;

    // TODO: implement build
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(
              color: Colors.red,
            ),
          )
        : Scaffold(
            body: !tabLayout && !largeLayout
                ? ListView(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: height * 0.38,
                            width: double.infinity,
                            // color: Colors.red,
                          ),
                          ClipPath(
                            clipper: CurvedAppBar(),
                            child: Container(
                                height: height * 0.35,
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                    color: Color.fromRGBO(58, 69, 84, 1),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black,
                                          spreadRadius: 5,
                                          blurRadius: 5,
                                          offset: Offset(0, 5))
                                    ])),
                          ),
                          Positioned(
                              top: height * 0.16,
                              left: width * 0.3,
                              child: Image.asset(
                                'assets/images/pngwing.com(5).png',
                                height: height * 0.2,
                              )),
                          Positioned(
                            top: height * 0.02,
                            child: Container(
                              width: width * 0.999,
                              height: height * 0.1,
                              // color: Colors.red,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    // onTap: () => Navigator.of(context)
                                    //     .pushReplacementNamed('/bottom-bar'),
                                    onTap: () => Navigator.of(context).pop(),
                                    child: Container(
                                      decoration:
                                          const BoxDecoration(boxShadow: [
                                        BoxShadow(
                                            color: Colors.black,
                                            // spreadRadius: 1,
                                            blurRadius: 10,
                                            offset: Offset(0, 0))
                                      ]),
                                      child: const CircleAvatar(
                                        radius: 12,
                                        backgroundColor: Colors.white,
                                        child: Icon(
                                          Icons.keyboard_arrow_left,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: width * 0.05),
                                  Text(provider['data'][0]['product_name'],
                                      // textScaleFactor: textScale,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15))
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: height * 0.1,
                            left: width * 0.45,
                            child: Text(
                              '₹ ${provider['data'][0]['product_selling_price']}',
                              // textScaleFactor: textScale,
                              style: const TextStyle(
                                  color: Colors.white,
                                  // fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: height * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                quantity++;
                              });
                              print(quantity);
                            },
                            child: const CircleAvatar(
                              radius: 10,
                              backgroundColor: Color.fromRGBO(58, 69, 84, 1),
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 15,
                              ),
                            ),
                          ),
                          SizedBox(width: width * 0.05),
                          Text(
                            quantity.toString(),
                            // textScaleFactor: textScale,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: width * 0.05),
                          InkWell(
                            onTap: () {
                              setState(() {
                                quantity > 0 ? quantity-- : quantity = 0;
                              });
                            },
                            child: const CircleAvatar(
                              radius: 10,
                              backgroundColor: Color.fromRGBO(58, 69, 84, 1),
                              // child: Text(
                              //   '--',
                              //   style: TextStyle(color: Colors.white),
                              // )
                              child: Icon(Icons.remove,
                                  color: Colors.white, size: 13),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height * 0.05),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: width * 0.05, right: width * 0.05),
                              child: Text(
                                provider['data'][0]['product_description'],
                                // textScaleFactor: textScale,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height * 0.04),
                      quantity > 0
                          ? InkWell(
                              onTap: () {
                                Provider.of<CartItemProvider>(context,
                                        listen: false)
                                    .addItems(
                                  // id,
                                  // name,
                                  // restaurantName,
                                  // price,
                                  // quantity,
                                  // image,
                                  // rating,
                                  // totalRatings,
                                  // restaurantId.toString()
                                  provider['data'][0]['product_id'],
                                  provider['data'][0]['product_name'],
                                  provider['data'][0]['restaurant_name'],
                                  provider['data'][0]['product_selling_price'],
                                  quantity,
                                  provider['data'][0]['product_image'],
                                  provider['data'][0]['product_rating'],
                                  provider['data'][0]['product_rating_count'],
                                  provider['data'][0]['restaurant_id']
                                      .toString(),
                                );
                              },
                              child: Container(
                                width: width * 0.5,
                                height: height * 0.075,
                                margin: EdgeInsets.only(
                                    left: width * 0.2, right: width * 0.2),
                                decoration: BoxDecoration(
                                    color:
                                        const Color.fromRGBO(168, 236, 38, 1),
                                    borderRadius: BorderRadius.circular(30),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.grey,
                                          // spreadRadius: 2,
                                          blurRadius: 5,
                                          offset: Offset(1, 2))
                                    ]),
                                child: const Center(
                                  child: Text(
                                    'Add To Cart',
                                    // textScaleFactor: textScale,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                ),
                              ),
                            )
                          : Container(
                              width: width * 0.5,
                              height: height * 0.075,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(58, 69, 84, 1),
                                borderRadius: BorderRadius.circular(30),
                                // boxShadow: const [
                                //   BoxShadow(
                                //       color: Colors.grey,
                                //       spreadRadius: 2,
                                //       blurRadius: 5,
                                //       offset: Offset(1, 2))
                                // ]
                              ),
                              child: const Center(
                                child: Text(
                                  'Add To Cart',
                                  // textScaleFactor: textScale,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ),
                            ),
                      SizedBox(height: height * 0.05),
                      Padding(
                        padding: EdgeInsets.only(left: width * 0.05),
                        child: Row(
                          children: const [
                            Expanded(
                              child: Text(
                                'Get more interested with this',
                                // textScaleFactor: textScale,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13),
                              ),
                            )
                          ],
                        ),
                      ),
                      // Expanded(child: MoreItems())
                      Container(
                        width: double.infinity,
                        height: height * 0.3,
                        // color: Colors.red,
                        child: MoreItems(),
                      )
                    ],
                  )
                : Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: tabLayout || largeLayout
                                ? height * 0.32
                                : height * 0.38,
                            width: double.infinity,
                            // color: Colors.red,
                          ),
                          ClipPath(
                            clipper: CurvedAppBar(),
                            child: Container(
                                height: tabLayout
                                    ? height * 0.28
                                    : largeLayout
                                        ? height * 0.28
                                        : height * 0.35,
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                    color: Color.fromRGBO(58, 69, 84, 1),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black,
                                          spreadRadius: 5,
                                          blurRadius: 5,
                                          offset: Offset(0, 5))
                                    ])),
                          ),
                          Positioned(
                              top: tabLayout
                                  ? height * 0.14
                                  : largeLayout
                                      ? height * 0.08
                                      : height * 0.16,
                              left: tabLayout
                                  ? height * 0.14
                                  : largeLayout
                                      ? width * 0.08
                                      : width * 0.3,
                              child: Image.asset(
                                'assets/images/pngwing.com(5).png',
                                height: tabLayout
                                    ? height * 0.4
                                    : largeLayout
                                        ? height * 0.3
                                        : height * 0.2,
                              )),
                          Positioned(
                            top: height * 0.02,
                            child: Container(
                              width:
                                  tabLayout ? double.infinity : width * 0.999,
                              height: height * 0.1,
                              // color: Colors.red,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    // onTap: () => Navigator.of(context)
                                    //     .pushReplacementNamed('/bottom-bar'),
                                    onTap: () => Navigator.of(context).pop(),
                                    child: Container(
                                      decoration:
                                          const BoxDecoration(boxShadow: [
                                        BoxShadow(
                                            color: Colors.black,
                                            // spreadRadius: 1,
                                            blurRadius: 10,
                                            offset: Offset(0, 0))
                                      ]),
                                      child: CircleAvatar(
                                        radius: tabLayout
                                            ? 30
                                            : largeLayout
                                                ? 15
                                                : 12,
                                        backgroundColor: Colors.white,
                                        child: Icon(
                                          Icons.keyboard_arrow_left,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: width * 0.05),
                                  Text(provider['data'][0]['product_name'],
                                      // textScaleFactor: textScale,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: tabLayout
                                              ? 30
                                              : largeLayout
                                                  ? 22
                                                  : 15))
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: height * 0.1,
                            left: width * 0.45,
                            child: Text(
                              '₹ ${provider['data'][0]['product_selling_price']}',
                              // textScaleFactor: textScale,
                              style: TextStyle(
                                  color: Colors.white,
                                  // fontWeight: FontWeight.bold,
                                  fontSize: tabLayout
                                      ? 25
                                      : largeLayout
                                          ? 18
                                          : 16),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: height * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                quantity++;
                              });
                              print(quantity);
                            },
                            child: const CircleAvatar(
                              radius: 10,
                              backgroundColor: Color.fromRGBO(58, 69, 84, 1),
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 15,
                              ),
                            ),
                          ),
                          SizedBox(width: width * 0.05),
                          Text(
                            quantity.toString(),
                            // textScaleFactor: textScale,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: width * 0.05),
                          InkWell(
                            onTap: () {
                              setState(() {
                                quantity > 0 ? quantity-- : quantity = 0;
                              });
                            },
                            child: const CircleAvatar(
                              radius: 10,
                              backgroundColor: Color.fromRGBO(58, 69, 84, 1),
                              // child: Text(
                              //   '--',
                              //   style: TextStyle(color: Colors.white),
                              // )
                              child: Icon(Icons.remove,
                                  color: Colors.white, size: 13),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height * 0.05),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: width * 0.05, right: width * 0.05),
                              child: Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                                // textScaleFactor: textScale,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: tabLayout
                                        ? 20
                                        : largeLayout
                                            ? 15
                                            : 12),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height * 0.04),
                      quantity > 0
                          ? InkWell(
                              onTap: () {
                                Provider.of<CartItemProvider>(context,
                                        listen: false)
                                    .addItems(
                                        provider['data'][0]['product_id'],
                                        provider['data'][0]['product_name'],
                                        provider['data'][0]['restaurant_name'],
                                        provider['data'][0]
                                            ['product_selling_price'],
                                        quantity,
                                        provider['data'][0]['product_image'],
                                        provider['data'][0]['product_rating'],
                                        provider['data'][0]
                                            ['product_rating_count'],
                                        provider['data'][0]['restaurant_id']
                                            .toString());
                              },
                              child: Container(
                                width: width * 0.5,
                                height: tabLayout || largeLayout
                                    ? height * 0.06
                                    : height * 0.075,
                                margin: EdgeInsets.only(
                                    left: width * 0.2, right: width * 0.2),
                                decoration: BoxDecoration(
                                    color:
                                        const Color.fromRGBO(168, 236, 38, 1),
                                    borderRadius: BorderRadius.circular(30),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.grey,
                                          // spreadRadius: 2,
                                          blurRadius: 5,
                                          offset: Offset(1, 2))
                                    ]),
                                child: Center(
                                  child: Text(
                                    'Add To Cart',
                                    // textScaleFactor: textScale,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: tabLayout
                                            ? 22
                                            : largeLayout
                                                ? 18
                                                : 15),
                                  ),
                                ),
                              ),
                            )
                          : Container(
                              width: width * 0.5,
                              height: tabLayout || largeLayout
                                  ? height * 0.06
                                  : height * 0.075,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(58, 69, 84, 1),
                                borderRadius: BorderRadius.circular(30),
                                // boxShadow: const [
                                //   BoxShadow(
                                //       color: Colors.grey,
                                //       spreadRadius: 2,
                                //       blurRadius: 5,
                                //       offset: Offset(1, 2))
                                // ]
                              ),
                              child: Center(
                                child: Text(
                                  'Add To Cart',
                                  // textScaleFactor: textScale,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: tabLayout
                                          ? 22
                                          : largeLayout
                                              ? 18
                                              : 15),
                                ),
                              ),
                            ),
                      SizedBox(height: height * 0.05),
                      Padding(
                        padding: EdgeInsets.only(left: width * 0.05),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Get more interested with this',
                                // textScaleFactor: textScale,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: tabLayout
                                        ? 20
                                        : largeLayout
                                            ? 16
                                            : 13),
                              ),
                            )
                          ],
                        ),
                      ),
                      // Expanded(child: MoreItems())
                      Container(
                        width: double.infinity,
                        height: height * 0.244,
                        // color: Colors.red,
                        child: MoreItems(),
                      )
                    ],
                  ));
  }
}
