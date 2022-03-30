import 'package:flutter/material.dart';
import '../../widgets/restaurant/pageController/cart.dart';
import '../../widgets/restaurant/pageController/notifyBell.dart';
import '../../widgets/restaurant/pageController/dessert.dart';
import '../../widgets/restaurant/pageController/sideDish.dart';
import '../../widgets/restaurant/pageController/mainDish.dart';
import '../../widgets/restaurant/pageController/soup.dart';
import 'package:provider/provider.dart';
import '../../model/restaurantProducts/restaurantProductProvider.dart';

class PageViewScreen extends StatefulWidget {
  PageViewScreenState createState() => PageViewScreenState();
  final int id;
  final String name;
  final String type;
  final String rating;
  final String image;
  final String numberOfRatings;

  PageViewScreen(this.id, this.name, this.type, this.rating, this.image,
      this.numberOfRatings);
}

class PageViewScreenState extends State<PageViewScreen> {
  var counter = 0;
  PageController pageController = PageController(initialPage: 0);
  int pageChanged = 0;
  List<dynamic> categoryTemp = [];
  bool isLoading = true;
  List<dynamic> menuTitle = [];

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<RestaurantProductProvider>(context, listen: false)
        .fetchCategory(widget.id.toString())
        .then((_) {
      setState(() {
        menuTitle =
            Provider.of<RestaurantProductProvider>(context, listen: false)
                .category;
        isLoading = false;
        print('Menus $menuTitle');
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textScale = MediaQuery.of(context).textScaleFactor * 1.5;
    final argument =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    String category = menuTitle[counter];

    print('Category $category');

    // final List<String> menuTitle = [
    //   'Side Dish',
    //   'Soup',
    //   'Dessert',
    //   'Main Dishes'
    // ];

    // late var pageChanged;

    // final id = argument['id'];
    // final name = argument['name'];
    // final type = argument['type'];
    // final rating = argument['rating'];
    // final image = argument["image"];
    // final numberOfRatings = argument["numberOfRatings"];

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          toolbarHeight: 120,
          elevation: 0,
          titleSpacing: 0,
          title: Stack(
            children: [
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: height * 0.15,
                    padding: EdgeInsets.only(top: height * 0.09),
                    // color: Colors.red,
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            Container(
                              width: double.infinity,
                              height: height * 0.06,
                              margin: EdgeInsets.only(left: width * 0.05),
                              // color: Colors.white,
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () => Navigator.of(context).pop(),
                                    child: Container(
                                      decoration:
                                          const BoxDecoration(boxShadow: [
                                        BoxShadow(
                                            color: Colors.black,
                                            // spreadRadius: 1,
                                            blurRadius: 10,
                                            offset: Offset(0, 0))
                                      ]),
                                      child: const CircleAvatar(
                                        radius: 15,
                                        backgroundColor: Colors.white,
                                        child: Icon(
                                          Icons.keyboard_arrow_left,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: double.infinity,
                                      margin:
                                          EdgeInsets.only(right: width * 0.12),
                                      // color: Colors.blue,
                                      child: Center(
                                        child: Text(
                                          'Menu',
                                          textScaleFactor: textScale,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: height * 0.10,
                    // color: Colors.yellow,
                    padding: EdgeInsets.only(bottom: height * 0.055),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: const BoxDecoration(boxShadow: [
                            BoxShadow(
                                color: Colors.black,
                                blurRadius: 10,
                                offset: Offset(0, 0))
                          ]),
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 15,
                            child: Padding(
                              padding: EdgeInsets.only(left: width * 0.005),
                              child: IconButton(
                                onPressed: counter != 0
                                    ? () {
                                        setState(() {
                                          counter--;
                                        });
                                        pageController.animateToPage(
                                            --pageChanged,
                                            duration:
                                                Duration(milliseconds: 250),
                                            curve: Curves.bounceIn);
                                      }
                                    : () {},
                                icon: const Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.black,
                                  size: 15,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: width * 0.1,
                        ),
                        Text(
                          menuTitle[counter],
                          // menuTitle[pageChanged],
                          textScaleFactor: textScale,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 13),
                        ),
                        SizedBox(
                          width: width * 0.1,
                        ),
                        Container(
                          decoration: const BoxDecoration(boxShadow: [
                            BoxShadow(
                                color: Colors.black,
                                blurRadius: 10,
                                offset: Offset(0, 0))
                          ]),
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 15,
                            child: Padding(
                              padding: EdgeInsets.only(right: width * 0.005),
                              child: IconButton(
                                onPressed: counter != menuTitle.length - 1
                                    ? () {
                                        setState(() {
                                          counter++;
                                          pageController.animateToPage(
                                              ++pageChanged,
                                              duration:
                                                  Duration(milliseconds: 250),
                                              curve: Curves.bounceIn);
                                        });
                                      }
                                    : () {},
                                icon: const Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.black,
                                  size: 15,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Positioned(
                left: width * 0.74,
                top: height * 0.11,
                child: Container(
                  height: height * 0.05,
                  width: width * 0.25,
                  // color: Colors.black,
                  child: Row(
                    children: [
                      Flexible(flex: 1, fit: FlexFit.tight, child: Cart()),
                      Flexible(flex: 1, fit: FlexFit.tight, child: NotifyBell())
                    ],
                  ),
                ),
              )
            ],
          )),
      // body: PageView(
      //   controller: pageController,
      //   onPageChanged: (index) {
      //     setState(() {
      //       pageChanged = index;
      //     });
      //   },
      //   children: [
      //     SideDish(id, name, type, rating, image, numberOfRatings),
      //     Soup(id, name, type, rating, image, numberOfRatings),
      //     Dessert(id, name, type, rating, image, numberOfRatings),
      //     MainDish(id, name, type, rating, image, numberOfRatings)
      //   ],
      // ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            )
          : PageView.builder(
              physics: NeverScrollableScrollPhysics(),
              controller: pageController,
              onPageChanged: (index) {
                setState(() {
                  pageChanged = index;
                });
              },
              itemBuilder: (context, index) => SideDish(
                  widget.id.toString(),
                  widget.name,
                  widget.type,
                  widget.rating,
                  widget.image,
                  widget.numberOfRatings,
                  category),
              itemCount: menuTitle.length,
            ),
    );
  }
}
