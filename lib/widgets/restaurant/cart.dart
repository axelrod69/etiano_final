import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/cart/cart_provider.dart';

class Cart extends StatefulWidget {
  CartState createState() => CartState();
}

class CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    bool tabLayout = width > 600;
    bool largeLayout = width > 350 && width < 600;
    final cartProvider = Provider.of<CartItemProvider>(context).cartItems;

    // TODO: implement build
    return Container(
      // color: Colors.green,
      // padding: EdgeInsets.only(top: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 50,
            width: 50,
            padding: const EdgeInsets.only(top: 15, left: 20, bottom: 10),
            // color: Colors.green,
            child: Stack(
              children: [
                Icon(Icons.shopping_cart,
                    color: Colors.white,
                    size: tabLayout
                        ? 50
                        : largeLayout
                            ? 24
                            : 20),
                cartProvider.length > 0
                    ? Positioned(
                        left: tabLayout
                            ? 20
                            : largeLayout
                                ? 15
                                : 10,
                        bottom: tabLayout
                            ? 15
                            : largeLayout
                                ? 10
                                : 14,
                        child: Container(
                          width: tabLayout
                              ? 20
                              : largeLayout
                                  ? 15
                                  : 11,
                          height: tabLayout
                              ? 20
                              : largeLayout
                                  ? 15
                                  : 11,
                          decoration: const BoxDecoration(
                              color: Colors.red, shape: BoxShape.circle),
                          child: Center(
                            child: Text('9+',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: tabLayout
                                        ? 15
                                        : largeLayout
                                            ? 10
                                            : 8)),
                          ),
                        ),
                      )
                    : Container(color: Colors.transparent),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
