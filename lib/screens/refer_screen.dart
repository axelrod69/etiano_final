import 'package:flutter/material.dart';

class ReferScreen extends StatelessWidget {
  final Map<String, dynamic> _refer = {
    'data': [
      {'id': 1, 'name': 'Free Delivery'},
      {'id': 2, 'name': 'Free Food'},
      {'id': 3, 'name': 'Free Delivery'},
      {'id': 4, 'name': 'Free Food'},
      {'id': 5, 'name': 'Free Delivery'},
      {'id': 6, 'name': 'Free Food'},
      {'id': 7, 'name': 'Free Delivery'},
      {'id': 8, 'name': 'Free Food'},
      {'id': 9, 'name': 'Free Delivery'},
      {'id': 10, 'name': 'Free Food'}
    ]
  };

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final textScale = MediaQuery.of(context).textScaleFactor * 1.2;

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: InkWell(
            onTap: () =>
                Navigator.of(context).pushReplacementNamed('/bottom-bar'),
            child: const Icon(Icons.arrow_back_ios, color: Colors.red)),
        title: Padding(
          padding: EdgeInsets.only(left: width * 0.16),
          child: Text('Refer A Friend',
              textScaleFactor: textScale,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold)),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: width * 0.04,
          right: width * 0.04,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  child: Image.asset(
                    'assets/images/NoPath - Copy (14).png',
                  ),
                ),
              ],
            ),
            SizedBox(height: height * 0.05),
            Text('Refer 5 people to get',
                textScaleFactor: textScale,
                style: const TextStyle(
                  color: Color.fromRGBO(203, 218, 118, 1),
                )),
            Expanded(
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.only(bottom: height * 0.02),
                // color: Colors.red,
                padding: EdgeInsets.only(
                  left: width * 0.05,
                  top: height * 0.02,
                  right: width * 0.05,
                ),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1.2 / 2,
                      mainAxisSpacing: 25,
                      crossAxisSpacing: 35,
                      crossAxisCount: 2),
                  itemBuilder: (context, index) => Container(
                    // height: height * 0.2,
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(103, 103, 103, 1),
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black,
                              spreadRadius: 5,
                              blurRadius: 5,
                              offset: Offset(4, 0))
                        ]),
                    child: Center(
                      child: Text(_refer['data'][index]['name'],
                          textScaleFactor: textScale,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20)),
                    ),
                  ),
                  itemCount: _refer['data'].length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
