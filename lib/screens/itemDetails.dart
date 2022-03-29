import 'package:eatiano_app/widgets/itemList/moreItems.dart';
import 'package:flutter/material.dart';
import '../util/curvedAppBar.dart';
import 'package:provider/provider.dart';
import '../model/cart/cart_provider.dart';
import '../screens/home.dart';

class ItemDetails extends StatefulWidget {
  ItemDetailsState createState() => ItemDetailsState();
  // final String imageUrl;
  // final String restaurantName;
  // final double price;

  // ItemDetails(this.imageUrl, this.restaurantName, this.price);
}

class ItemDetailsState extends State<ItemDetails> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    final routes =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final id = routes["id"];
    final restaurantName = routes['restaurantName'];
    final restaurantId = routes['restaurantId'];
    final name = routes['name'];
    final description = routes['description'];
    final image = routes['image'];
    final price = routes['price'];

    final rating = routes["rating"];
    final totalRatings = routes["totalRatings"];

    // print('Fetched Restaurant ID $restaurantId');
    // print('Fetched Restaurant Description $description');

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var textScale = MediaQuery.of(context).textScaleFactor * 1.2;
    //var subTitleScale = MediaQuery.of(context).textScaleFactor * 1.4;

    // TODO: implement build
    return Scaffold(
        body: Column(
      children: [
        Stack(
          children: [
            Container(
              height: height * 0.32,
              width: double.infinity,
              // color: Colors.red,
            ),
            ClipPath(
              clipper: CurvedAppBar(),
              child: Container(
                  height: height * 0.28,
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
                top: height * 0.14,
                left: width * 0.25,
                child: Image.asset('assets/images/pngwing.com(5).png')),
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
                    SizedBox(width: width * 0.05),
                    Text(name,
                        textScaleFactor: textScale,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22))
                  ],
                ),
              ),
            ),
            Positioned(
              top: height * 0.1,
              left: width * 0.45,
              child: Text(
                '₹ $price',
                textScaleFactor: textScale,
                style: const TextStyle(
                    color: Colors.white,
                    // fontWeight: FontWeight.bold,
                    fontSize: 18),
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
              textScaleFactor: textScale,
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
                  child: Text(
                    '--',
                    style: TextStyle(color: Colors.white),
                  )),
            ),
          ],
        ),
        SizedBox(height: height * 0.05),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding:
                    EdgeInsets.only(left: width * 0.05, right: width * 0.05),
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                  textScaleFactor: textScale,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: height * 0.04),
        quantity > 0
            ? InkWell(
                onTap: () {
                  Provider.of<CartItemProvider>(context, listen: false)
                      .addItems(id, name, restaurantName, price, quantity,
                          image, rating, totalRatings, restaurantId.toString());
                },
                child: Container(
                  width: width * 0.5,
                  height: height * 0.06,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(168, 236, 38, 1),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(1, 2))
                      ]),
                  child: Center(
                    child: Text(
                      'Add To Cart',
                      textScaleFactor: textScale,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                ),
              )
            : Container(
                width: width * 0.5,
                height: height * 0.06,
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
                    textScaleFactor: textScale,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
              ),
        SizedBox(height: height * 0.03),
        Padding(
          padding: EdgeInsets.only(left: width * 0.05),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'Get more interested with this',
                  textScaleFactor: textScale,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              )
            ],
          ),
        ),
        Expanded(child: MoreItems())
      ],
    ));
  }
}
// Navigator.of(context).pushNamed('/cart-screen', arguments: {
                  //   'id': routes["id"],
                  //   // 'name': routes["name"],
                  //   // 'price': routes["price"],
                  //   // 'restaurantName': routes["restaurantName"],
                  //   'quantity': quantity,
                  // });

                  // Provider.of<CartItemProvider>(context, listen: false)
                  //     .addItems(id, name, restaurantName, price, quantity,
                  //         image, rating, totalRatings, restaurantId);
                  // print('id $id');
                  // print('quantity $quantity');
                  // print('restaurantId $restaurantId');
                  // print(Provider.of<CartItemProvider>(context, listen: false)
                  //     .cartItems);
                  // print(Provider.of<CartItemProvider>(context, listen: false)
                  //     .cartItems
                  //     .length);
                  // HomeScreen(id);



                  