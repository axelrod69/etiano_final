// import 'package:eatiano_app/widgets/menu/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../model/cart/cart_provider.dart';

class Cart extends StatefulWidget {
  CartState createState() => CartState();
}

class CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final cartProvider = Provider.of<CartItemProvider>(context).cartItems;

    // TODO: implement build
    return Container(
      height: double.infinity,
      // color: Colors.deepPurple,
      child: Stack(
        children: [
          Center(child: Icon(Icons.shopping_cart, color: Colors.white)),
          cartProvider.length > 0
              ? Positioned(
                  left: width * 0.08,
                  top: height * 0.008,
                  child: Container(
                    width: 15,
                    height: 15,
                    decoration: const BoxDecoration(
                        color: Colors.red, shape: BoxShape.circle),
                    child: Center(
                      child: Text(
                          cartProvider.length > 9
                              ? '9+'
                              : cartProvider.length.toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 10)),
                    ),
                  ),
                )
              : Container(color: Colors.transparent)
        ],
      ),
    );
  }
}
