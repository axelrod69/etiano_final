import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/cart/cart_provider.dart';
import 'package:expandable/expandable.dart';

class CartDetailScreen extends StatefulWidget {
  CartDetailScreenState createState() => CartDetailScreenState();
}

class CartDetailScreenState extends State<CartDetailScreen> {
  bool isClicked = false;
  bool isClickedCoupon = false;
  final _key = GlobalKey<FormState>();
  final _key2 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final textScale = MediaQuery.of(context).textScaleFactor * 1.2;
    // final route =
    //     ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    // final id = route['id'];
    // final provider = Provider.of<CartItemProvider>(context).getProductById(id);
    // final totalAmount = Provider.of<CartItemProvider>(context).itemTotal;
    final cartItems = Provider.of<CartItemProvider>(context).cartItems;

    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          leading: InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: const Icon(Icons.arrow_back_ios, color: Colors.red)),
          title: Padding(
            padding: EdgeInsets.only(left: width * 0.18),
            child: Text(
              'Order Details',
              textScaleFactor: textScale,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(left: width * 0.1),
              child: Container(
                width: double.infinity,
                margin:
                    EdgeInsets.only(top: height * 0.06, bottom: height * 0.02),
                // height: height * 0.15,
                // color: Colors.red,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image.asset(
                    //   cartItems[0].image,
                    //   height: height * 0.12,
                    // ),
                    SizedBox(width: width * 0.02),
                    Container(
                      // height: double.infinity,
                      width: width * 0.32,
                      // color: Colors.amber,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            cartItems[0].restaurantName,
                            textScaleFactor: textScale,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: height * 0.005),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              // Image.asset('assets/images/Path 8561.png'),
                              Text(
                                cartItems[0].rating,
                                textScaleFactor: textScale,
                                style: const TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 11),
                              ),
                              SizedBox(width: width * 0.02),
                              Text(
                                '(${cartItems[0].totalRatings})',
                                textScaleFactor: textScale,
                                style: const TextStyle(
                                    color: Colors.grey, fontSize: 11),
                              )
                            ],
                          ),
                          SizedBox(height: height * 0.005),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          SizedBox(height: height * 0.005),
                          Row(
                            children: [
                              Image.asset('assets/images/location-pin.png'),
                              SizedBox(width: width * 0.02),
                              Text(
                                'Address',
                                textScaleFactor: textScale,
                                style: const TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) => Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: height * 0.06,
                    color: Colors.white,
                    margin: EdgeInsets.only(
                        left: width * 0.04,
                        // top: height * 0.02,
                        right: width * 0.04),
                    padding: EdgeInsets.only(
                        left: width * 0.04, right: width * 0.04),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          // '${provider[index].name} x ${provider[index].quantity}',
                          '${cartItems[index].name} x ${cartItems[index].quantity}',
                          textScaleFactor: textScale,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                        Text(
                          '₹ ${(cartItems[index].price) * cartItems[index].quantity}',
                          textScaleFactor: textScale,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: width * 0.08, right: width * 0.08),
                    child: Divider(
                        height: height * 0.001,
                        thickness: 1,
                        color: Colors.grey),
                  )
                ],
              ),
              itemCount: cartItems.length,
            ),
            SizedBox(height: height * 0.02),
            Container(
              width: double.infinity,
              height: !isClicked ? height * 0.05 : height * 0.15,
              margin: EdgeInsets.only(left: width * 0.04, right: width * 0.04),
              padding: EdgeInsets.only(left: width * 0.04, right: width * 0.04),
              // color: Colors.amber,
              child: !isClicked
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Delivery Instructions',
                          textScaleFactor: textScale,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        ),
                        InkWell(
                            onTap: () => setState(() {
                                  isClicked = !isClicked;
                                }),
                            child: Text(
                              '+ Add Note',
                              textScaleFactor: textScale,
                              style: const TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ))
                      ],
                    )
                  : Padding(
                      padding: EdgeInsets.only(top: height * 0.01),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Delivery Instructions',
                                textScaleFactor: textScale,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12),
                              ),
                              InkWell(
                                  onTap: () => setState(() {
                                        isClicked = !isClicked;
                                      }),
                                  child: Text(
                                    '- Remove Note',
                                    textScaleFactor: textScale,
                                    style: const TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  ))
                            ],
                          ),
                          SizedBox(height: height * 0.02),
                          Form(
                            key: _key,
                            child: Container(
                                height: height * 0.1,
                                width: double.infinity,
                                padding: EdgeInsets.only(
                                    left: width * 0.02, top: height * 0.005),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: Colors.white, width: 2)),
                                child: TextFormField(
                                  keyboardType: TextInputType.multiline,
                                  maxLines: null,
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                  decoration: const InputDecoration(
                                      // label: Text(
                                      //   'Add Instructions',
                                      //   textScaleFactor: textScale,
                                      //   style: const TextStyle(
                                      //       color: Colors.white,
                                      //       fontWeight: FontWeight.bold),
                                      // ),
                                      border: InputBorder.none),
                                )),
                          ),
                        ],
                      ),
                    ),
            ),
            Padding(
              padding: EdgeInsets.only(left: width * 0.08, right: width * 0.08),
              child: Container(
                width: double.infinity,
                height: height * 0.001,
                margin:
                    EdgeInsets.only(top: height * 0.01, bottom: height * 0.01),
                color: const Color.fromRGBO(161, 218, 46, 1),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: width * 0.08, right: width * 0.08),
              child: Container(
                width: double.infinity,
                height: height * 0.1,
                // color: Colors.amber,
                padding: EdgeInsets.only(top: height * 0.015),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Add Coupon',
                          textScaleFactor: textScale,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        ),
                        InkWell(
                          onTap: () => setState(() {
                            isClickedCoupon = !isClickedCoupon;
                          }),
                          child: Text(
                            !isClickedCoupon ? 'Add' : 'Remove',
                            textScaleFactor: textScale,
                            style: const TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          ),
                        )
                      ],
                    ),
                    !isClickedCoupon
                        ? SizedBox()
                        : Form(
                            key: _key2,
                            child: Container(
                                height: height * 0.05,
                                width: double.infinity,
                                padding: EdgeInsets.only(left: width * 0.02),
                                margin: EdgeInsets.only(top: height * 0.01),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: Colors.white, width: 2)),
                                child: TextFormField(
                                  // keyboardType: TextInputType.multiline,
                                  maxLines: 1,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 25),
                                  decoration: const InputDecoration(
                                      // label: Text(
                                      //   'Add Instructions',
                                      //   textScaleFactor: textScale,
                                      //   style: const TextStyle(
                                      //       color: Colors.white,
                                      //       fontWeight: FontWeight.bold),
                                      // ),
                                      border: InputBorder.none),
                                )),
                          ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: width * 0.08, right: width * 0.08),
              child: Container(
                width: double.infinity,
                height: height * 0.001,
                margin:
                    EdgeInsets.only(top: height * 0.01, bottom: height * 0.01),
                color: const Color.fromRGBO(161, 218, 46, 1),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: width * 0.08, right: width * 0.08),
              child: Container(
                width: double.infinity,
                // height: height * 0.1,
                margin:
                    EdgeInsets.only(top: height * 0.01, bottom: height * 0.01),
                // color: Colors.amber,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Sub Total',
                          textScaleFactor: textScale,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        ),
                        Text(
                            // '₹ ${totalAmount.toString()}',
                            '₹ ${Provider.of<CartItemProvider>(context).itemAmount
                            //  - Provider.of<CartItemProvider>(context).deliveryCost
                            }',
                            textScaleFactor: textScale,
                            style: const TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 12))
                      ],
                    ),
                    SizedBox(height: height * 0.01),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Delivery Cost',
                            textScaleFactor: textScale,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12)),
                        Text(
                            '₹ ${Provider.of<CartItemProvider>(context).deliveryCost.toString()}',
                            textScaleFactor: textScale,
                            style: const TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 12))
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: width * 0.08, right: width * 0.08),
              child: Container(
                width: double.infinity,
                height: height * 0.001,
                margin:
                    EdgeInsets.only(top: height * 0.01, bottom: height * 0.01),
                color: const Color.fromRGBO(161, 218, 46, 1),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: width * 0.08, right: width * 0.08),
              child: Container(
                width: double.infinity,
                // height: height * 0.05,
                margin:
                    EdgeInsets.only(top: height * 0.01, bottom: height * 0.01),
                // color: Colors.yellow,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total',
                        textScaleFactor: textScale,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 12)),
                    Text(
                        '₹ ${Provider.of<CartItemProvider>(context).itemAmount + Provider.of<CartItemProvider>(context).deliveryCost}'
                            .toString(),
                        textScaleFactor: textScale,
                        style: const TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 20))
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: width * 0.08, right: width * 0.08),
              child: InkWell(
                onTap: () => Navigator.of(context).pushNamed('/payment-screen'),
                child: Container(
                  width: double.infinity,
                  height: height * 0.06,
                  margin: EdgeInsets.only(
                      top: height * 0.05, bottom: height * 0.05),
                  // color: Colors.white,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(30)),
                  child: const Center(
                    child: Text('CHECKOUT',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15)),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
