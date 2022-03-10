import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BonusOffer extends StatefulWidget {
  BonusOfferState createState() => BonusOfferState();
}

class BonusOfferState extends State<BonusOffer> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var textScale = MediaQuery.of(context).textScaleFactor;

    final List _bonus = [
      'assets/images/Bonous for You.png',
      'assets/images/Bonous for You.png',
      'assets/images/Bonous for You.png',
      'assets/images/Bonous for You.png',
      'assets/images/Bonous for You.png'
    ];

    // TODO: implement build
    return Container(
      width: width * 1,
      height: height * 0.35,
      padding: EdgeInsets.only(top: height * 0.04),
      // color: Colors.red,
      child: Column(
        children: [
          CarouselSlider.builder(
              itemCount: _bonus.length,
              itemBuilder: (context, index, realIndex) {
                final urlImage = _bonus[index];
                return buildImage(urlImage, index);
              },
              options: CarouselOptions(
                  height: MediaQuery.of(context).size.height * 0.25,
                  autoPlay: true,
                  enableInfiniteScroll: false,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                  onPageChanged: (index, reason) =>
                      setState(() => activeIndex = index))),
          SizedBox(height: height * 0.02),
          buildIndicator(_bonus)
        ],
      ),
    );
  }

  Widget buildImage(urlImage, int index) => Container(
        margin:
            EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.06),
        decoration: const BoxDecoration(
            // color: Colors.grey,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(urlImage, fit: BoxFit.cover)),
      );

  Widget buildIndicator(_bonus) => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: _bonus.length,
        effect: const ExpandingDotsEffect(
            dotHeight: 10,
            dotWidth: 10,
            activeDotColor: Colors.white,
            dotColor: Colors.red),
      );
}
