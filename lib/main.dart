import 'package:eatiano_app/screens/payment.dart';
import 'package:eatiano_app/screens/log_in.dart';
import 'package:eatiano_app/screens/restaurant_screen/reviewScreen.dart';
import 'package:flutter/material.dart';
import './screens/sign_in.dart';
import './screens/sign_up.dart';
import './screens/otp_screen.dart';
import './screens/home.dart';
import './screens/menu.dart';
import './screens/profile.dart';
import './screens/moms_genie.dart';
import './widgets/home/bottom_navigation.dart';
import 'screens/about_us.dart';
import 'screens/itemDetails.dart';
import 'screens/moms_genie_view_all.dart';
import 'screens/restaurant_screen/restaurant_screen.dart';
import 'screens/restaurant_screen/pageViewScreen.dart';
import './widgets/restaurant/postReview.dart';
import './screens/inbox.dart';
import './screens/notificationScreen.dart';
import './screens/order_screen/pageViewScreenOrder.dart';
import './screens/reviews.dart';
import './screens/refer_screen.dart';
import './screens/membership.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import './model/popular_dishes/popular_dishes_provider.dart';
import './screens/cartScreen.dart';
import './model/cart/cart_provider.dart';
import './screens/cartDetailScreen.dart';
import './screens/payment.dart';
import './model/location/location.dart';
import './screens/device_location_screen.dart';
import './screens/changeLocation.dart';
import './model/network_utils/authentication.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './model/blogs/blogs_provider.dart';
import './model/popularRestaurants/popularRestaurantProvider.dart';
import './screens/searchScreen.dart';
import './model/membership/membership.dart';
import './screens/forgotPassword.dart';
import './screens/changePassword.dart';
import './screens/wishlist.dart';
import './screens/couponScreen.dart';
import './model/coupon/couponProvider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  bool isAuth = false;

  @override
  void initState() {
    _checkIfLoggedIn();
    super.initState();
  }

  void _checkIfLoggedIn() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    print(token);
    if (token != null) {
      setState(() {
        isAuth = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => PopularRestaurantProvider()),
        ChangeNotifierProvider(create: (context) => BlogsProvider()),
        ChangeNotifierProvider(create: (context) => Network()),
        ChangeNotifierProvider(create: (context) => PopularDishesProvider()),
        ChangeNotifierProvider(create: (context) => CartItemProvider()),
        ChangeNotifierProvider(create: (context) => LocationProvider()),
        ChangeNotifierProvider(create: (context) => MembershipProvider()),
        ChangeNotifierProvider(create: (context) => CouponProvider())
      ],
      builder: (context, child) {
        final provider = Provider.of<LocationProvider>(context).loading;
        // final authProvider = Provider.of<Network>(context).checkIfLoggedIn;
        // final authToken = Provider.of<Network>(context).authToken;
        // final authToken = Provider.of<Network>(context).auth;
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              scaffoldBackgroundColor: const Color.fromRGBO(25, 29, 33, 1),
              primaryColor: const Color.fromRGBO(252, 17, 17, 1)),
          // home: LoginPage(),
          // home: provider == true ? DeviceLocationPage() : BottomNavigation(),
          // home: authProvider == false
          //     ? SignIn()
          //     : (provider == true)
          //         ? DeviceLocationPage()
          //         : BottomNavigation(),
          // home: !isAuth ? SignIn() : BottomNavigation(),
          home: isAuth ? BottomNavigation() : SignIn(),
          routes: {
            '/sign-in': (context) => SignIn(),
            '/sign-up': (context) => SignUp(),
            '/forgot-password': (context) => ForgotPassword(),
            '/change-password': (context) => ChangePassword(),
            '/otp-screen': (context) => OTP(),
            '/bottom-bar': (context) => BottomNavigation(),
            '/home-screen': (context) => HomeScreen(),
            '/menu-screen': (context) => Menu(),
            '/profile-screen': (context) => Profile(),
            '/moms-genie-screen': (context) => MomsGenie(),
            '/restaurants-screen': (context) => RestaurantScreen(),
            '/page-view-screen': (context) => PageViewScreen(),
            '/review-screen': (context) => ReviewScreen(),
            '/post-review': (context) => PostReview(),
            '/inbox-screen': (context) => InboxScreen(),
            '/notification-screen': (context) => NotificationsScreen(),
            '/my-order-screen': (context) => PageViewScreenOrder(),
            '/reviews-screen': (context) => Reviews(),
            '/refer-screen': (context) => ReferScreen(),
            '/membership-screen': (context) => MembershipScreen(),
            '/moms-genie-screen-view': (context) => MomsGenieViewAll(),
            '/about-us': (context) => AboutUs(),
            '/item-details': (context) => ItemDetails(),
            '/cart-screen': (context) => CartScreen(),
            '/cart-screen-detail': (context) => CartDetailScreen(),
            '/payment-screen': (context) => PaymentScreen(),
            '/change-location': (context) => ChangeLocation(),
            '/device-location': (context) => DeviceLocationPage(),
            '/search-screen': (context) => SearchScreen(),
            '/wishlist-screen': (context) => Wishlist(),
            '/coupon-screen': (context) => CouponScreen()
          },
        );
      },
    );
  }
}
