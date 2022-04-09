import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/cart/cart_provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../payment/razorPay.dart';
import '../payment/payPalPayment.dart';
import '../model/location/location.dart';
import '../model/profile/profileProvider.dart';
import '../model/payment/orderId/orderIdProvider.dart';

class PaymentScreen extends StatefulWidget {
  final double discountAmount;
  final String couponCode;

  PaymentScreen(this.discountAmount, this.couponCode);

  PaymentScreenState createState() => PaymentScreenState();
}

class PaymentScreenState extends State<PaymentScreen> {
  late Razorpay razorpay;
  int _selectedValue = 1;
  bool payPalButton = true;
  bool razorPayButton = false;
  List<dynamic> orderIdList = [];
  Map<String, dynamic> ordersId = {};

  void payPal() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => PaypalPayment(
          onFinish: (number) async {
            // payment done
            print('order id: ' + number);
          },
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<ProfileProvider>(context, listen: false).fetchData();
    Provider.of<OrderIdProvider>(context, listen: false)
        .getOrderId('West Bengal', widget.couponCode);
    // print(
    //     'State ${Provider.of<LocationProvider>(context, listen: false).state}');
    // orderIdList = Provider.of<OrderIdProvider>(context, listen: false).orderId;
    // print(orderIdList);
    // orderId = Provider.of<OrderIdProvider>(context, listen: false).orderId;
    // print('ORDER ID $orderId');
    super.initState();
    // openCheckOut;
    razorpay = Razorpay();
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  Future<void> openCheckOut(amount, paymentId) async {
    // print('PAYMENT ID $paymentId');
    // print('Order ID ${orderIdList[0]}');
    var options = {
      'key': 'rzp_test_Y6HLJNhTBmNio8',
      'amount': amount * 100,
      'name': 'Eatiano Order',
      'order_id': paymentId,
      // 'description': 'Fine T-Shirt',
      'prefill': {
        'contact': Provider.of<ProfileProvider>(context, listen: false)
            .profile['phone'],
        'email': Provider.of<ProfileProvider>(context, listen: false)
            .profile['email']
      }
    };
    try {
      Provider.of<OrderIdProvider>(context, listen: false)
          .getOrderId('West Bengal', '7')
          .then((_) {
        Provider.of<OrderIdProvider>(context, listen: false).orderId;

        print('OPTIONS $options');
        razorpay.open(options);
      });
    } catch (e) {
      debugPrint('Error: e');
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    razorpay.clear();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse paymentSuccessResponse) {
    Fluttertoast.showToast(
        msg: "SUCCESS: " + paymentSuccessResponse.paymentId!,
        toastLength: Toast.LENGTH_SHORT);
    print('Payment Success Order ID ${paymentSuccessResponse.orderId}');
    print('Payment Success Payment ID ${paymentSuccessResponse.paymentId}');
    print('Payment Success Signature ${paymentSuccessResponse.signature}');
    Navigator.of(context).pushNamed('/my-order-screen');
  }

  void _handlePaymentError(PaymentFailureResponse paymentFailureResponse) {
    Fluttertoast.showToast(
        msg: "ERROR: " +
            paymentFailureResponse.code.toString() +
            "-" +
            paymentFailureResponse.message!,
        toastLength: Toast.LENGTH_SHORT);
  }

  void _handleExternalWallet(ExternalWalletResponse externalWalletResponse) {
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + externalWalletResponse.walletName!,
        toastLength: Toast.LENGTH_SHORT);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final textScale = MediaQuery.of(context).textScaleFactor * 1.2;
    final route =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final discount = route['discount'];
    final discountCode = route['code'];

    final discountCalculation =
        Provider.of<CartItemProvider>(context).itemAmount * (discount / 100);
    final withDeliveryCost =
        // (Provider.of<CartItemProvider>(context).itemAmount +
        //         Provider.of<CartItemProvider>(context).deliveryCost) -
        //     Provider.of<CartItemProvider>(context).discountCost;
        (Provider.of<CartItemProvider>(context).itemAmount +
                Provider.of<CartItemProvider>(context).deliveryCost) -
            discountCalculation;
    final paymentId = Provider.of<OrderIdProvider>(context).orderId;
    // final provider = Provider.of<ProfileProvider>(context).profile;

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          leading: InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: const Icon(Icons.arrow_back_ios, color: Colors.red)),
          title:
              // Padding(
              //   padding: EdgeInsets.only(left: width * 0.26),
              //   child: Text(
              //     'Payment',
              //     textScaleFactor: textScale,
              //     style: const TextStyle(
              //       color: Colors.white,
              //     ),
              //   ),
              // ),
              Center(
            child: Padding(
              padding: EdgeInsets.only(right: width * 0.1),
              child: Text(
                'Payment',
                textScaleFactor: textScale,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          )),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(left: width * 0.06, right: width * 0.06),
            child: Container(
              margin:
                  EdgeInsets.only(top: height * 0.07, bottom: height * 0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Delivery Address',
                      textScaleFactor: textScale,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15)),
                  SizedBox(height: height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                          flex: 3,
                          child: Text(
                              Provider.of<LocationProvider>(context).address,
                              overflow: TextOverflow.ellipsis,
                              textScaleFactor: textScale,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12))),
                      Flexible(
                        flex: 1,
                        child: InkWell(
                          onTap: () => Navigator.of(context)
                              .pushNamed('/change-location'),
                          child: Text('Change',
                              textScaleFactor: textScale,
                              style: const TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12)),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.02, right: width * 0.02),
            child: Container(
              width: double.infinity,
              height: height * 0.001,
              margin:
                  EdgeInsets.only(top: height * 0.01, bottom: height * 0.01),
              color: const Color.fromRGBO(161, 218, 46, 1),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.06, right: width * 0.06),
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: height * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Sub Total',
                      textScaleFactor: textScale,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12)),
                  Row(
                    children: [
                      Text('₹',
                          textScaleFactor: textScale,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12)),
                      SizedBox(width: width * 0.02),
                      Text(
                          // (Provider.of<CartItemProvider>(context).totalAmount -
                          //         Provider.of<CartItemProvider>(context)
                          //             .deliveryCost)
                          //     .toString(),
                          Provider.of<CartItemProvider>(context)
                              .itemAmount
                              .toString(),
                          textScaleFactor: textScale,
                          style: const TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.06, right: width * 0.06),
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: height * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Delivery Cost',
                      textScaleFactor: textScale,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12)),
                  Row(
                    children: [
                      Text('₹',
                          textScaleFactor: textScale,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12)),
                      SizedBox(width: width * 0.02),
                      Text(
                          Provider.of<CartItemProvider>(context)
                              .deliveryCost
                              .toString(),
                          textScaleFactor: textScale,
                          style: const TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.06, right: width * 0.06),
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: height * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Discount',
                      textScaleFactor: textScale,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12)),
                  Row(
                    children: [
                      Text('₹',
                          textScaleFactor: textScale,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12)),
                      SizedBox(width: width * 0.02),
                      Text(discount.toString(),
                          textScaleFactor: textScale,
                          style: const TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.02, right: width * 0.02),
            child: Container(
              width: double.infinity,
              height: height * 0.002,
              margin:
                  EdgeInsets.only(top: height * 0.01, bottom: height * 0.01),
              color: const Color.fromRGBO(161, 218, 46, 1),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.06, right: width * 0.06),
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: height * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total',
                      textScaleFactor: textScale,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12)),
                  Row(
                    children: [
                      Text('₹',
                          textScaleFactor: textScale,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12)),
                      SizedBox(width: width * 0.02),
                      Text(
                          // Provider.of<CartItemProvider>(context)
                          //     .checkOutAmount
                          //     .toString(),
                          withDeliveryCost.toString(),
                          textScaleFactor: textScale,
                          style: const TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.02, right: width * 0.02),
            child: Container(
              width: double.infinity,
              height: height * 0.001,
              margin:
                  EdgeInsets.only(top: height * 0.02, bottom: height * 0.01),
              color: const Color.fromRGBO(161, 218, 46, 1),
            ),
          ),
          SizedBox(height: height * 0.01),
          Padding(
              padding: EdgeInsets.only(left: width * 0.04, right: width * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Choose Payment Method',
                      textScaleFactor: textScale,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(height: height * 0.02),
                  Container(
                    width: double.infinity,
                    height: height * 0.05,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      children: [
                        Radio(
                            value: 1,
                            groupValue: _selectedValue,
                            onChanged: (value) {
                              setState(() {
                                _selectedValue = value as int;
                                // payPalButton = !payPalButton;
                              });
                            }),
                        Image.asset('assets/images/NoPath - Copy (3).png'),
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  Container(
                    width: double.infinity,
                    height: height * 0.05,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      children: [
                        Radio(
                            value: 2,
                            groupValue: _selectedValue,
                            onChanged: (value) {
                              setState(() {
                                _selectedValue = value as int;
                                // razorPayButton
                              });
                            }),
                        Image.asset(
                          'assets/images/1896px-Razorpay_logo.svg.png',
                          width: width * 0.25,
                        ),
                      ],
                    ),
                  )
                ],
              )),
          Padding(
            padding: EdgeInsets.only(left: width * 0.08, right: width * 0.08),
            child: InkWell(
              onTap: () => _selectedValue == 1
                  ? Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) => PaypalPayment(
                          onFinish: (number) async {
                            // payment done
                            print('order id: ' + number);
                          },
                        ),
                      ),
                    )
                  : openCheckOut(
                      // Provider.of<CartItemProvider>(context, listen: false)
                      //     .checkOutAmount
                      withDeliveryCost,
                      paymentId['id']),
              // onTap: () => RazorpayGateWay(
              //     Provider.of<CartItemProvider>(context, listen: false)
              //         .checkOutAmount),
              child: Container(
                width: double.infinity,
                height: height * 0.06,
                margin:
                    EdgeInsets.only(top: height * 0.06, bottom: height * 0.01),
                // color: const Color.fromRGBO(161, 218, 46, 1),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.white, width: 1)),
                child: Center(
                  child: Text(
                    'CONFIRM',
                    textScaleFactor: textScale,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
