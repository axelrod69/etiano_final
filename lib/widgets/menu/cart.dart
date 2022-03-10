import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  CartState createState() => CartState();
}

class CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
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
                Icon(Icons.shopping_cart, color: Colors.white),
                Positioned(
                  left: 15,
                  bottom: 10,
                  child: Container(
                    width: 15,
                    height: 15,
                    decoration: const BoxDecoration(
                        color: Colors.red, shape: BoxShape.circle),
                    child: const Center(
                      child: Text('9+',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 10)),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
