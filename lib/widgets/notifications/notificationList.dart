import 'package:flutter/material.dart';

class NotificationList extends StatefulWidget {
  NotificationListState createState() => NotificationListState();
  // final String subject;
  final String message;
  final String date;

  NotificationList(this.message, this.date);
}

class NotificationListState extends State<NotificationList> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final textScale = MediaQuery.of(context).textScaleFactor * 1.2;

    // TODO: implement build
    return Container(
      width: double.infinity,
      height: height * 0.05,
      color: Colors.transparent,
      margin: EdgeInsets.only(bottom: height * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 5,
                    backgroundColor: Colors.red,
                  ),
                  SizedBox(width: width * 0.05),
                  Text(widget.message,
                      textScaleFactor: textScale,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 10)),
                ],
              ),
              // Text(widget.date,
              //     textScaleFactor: textScale,
              //     style: const TextStyle(color: Colors.white, fontSize: 10))
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.07),
            child: Text(widget.date,
                textScaleFactor: textScale,
                style: const TextStyle(color: Colors.grey, fontSize: 12)),
          )
        ],
      ),
    );
  }
}
