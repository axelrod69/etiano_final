import 'package:flutter/material.dart';
import './priceWidget.dart';
import 'package:provider/provider.dart';
import '../../../model/popular_dishes/popular_dishes_provider.dart';

class PopularDishes extends StatefulWidget {
  PopularDishesState createState() => PopularDishesState();
}

class PopularDishesState extends State<PopularDishes> {
  bool _isLoading = true;

  // @override
  // void initState() {
  //   // TODO: implement didChangeDependencies
  //   super.initState();
  //   Provider.of<PopularDishesProvider>(context).fetchData().then((_) {
  //     setState(() {
  //       _isLoading = false;
  //     });
  //   });
  // }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    Provider.of<PopularDishesProvider>(context).fetchData().then((_) {
      setState(() {
        _isLoading = false;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    bool tabLayout = width > 600;
    bool largeLayout = width > 350 && width < 600;
    var textScale = MediaQuery.of(context).textScaleFactor * 1.1;
    var subTitleScale = MediaQuery.of(context).textScaleFactor * 1.4;
    final provider = Provider.of<PopularDishesProvider>(context).popularDishes;

    // print(
    //     'Provider product_selling_price ${provider['data'][0]['product_selling_price']}');
    // print('Provider product_image ${provider['data'][0]['product_image']}');
    // print('Provider product_name ${provider['data'][0]['product_name']}');
    // print('Provider product_id ${provider['data'][0]['product_id']}');
    // print('Provider restaurantName ${provider['data'][0]['restaurant_name']}');
    // print(
    //     'Provider Restaurant ID ${provider['data'][0]['restaurant_id'].toString()}');
    // print(
    //     'Provider Restaurant Description ${provider['data'][0]['product_description'].toString()}');
    // print(provider);

    // TODO: implement build
    return _isLoading == true
        ? const Center(
            child: CircularProgressIndicator(
              color: Colors.red,
            ),
          )
        : Container(
            width: double.infinity,
            height: tabLayout
                ? height * 0.32
                : tabLayout
                    ? height * 0.32
                    : height * 0.35,
            // color: Colors.red,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('/item-details', arguments: {
                    'id': provider["data"][index]["product_id"],
                    'restaurantName': provider["data"][index]
                        ["restaurant_name"],
                    'restaurantId': provider["data"][index]["restaurant_id"],
                    'name': provider["data"][index]["product_name"],
                    'description': provider["data"][index]
                        ["product_description"],
                    'image': provider["data"][index]["product_image"],
                    'price': provider["data"][index]["product_selling_price"],
                    // 'rating': provider["data"][index]["rating"],
                    'rating': "4.5",
                    // 'totalRatings': provider["data"][index]["totalRatings"]
                    'totalRatings': "124",
                  });
                  // print(provider["data"][index]["name"]);
                },
                child: Container(
                  // margin: EdgeInsets.only(right: width * 0.02),
                  padding: EdgeInsets.only(
                    // left: width * 0.02,
                    top: height * 0.001,
                    // right: width * 0.02
                  ),
                  height: double.infinity,
                  width: width * 0.42,
                  // color: Colors.red,
                  // color: Colors.yellow,
                  child: Column(
                    children: [
                      Container(
                          height: height * 0.2,
                          width: double.infinity,
                          // decoration: const BoxDecoration(
                          //     color: Colors.green,
                          //     borderRadius: BorderRadius.only(
                          //         topLeft: Radius.circular(30),
                          //         topRight: Radius.circular(30))),
                          // padding: EdgeInsets.only(top: height * 0.001),
                          // color: Colors.green,
                          child: Container(
                            margin: EdgeInsets.only(
                                left: width * 0.02, right: width * 0.02),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black,
                                      blurRadius: 5,
                                      offset: Offset(5, 2))
                                ]),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                'https://achievexsolutions.in/current_work/eatiano/${provider["data"][index]["product_image"]}',
                                fit: BoxFit.cover,
                              ),
                            ),
                          )),
                      SizedBox(height: height * 0.012),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          // height: 0.085,
                          // color: Colors.blue,
                          padding: EdgeInsets.only(left: width * 0.03),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      provider["data"][index]["product_name"],
                                      textScaleFactor: textScale,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: tabLayout
                                              ? 14
                                              : largeLayout
                                                  ? 14
                                                  : 11),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: height * 0.005),
                              Text(
                                provider["data"][index]["restaurant_name"],
                                textScaleFactor: subTitleScale,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: tabLayout
                                        ? 14
                                        : largeLayout
                                            ? 14
                                            : 10),
                              ),
                              SizedBox(height: height * 0.01),
                              Row(
                                children: [
                                  PriceWidget(provider["data"][index]
                                      ["product_selling_price"]),
                                  SizedBox(width: width * 0.01),
                                  Image.asset(
                                      'assets/images/Icon ionic-ios-star.png'),
                                  Text('4.5',
                                      // provider["data"][index]["product_rating"],
                                      textScaleFactor: subTitleScale,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 7)),
                                  Text(
                                    // '(${provider["data"][index]["product_rating_count"]})',
                                    '(124)',
                                    textScaleFactor: subTitleScale,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 7),
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
              itemCount: provider["data"].length,
            ),
          );
  }
}
