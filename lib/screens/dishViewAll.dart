import 'package:eatiano_app/screens/itemDetails.dart';
import 'package:flutter/material.dart';
import '../model/popular_dishes/popular_dishes_provider.dart';
import 'package:provider/provider.dart';

class DishViewAll extends StatefulWidget {
  DishViewAllState createState() => DishViewAllState();
}

class DishViewAllState extends State<DishViewAll> {
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<PopularDishesProvider>(context, listen: false)
        .fetchData()
        .then((_) {
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    final provider = Provider.of<PopularDishesProvider>(context).popularDishes;
    bool tabLayout = width > 600;
    bool largeLayout = width > 350 && width < 600;

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: const Icon(Icons.arrow_back_ios, color: Colors.red)),
        title: Text(
          'Popular Dishes',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: tabLayout
                  ? 28
                  : largeLayout
                      ? 25
                      : 20),
        ),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            )
          : SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: ListView.builder(
                  itemBuilder: (context, index) => InkWell(
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (_) => ItemDetails(provider['data']
                                        [index]['product_id']
                                    .toString()))),
                        child: Container(
                          width: double.infinity,
                          height: height * 0.15,
                          margin: EdgeInsets.only(bottom: height * 0.01),
                          padding: EdgeInsets.only(
                              left: width * 0.02,
                              top: height * 0.01,
                              right: width * 0.02,
                              bottom: height * 0.01),
                          // color: Colors.red,
                          child: Row(
                            children: [
                              Container(
                                height: double.infinity,
                                width: width * 0.32,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.green, width: 2),
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.black,
                                          blurRadius: 8,
                                          offset: Offset(1, 2))
                                    ]),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    'https://achievexsolutions.in/current_work/eatiano/${provider['data'][index]['product_image']}',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(width: width * 0.025),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    provider['data'][index]['product_name'],
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: tabLayout
                                            ? 23
                                            : largeLayout
                                                ? 18
                                                : 13),
                                  ),
                                  SizedBox(height: height * 0.004),
                                  Text(
                                      provider['data'][index]
                                          ['restaurant_name'],
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: tabLayout
                                              ? 23
                                              : largeLayout
                                                  ? 18
                                                  : 13)),
                                  SizedBox(height: height * 0.004),
                                  Text(
                                      '₹${provider['data'][index]['product_selling_price']}',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: tabLayout
                                              ? 25
                                              : largeLayout
                                                  ? 20
                                                  : 15)),
                                  SizedBox(height: height * 0.004),
                                  Row(
                                    children: [
                                      const Icon(Icons.star,
                                          color: Colors.yellow),
                                      Text(
                                        provider['data'][index]
                                                ['product_rating'] ??
                                            '4',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: tabLayout
                                                ? 22
                                                : largeLayout
                                                    ? 18
                                                    : 12),
                                      ),
                                      Text(
                                        '(${provider['data'][index]['product_rating']} Ratings)',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: tabLayout
                                                ? 22
                                                : largeLayout
                                                    ? 18
                                                    : 12),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                  itemCount: provider['data'].length),
            ),
    );
  }
}
