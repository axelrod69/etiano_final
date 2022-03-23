import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/popular_dishes/popular_dishes_provider.dart';
import 'dart:convert';

class MoreItems extends StatefulWidget {
  MoreItemsState createState() => MoreItemsState();
  // final String id;

  // MoreItems(this.id);
}

class MoreItemsState extends State<MoreItems> {
  bool clicked = false;

  // void _onClicked(String id) {
  //   setState(() {
  //     clicked = !clicked;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var textScale = MediaQuery.of(context).textScaleFactor * 1.2;
    final provider = Provider.of<PopularDishesProvider>(context).popularDishes;
    // .removeWhere((key, value) => value["data"]["id"] == widget.id);
    // print(provider);

    // TODO: implement build
    return Container(
      width: double.infinity,
      // color: Colors.red,
      padding: EdgeInsets.only(
          // left: width * 0.02,
          top: height * 0.03,
          // right: width * 0.02,
          bottom: height * 0.03),
      margin: EdgeInsets.only(bottom: height * 0.05),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Stack(
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed('/item-details', arguments: {
                  'id': provider["data"][index]["product_id"],
                  'name': provider["data"][index]["product_name"],
                  'image': provider["data"][index]["product_image"],
                  'price': provider["data"][index]["product_selling_price"],
                  'restaurantName': provider["data"][index]["restaurant_name"],
                });
              },
              child: Container(
                margin:
                    EdgeInsets.only(left: width * 0.05, right: width * 0.05),
                height: height * 0.2,
                width: width * 0.22,
                // padding: EdgeInsets.only(left: width * 0.02, right: width * 0.02),
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(58, 69, 84, 1),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      provider["data"][index]["product_name"],
                      // textScaleFactor: textScale,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    ),
                    SizedBox(height: height * 0.005),
                    Text(
                      '₹ ${provider["data"][index]["product_selling_price"]}',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              right: width * 0.01, bottom: height * 0.004),
                          child: InkWell(
                            // onTap: () => _onClicked(provider["data"][index]["product_id"].toString()),
                            // onTap: () {
                            //   if (provider["data"][index]["product_id"]) {
                            //     setState(() {
                            //       clicked = !clicked;
                            //     });
                            //   }
                            // },
                            // onTap: () => Provider.of<PopularDishesProvider>(context).markAsFavourite(provider["data"][index]["product_id"].toString()),
                            onTap: () => favouriteWishlist(
                              provider["data"][index]["product_id"].toString(),
                              provider["data"][index]["restaurant_id"],
                            ),
                            child: !clicked
                                ? const Icon(Icons.favorite_border_outlined,
                                    color: Colors.white, size: 16)
                                : const Icon(Icons.favorite,
                                    color: Colors.pink, size: 16),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              left: width * 0.035,
              bottom: height * 0.077,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                // child: Image.asset(
                //   provider["data"][index]["image"],
                //   height: height * 0.08,
                //   width: width * 0.25,
                //   fit: BoxFit.cover,
                // )
                child: Image.network(
                  'https://achievexsolutions.in/current_work/eatiano/${provider["data"][index]["product_image"]}',
                  fit: BoxFit.cover,
                  height: height * 0.08,
                  width: width * 0.25,
                ),
              ),
            )
          ],
        ),
        itemCount: provider["data"].length,
      ),
      // child: Container(
      //   margin: EdgeInsets.only(left: width * 0.05, right: width * 0.05),
      //   height: height * 0.15,
      //   width: width * 0.22,
      //   color: Colors.amber,
      // ),
    );
  }

  void favouriteWishlist(String productId, String restaurantId) async {
    final response =
        await Provider.of<PopularDishesProvider>(context, listen: false)
            .postFavouriteData(productId, restaurantId);
    final res = json.decode(response.body);
    if (res['status'] == 'success') {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Product added to wishlist',
            style: TextStyle(
              color: Colors.white,
            )),
        action: SnackBarAction(
          label: 'Close',
          onPressed: () => Scaffold.of(context).hideCurrentSnackBar(),
        ),
      ));
    }
  }
}
