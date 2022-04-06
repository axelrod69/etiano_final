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
    bool tabLayout = width > 600;
    bool largeLayout = width > 350 && width < 600;
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
      height: tabLayout || largeLayout ? height * 0.35 : height * 0.4,
      padding: EdgeInsets.only(
          top: tabLayout || largeLayout ? height * 0.04 : height * 0.06),
      // color: Colors.red,
      child: Column(
        children: [
          CarouselSlider.builder(
              itemCount: _bonus.length,
              itemBuilder: (context, index, realIndex) {
                final urlImage = _bonus[index];
                return buildImage(
                    urlImage, index, context, tabLayout, largeLayout);
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
          buildIndicator(_bonus, context, tabLayout, largeLayout)
        ],
      ),
    );
  }

  Widget buildImage(urlImage, int index, BuildContext context, bool tabLayout,
          bool largeLayout) =>
      Container(
        width: MediaQuery.of(context).size.width * 0.8,
        // height: !tabLayout && !largeLayout ? MediaQuery.of(context).size.height * 0.8 : null,
        margin:
            EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.06),
        decoration: const BoxDecoration(
            // color: Colors.grey,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(urlImage, fit: BoxFit.cover)),
      );

  Widget buildIndicator(
          _bonus, BuildContext context, bool tabLayout, bool largeLayout) =>
      AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: _bonus.length,
        effect: ExpandingDotsEffect(
            dotHeight: tabLayout ? 15 : 10,
            dotWidth: tabLayout ? 15 : 10,
            activeDotColor: Colors.white,
            dotColor: Colors.red),
      );
}
