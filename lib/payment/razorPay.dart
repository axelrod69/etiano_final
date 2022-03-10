import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/cart/cart_provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RazorpayGateWay extends StatefulWidget {
  RazorpayGateWayState createState() => RazorpayGateWayState();
  final double checkOutAmount;

  RazorpayGateWay(this.checkOutAmount);
}

class RazorpayGateWayState extends State<RazorpayGateWay> {
  late Razorpay razorpay;
  // double amount = widget.checkOutAmount;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    razorpay = Razorpay();
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void openCheckOut() async {
    var options = {
      'key': 'rzp_test_Y6HLJNhTBmNio8',
      'amount': widget.checkOutAmount * 100,
      'name': 'Eatiano Order',
      // 'description': 'Fine T-Shirt',
      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'}
    };
    try {
      razorpay.open(options);
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
    // TODO: implement build
    throw UnimplementedError();
  }
}
