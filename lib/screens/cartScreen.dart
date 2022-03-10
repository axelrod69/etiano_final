import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/popular_dishes/popular_dishes_provider.dart';
import '../model/cart/cart_provider.dart';

class CartScreen extends StatefulWidget {
  CartScreenState createState() => CartScreenState();
}

class CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final textScale = MediaQuery.of(context).textScaleFactor * 1.2;
    final cartProvider = Provider.of<CartItemProvider>(context).cartItems;
    final totalAmount = Provider.of<CartItemProvider>(context).totalAmount;

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        leading: InkWell(
            onTap: () =>
                Navigator.of(context).pushReplacementNamed('/bottom-bar'),
            child: const Icon(Icons.arrow_back_ios, color: Colors.red)),
        title: Padding(
          padding: EdgeInsets.only(left: width * 0.26),
          child: Text(
            'Cart',
            textScaleFactor: textScale,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: cartProvider.length > 0
          ? ListView.builder(
              itemBuilder: (context, index) => Container(
                width: double.infinity,
                height: height * 0.18,
                margin: EdgeInsets.only(bottom: height * 0.02),
                // color: Colors.red,
                padding: EdgeInsets.only(
                    left: width * 0.02,
                    top: height * 0.01,
                    right: width * 0.02),
                child: Column(
                  children: [
                    Flexible(
                      flex: 2,
                      child: Container(
                        width: double.infinity,
                        // color: Colors.amber,
                        // decoration: BoxDecoration(),
                        padding: EdgeInsets.only(top: height * 0.005),
                        child: Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Flexible(
                                  flex: 1,
                                  fit: FlexFit.loose,
                                  // child: Image.asset(
                                  //   cartProvider[index].image,
                                  //   width: width * 0.22,
                                  //   height: height * 0.1,
                                  // ),
                                  child: Image.network(
                                    'https://achievexsolutions.in/current_work/eatiano/${cartProvider[index].image}',
                                    width: width * 0.22,
                                    height: height * 0.1,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: width * 0.02),
                            Flexible(
                              flex: 3,
                              child: Container(
                                height: double.infinity,
                                // color: Colors.purple,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          cartProvider[index].restaurantName,
                                          textScaleFactor: textScale,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14),
                                        ),
                                        Container(
                                          child: Row(
                                            children: [
                                              Text(
                                                '₹',
                                                textScaleFactor: textScale,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              ),
                                              SizedBox(width: width * 0.005),
                                              Text(
                                                totalAmount.toString(),
                                                // Provider.of<CartItemProvider>(
                                                //         context)
                                                //     .totalAmount
                                                //     .toString(),
                                                textScaleFactor: textScale,
                                                style: const TextStyle(
                                                    color: Colors.red,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: height * 0.008),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Row(
                                            children: [
                                              Image.asset(
                                                  'assets/images/Path 8561.png'),
                                              // SizedBox(width: width * 0.005),
                                              Text(
                                                cartProvider[index].rating,
                                                textScaleFactor: textScale,
                                                style: const TextStyle(
                                                    color: Colors.red,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12),
                                              ),
                                              SizedBox(width: width * 0.01),
                                              Text(
                                                '(${cartProvider[index].totalRatings})',
                                                textScaleFactor: textScale,
                                                style: const TextStyle(
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12),
                                              )
                                            ],
                                          ),
                                        ),
                                        InkWell(
                                            onTap: () =>
                                                Provider.of<CartItemProvider>(
                                                        context,
                                                        listen: false)
                                                    .deleteItems(
                                                        cartProvider[index].id),
                                            child: const Icon(Icons.delete,
                                                color: Colors.red)),
                                      ],
                                    ),
                                    SizedBox(height: height * 0.01),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: width * 0.35,
                                          height: height * 0.025,
                                          // color: Colors.red,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Burger',
                                                textScaleFactor: textScale,
                                                style: const TextStyle(
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12),
                                              ),
                                              Text(
                                                'Continental',
                                                textScaleFactor: textScale,
                                                style: const TextStyle(
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12),
                                              )
                                            ],
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () => Navigator.of(context)
                                              .pushNamed('/cart-screen-detail',
                                                  arguments: {
                                                'id': cartProvider[index].id
                                              }),
                                          child: Text(
                                            'Order Details',
                                            textScaleFactor: textScale,
                                            style: const TextStyle(
                                                color: Colors.red,
                                                fontSize: 10),
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
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        width: double.infinity,
                        // color: Colors.blue,
                        child: Center(
                          child: Text(
                            'Order',
                            textScaleFactor: textScale,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              itemCount: cartProvider.length,
            )
          : Center(
              child: Container(
                width: double.infinity,
                height: height * 0.6,
                // color: Colors.red,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                        'assets/images/—Pngtree—sad face 3d render emoji_5870534.png'),
                    Text('Cart Is Empty',
                        textScaleFactor: textScale,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20))
                  ],
                ),
              ),
            ),
    );
  }
}
