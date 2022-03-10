import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OfferScreen extends StatefulWidget {
  OfferScreenState createState() => OfferScreenState();
}

class OfferScreenState extends State<OfferScreen> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var textScale = MediaQuery.of(context).textScaleFactor * 1.2;

    final List _bonus = [
      'assets/images/Mask Group 1.png',
      'assets/images/Mask Group 1.png',
      'assets/images/Mask Group 1.png',
      'assets/images/Mask Group 1.png',
      'assets/images/Mask Group 1.png'
    ];

    // TODO: implement build
    return Scaffold(
        body: Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: height * 0.05),
          width: double.infinity,
          height: height * 0.3,
          // color: Colors.red,
          child: CarouselSlider.builder(
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
        ),
        SizedBox(height: height * 0.02),
        buildIndicator(_bonus),
        SizedBox(height: height * 0.06),
        Container(
          width: width * 0.8,
          height: height * 0.1,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromRGBO(58, 69, 84, 1),
              boxShadow: const [
                BoxShadow(
                    color: Color.fromRGBO(66, 67, 68, 1),
                    spreadRadius: 5,
                    blurRadius: 5)
              ]),
          child: Center(
            child: Text(
              'Buy 2 get 4 Free',
              textScaleFactor: textScale,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 23),
            ),
          ),
        ),
        SizedBox(height: height * 0.03),
        Container(
          width: width * 0.8,
          height: height * 0.1,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromRGBO(58, 69, 84, 1),
              boxShadow: const [
                BoxShadow(
                    color: Color.fromRGBO(66, 67, 68, 1),
                    spreadRadius: 5,
                    blurRadius: 5)
              ]),
          child: Center(
            child: Text(
              'Free Dine Night',
              textScaleFactor: textScale,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 23),
            ),
          ),
        ),
        SizedBox(height: height * 0.08),
        Container(
          width: width * 0.8,
          height: height * 0.065,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: Colors.white, width: 1)),
          child: Center(
            child: Text('APPLY',
                textScaleFactor: textScale,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                )),
          ),
        )
      ],
    ));
  }

  Widget buildImage(urlImage, int index) => Container(
        margin:
            EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.04),
        decoration: const BoxDecoration(
            // color: Colors.grey,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(urlImage,
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width * 0.95)),
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
