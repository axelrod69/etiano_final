import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../model/cart/cart_provider.dart';
import '../../../model/restaurantProducts/restaurantProductProvider.dart';

class SideDish extends StatefulWidget {
  SideDishState createState() => SideDishState();
  String id;
  String restaurantName;
  String type;
  String rating;
  String image;
  String numberOfRatings;
  String category;

  SideDish(this.id, this.restaurantName, this.type, this.rating, this.image,
      this.numberOfRatings, this.category);
}

class SideDishState extends State<SideDish> {
  bool isLoading = true;

  @override
  void didChangeDependencies() {
    // TODO: implement initState
    print('This is the Category ${widget.category}');
    Provider.of<RestaurantProductProvider>(context, listen: false)
        .productFilter(widget.category)
        .then((_) {
      setState(() {
        isLoading = false;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final textScale = MediaQuery.of(context).textScaleFactor * 1.2;
    // int counter = 0;
    final provider =
        Provider.of<RestaurantProductProvider>(context).productList;
    print('Provider $provider');

    // print('Category ${widget.category}');

    // final Map<String, dynamic> _sideDish = {
    //   "data": [
    //     {
    //       "id": "1",
    //       "name": "Chelo Kebab",
    //       "description":
    //           'Lorem ipsum dolor sit amet, consectetur adipiscing elit,\nsed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    //       "price": "455",
    //       "image": 'assets/images/pngwing.com(4).png'
    //     },
    //     {
    //       "id": "2",
    //       "name": "Reshmi Kebab",
    //       "description":
    //           'Lorem ipsum dolor sit amet, consectetur adipiscing elit,\nsed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    //       "price": "455",
    //       "image": 'assets/images/pngwing.com(4).png'
    //     },
    //     {
    //       "id": "3",
    //       "name": "Chicken Tandoori",
    //       "description":
    //           'Lorem ipsum dolor sit amet, consectetur adipiscing elit,\nsed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    //       "price": "455",
    //       "image": 'assets/images/pngwing.com(4).png'
    //     },
    //     {
    //       "id": "4",
    //       "name": "Butter Chicken",
    //       "description":
    //           'Lorem ipsum dolor sit amet, consectetur adipiscing elit,\nsed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    //       "price": "455",
    //       "image": 'assets/images/pngwing.com(4).png'
    //     },
    //     {
    //       "id": "5",
    //       "name": "Palak Paneer",
    //       "description":
    //           'Lorem ipsum dolor sit amet, consectetur adipiscing elit,\nsed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    //       "price": "455",
    //       "image": 'assets/images/pngwing.com(4).png'
    //     },
    //     {
    //       "id": "6",
    //       "name": "Chicken Bharta",
    //       "description":
    //           'Lorem ipsum dolor sit amet, consectetur adipiscing elit,\nsed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    //       "price": "455",
    //       "image": 'assets/images/pngwing.com(4).png'
    //     },
    //   ]
    // };

    // TODO: implement build
    return Scaffold(
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              )
            : Container(
                width: width * 1,
                height: height * 1,
                // color: Colors.red,
                padding:
                    EdgeInsets.only(left: width * 0.05, right: width * 0.05),
                // color: Colors.red,
                child: ListView.builder(
                  itemBuilder: (context, index) => InkWell(
                    onTap: () => Navigator.pushNamed(context, '/item-details',
                        arguments: {
                          'id': provider[index]["product_id"],
                          'name': provider[index]["product_name"],
                          'image': provider[index]['product_image'],
                          'price': provider[index]["product_selling_price"],
                          'restaurantName': provider[index]['restaurant_name'],
                          // 'rating': widget.rating,
                          'rating': provider[index]['product_rating'] ?? '4.8',
                          // 'totalRatings': widget.numberOfRatings
                          'totalRatings':
                              provider[index]['product_rating_count'] ?? "124"
                        }),
                    child: Container(
                      margin: EdgeInsets.only(top: height * 0.02),
                      padding: const EdgeInsets.all(5),
                      width: double.infinity,
                      height: height * 0.15,
                      // color: Colors.yellow,
                      child: Stack(
                        children: [
                          Row(
                            children: [
                              Flexible(
                                flex: 1,
                                fit: FlexFit.tight,
                                child: Container(
                                  height: double.infinity,
                                  // width: width * 0.25,
                                  decoration: const BoxDecoration(
                                      color: Color.fromRGBO(86, 87, 84, 1),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(25))),
                                  child: Center(
                                      // child: Image.asset(provider[index]["image"]),
                                      child: Image.network(
                                          'https://achievexsolutions.in/current_work/eatiano/${provider[index]['product_image']}')),
                                ),
                              ),
                              SizedBox(width: width * 0.02),
                              Flexible(
                                flex: 3,
                                fit: FlexFit.tight,
                                child: Container(
                                  height: height * 0.2,
                                  // color: Colors.green,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            // provider[index]["name"],
                                            provider[index]['product_name'],
                                            textScaleFactor: textScale,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: height * 0.001),
                                      Expanded(
                                        child: Text(
                                          provider[index]
                                              ['product_description'],
                                          textScaleFactor: textScale,
                                          style: const TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 9),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          Positioned(
                            top: height * 0.1,
                            left: width * 0.15,
                            child: Container(
                              width: width * 0.18,
                              height: height * 0.035,
                              padding: EdgeInsets.only(left: width * 0.01),
                              decoration: BoxDecoration(
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  border: Border.all(
                                      width: 2,
                                      color: const Color.fromRGBO(
                                          161, 218, 46, 1))),
                              child: Row(
                                children: [
                                  Text(
                                    '₹',
                                    textScaleFactor: textScale,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  SizedBox(width: width * 0.02),
                                  Text(
                                    // provider[index]["price"],
                                    provider[index]['product_selling_price'],
                                    textScaleFactor: textScale,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  itemCount: provider.length,
                ),
              ));
  }
}
