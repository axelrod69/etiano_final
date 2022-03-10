import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final textScale = MediaQuery.of(context).textScaleFactor * 1.2;

    // TODO: implement build
    return Padding(
      padding: EdgeInsets.only(left: width * 0.1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Name',
            textScaleFactor: textScale,
            style: const TextStyle(
                // color: Color.fromRGBO(131, 131, 131, 1),
                color: Colors.white70,
                fontSize: 17),
          ),
          SizedBox(height: height * 0.01),
          Text(
            'Viv May',
            textScaleFactor: textScale,
            style: const TextStyle(color: Colors.white30, fontSize: 12),
          ),
          SizedBox(height: height * 0.02),
          Text(
            'Email',
            textScaleFactor: textScale,
            style: const TextStyle(
                // color: Color.fromRGBO(131, 131, 131, 1),
                color: Colors.white70,
                fontSize: 17),
          ),
          SizedBox(height: height * 0.01),
          Text(
            'siddc.8@gmail.com',
            textScaleFactor: textScale,
            style: const TextStyle(color: Colors.white30, fontSize: 12),
          ),
          SizedBox(height: height * 0.02),
          Text(
            'Mobile No',
            textScaleFactor: textScale,
            style: const TextStyle(
                // color: Color.fromRGBO(131, 131, 131, 1),
                color: Colors.white70,
                fontSize: 17),
          ),
          SizedBox(height: height * 0.01),
          Text(
            '9874137450',
            textScaleFactor: textScale,
            style: const TextStyle(color: Colors.white30, fontSize: 12),
          ),
          SizedBox(height: height * 0.02),
          Text(
            'Address',
            textScaleFactor: textScale,
            style: const TextStyle(
                // color: Color.fromRGBO(131, 131, 131, 1),
                color: Colors.white70,
                fontSize: 17),
          ),
          SizedBox(height: height * 0.01),
          Text(
            '48, Tarun Sengupta Sarani, Dum Dum',
            textScaleFactor: textScale,
            style: const TextStyle(color: Colors.white30, fontSize: 12),
          ),
          SizedBox(height: height * 0.02),
          Text(
            'Pincode',
            textScaleFactor: textScale,
            style: const TextStyle(
                // color: Color.fromRGBO(131, 131, 131, 1),
                color: Colors.white70,
                fontSize: 17),
          ),
          SizedBox(height: height * 0.01),
          Text(
            '700079',
            textScaleFactor: textScale,
            style: const TextStyle(color: Colors.white30, fontSize: 12),
          ),
          SizedBox(height: height * 0.02),
          Text(
            'Password',
            textScaleFactor: textScale,
            style: const TextStyle(
                // color: Color.fromRGBO(131, 131, 131, 1),
                color: Colors.white70,
                fontSize: 17),
          ),
          SizedBox(height: height * 0.01),
          Text(
            '****************',
            textScaleFactor: textScale,
            style: const TextStyle(color: Colors.white30, fontSize: 12),
          ),
          SizedBox(height: height * 0.02),
          Text(
            'Confirm Password',
            textScaleFactor: textScale,
            style: const TextStyle(
                // color: Color.fromRGBO(131, 131, 131, 1),
                color: Colors.white70,
                fontSize: 17),
          ),
          SizedBox(height: height * 0.01),
          Text(
            '****************',
            textScaleFactor: textScale,
            style: const TextStyle(color: Colors.white30, fontSize: 12),
          ),
          SizedBox(height: height * 0.02),
          Padding(
            padding: EdgeInsets.only(right: width * 0.1, bottom: height * 0.05),
            child: Container(
              width: double.infinity,
              height: height * 0.05,
              // margin: EdgeInsets.only(bottom: height * 0.05),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(color: Colors.white, width: 1)),
              child: Center(
                child: Text(
                  'Save',
                  textScaleFactor: textScale,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
    // );
  }
}
