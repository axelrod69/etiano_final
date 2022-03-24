import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/coupon/couponProvider.dart';
import '../model/cart/cart_provider.dart';

class CouponScreen extends StatefulWidget {
  CouponScreenState createState() => CouponScreenState();
}

class CouponScreenState extends State<CouponScreen> {
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<CouponProvider>(context, listen: false)
        .fetchCoupons()
        .then((_) {
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final textScale = MediaQuery.of(context).textScaleFactor * 1.2;
    // final route =
    //     ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    // final price = route['price'];
    final provider = Provider.of<CouponProvider>(context).coupons;
    final price = Provider.of<CartItemProvider>(context).itemAmount;

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: const Icon(Icons.arrow_back_ios, color: Colors.red)),
        title: Text(
          'Available Offers',
          textScaleFactor: textScale,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            )
          : Container(
              height: height * 1,
              width: width * 1,
              padding: EdgeInsets.only(
                  left: width * 0.04, top: height * 0.04, right: width * 0.04),
              child: ListView.builder(
                itemBuilder: (context, index) =>
                    // double.parse(price) >=
                    price >= double.parse(provider['data'][index]['condition'])
                        ? InkWell(
                            onTap: () {
                              Provider.of<CouponProvider>(context,
                                      listen: false)
                                  .selectedCoupon(
                                      provider['data'][index]['coupon_code'],
                                      double.parse(
                                          provider['data'][index]['discount']));
                              // Navigator.of(context)
                              //     .pushNamed('/cart-screen-detail');
                            },
                            child: Container(
                              width: width * 0.6,
                              height: height * 0.08,
                              margin: EdgeInsets.only(bottom: height * 0.025),
                              padding: EdgeInsets.only(
                                  left: width * 0.04, top: height * 0.005),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.black,
                                        offset: Offset(0, 2),
                                        blurRadius: 8)
                                  ]),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    provider['data'][index]['coupon_code'],
                                    textScaleFactor: textScale,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Applicable on Orders of',
                                        textScaleFactor: textScale,
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      SizedBox(width: width * 0.01),
                                      Text(
                                        '₹${provider['data'][index]['condition']}',
                                        textScaleFactor: textScale,
                                        style: const TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(width: width * 0.01),
                                      Text(
                                        'or above',
                                        textScaleFactor: textScale,
                                        style:
                                            const TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Discount Value',
                                        textScaleFactor: textScale,
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(width: width * 0.01),
                                      Text(
                                        '₹${provider['data'][index]['discount']}',
                                        textScaleFactor: textScale,
                                        style: const TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        : Container(
                            width: width * 0.6,
                            height: height * 0.08,
                            margin: EdgeInsets.only(bottom: height * 0.025),
                            padding: EdgeInsets.only(
                                left: width * 0.04, top: height * 0.005),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: const Color.fromRGBO(210, 210, 206, 1),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.white,
                                      offset: Offset(0, 2),
                                      blurRadius: 5)
                                ]),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  provider['data'][index]['coupon_code'],
                                  textScaleFactor: textScale,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Applicable on Orders of',
                                      textScaleFactor: textScale,
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                    SizedBox(width: width * 0.01),
                                    Text(
                                      '₹${provider['data'][index]['condition']}',
                                      textScaleFactor: textScale,
                                      style: const TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(width: width * 0.01),
                                    Text(
                                      'or above',
                                      textScaleFactor: textScale,
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Discount Value',
                                      textScaleFactor: textScale,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(width: width * 0.01),
                                    Text(
                                      '₹${provider['data'][index]['discount']}',
                                      textScaleFactor: textScale,
                                      style: const TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                itemCount: provider['data'].length,
              ),
            ),
    );
  }
}
