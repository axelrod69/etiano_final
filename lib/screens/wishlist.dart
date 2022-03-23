import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/popular_dishes/popular_dishes_provider.dart';
import 'dart:convert';

class Wishlist extends StatefulWidget {
  WishlistState createState() => WishlistState();
}

class WishlistState extends State<Wishlist> {
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<PopularDishesProvider>(context, listen: false)
        .fetchFavouriteData()
        .then((_) {
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final textScale = MediaQuery.of(context).textScaleFactor * 1.2;
    final provider =
        Provider.of<PopularDishesProvider>(context).favouriteDishes;

    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          centerTitle: true,
          leading: InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: const Icon(Icons.arrow_back_ios, color: Colors.red)),
          title: Text(
            'Wishlist',
            textScaleFactor: textScale,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          )),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            )
          : Container(
              height: height * 1,
              width: double.infinity,
              child: ListView.builder(
                itemBuilder: (context, index) => Padding(
                  padding:
                      EdgeInsets.only(left: width * 0.04, right: width * 0.04),
                  child: Container(
                      height: height * 0.12,
                      width: double.infinity,
                      // color: Colors.red,
                      margin: EdgeInsets.only(bottom: height * 0.02),
                      child: Row(
                        children: [
                          Container(
                              height: height * 0.4,
                              width: width * 0.3,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                      color:
                                          const Color.fromRGBO(192, 232, 14, 1),
                                      width: 2,
                                      style: BorderStyle.solid)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  'https://achievexsolutions.in/current_work/eatiano/${provider['data'][index]['product_image']}',
                                  fit: BoxFit.cover,
                                ),
                              )),
                          Expanded(
                            child: Container(
                              height: height * 0.4,
                              // color: Colors.red,
                              padding: EdgeInsets.only(left: width * 0.02),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                          provider['data'][index]
                                              ['product_name'],
                                          textScaleFactor: textScale,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          )),
                                      SizedBox(height: height * 0.004),
                                      Text(
                                          provider['data'][index]
                                              ['restaurant_name'],
                                          textScaleFactor: textScale,
                                          style: const TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                          )),
                                      SizedBox(height: height * 0.01),
                                      Row(
                                        children: [
                                          Text('₹',
                                              textScaleFactor: textScale,
                                              style: const TextStyle(
                                                color: Colors.red,
                                                fontWeight: FontWeight.bold,
                                              )),
                                          Text(
                                              provider['data'][index]
                                                  ['product_selling_price'],
                                              textScaleFactor: textScale,
                                              style: const TextStyle(
                                                color: Colors.red,
                                                fontWeight: FontWeight.bold,
                                              ))
                                        ],
                                      )
                                    ],
                                  ),
                                  Container(
                                    height: double.infinity,
                                    // color: Colors.amber,
                                    width: width * 0.1,
                                    child: Center(
                                        child: InkWell(
                                      onTap: () =>
                                          Provider.of<PopularDishesProvider>(
                                                  context,
                                                  listen: false)
                                              .deleteFavouriteData(
                                                  provider['data'][index]
                                                          ['product_id']
                                                      .toString()),
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                        size: height * 0.035,
                                      ),
                                    )),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      )),
                ),
                itemCount: provider['data'].length,
              ),
            ),
    );
  }

  // void deleteItem(String id) async {
  //   final response =
  //       await Provider.of<PopularDishesProvider>(context, listen: false)
  //           .deleteFavouriteData(id);
  //   var body = json.decode(response.body);
  //   if (body['status'] == 'success') {
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //       content: const Text('Item Removed from Wishlist',
  //           style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
  //       backgroundColor: Colors.white,
  //       action: SnackBarAction(
  //           label: 'Close',
  //           onPressed: () => Scaffold.of(context).hideCurrentSnackBar()),
  //     ));
  //   }
  // }
}
