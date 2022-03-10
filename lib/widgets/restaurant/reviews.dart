import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Reviews extends StatefulWidget {
  ReviewsState createState() => ReviewsState();
  final String name;
  final String description;
  final double rating;

  Reviews(this.name, this.description, this.rating);
}

class ReviewsState extends State<Reviews> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final textScale = MediaQuery.of(context).textScaleFactor * 1.2;

    return Container(
      width: double.infinity,
      // height: height * 0.15,
      margin: EdgeInsets.only(bottom: height * 0.01),
      // color: Colors.amber,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.name,
            textScaleFactor: textScale,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: height * 0.01),
          Text(
            widget.description,
            textScaleFactor: textScale,
            style: const TextStyle(color: Colors.white, fontSize: 10),
          ),
          SizedBox(height: height * 0.01),
          RatingBar.builder(
            initialRating: widget.rating,
            minRating: 1,
            itemSize: 15,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: widget.rating.toInt(),
            // itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            // onRatingUpdate: (rating) {
            //   print(rating);
            // },
            onRatingUpdate: (rating) {},
          )
        ],
      ),
    );
  }
}
