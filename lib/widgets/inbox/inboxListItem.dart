import 'package:flutter/material.dart';

class InboxListItem extends StatefulWidget {
  InboxListItemState createState() => InboxListItemState();
  final String subject;
  final String message;
  final String date;

  InboxListItem(this.subject, this.message, this.date);
}

class InboxListItemState extends State<InboxListItem> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final textScale = MediaQuery.of(context).textScaleFactor * 1.2;

    // TODO: implement build
    return Container(
      width: double.infinity,
      height: height * 0.1,
      color: Colors.transparent,
      margin: EdgeInsets.only(bottom: height * 0.02),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 5,
                    backgroundColor: Colors.red,
                  ),
                  SizedBox(width: width * 0.02),
                  Text(widget.subject,
                      textScaleFactor: textScale,
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ],
              ),
              Text(widget.date,
                  textScaleFactor: textScale,
                  style: const TextStyle(color: Colors.white, fontSize: 10))
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.04),
            child: Text(widget.message,
                textScaleFactor: textScale,
                style: const TextStyle(color: Colors.grey, fontSize: 12)),
          )
        ],
      ),
    );
  }
}
