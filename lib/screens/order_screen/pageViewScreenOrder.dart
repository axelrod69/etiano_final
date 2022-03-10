import 'package:flutter/material.dart';
import '../../widgets/orders/cancelledOrders.dart';
import '../../widgets/orders/completedOrders.dart';
import '../../widgets/orders/cooking.dart';
import 'package:get/get.dart';

// class PageViewScreenOrder extends StatefulWidget {
//   PageViewScreenOrderState createState() => PageViewScreenOrderState();
// }

// class PageViewScreenOrderState extends State<PageViewScreenOrder>
//     with SingleTickerProviderStateMixin {
//   // PageController pageController = PageController(initialPage: 2);
//   late TabController _tabController;
//   int pageChanged = 2;

//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//     final height = MediaQuery.of(context).size.height;
//     final textScale = MediaQuery.of(context).textScaleFactor * 1.2;

//     // TODO: implement build
//     return Scaffold(
//       appBar: AppBar(
//           toolbarHeight: 100,
//           // leading: const Icon(Icons.arrow_back_ios, color: Colors.red),
//           backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//           // backgroundColor: Colors.yellow,
//           elevation: 0,
//           title: Column(
//             children: [
//               Row(
//                 children: [
//                   const Icon(Icons.arrow_back_ios, color: Colors.red),
//                   Padding(
//                     padding: EdgeInsets.only(left: width * 0.27),
//                     child: Text(
//                       'My Orders',
//                       textScaleFactor: textScale,
//                       style: const TextStyle(
//                           color: Colors.white, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: height * 0.02),
//               Container(
//                 width: double.infinity,
//                 height: height * 0.055,
//                 padding: EdgeInsets.only(top: height * 0.015),
//                 // color: Colors.red,
//                 child: Row(
//                   // crossAxisAlignment: CrossAxisAlignment.end,
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     TextButton(
//                       onPressed: () {
//                         pageController.animateToPage(++pageChanged,
//                             duration: const Duration(milliseconds: 250),
//                             curve: Curves.bounceIn);
//                       },
//                       child: pageChanged == 0
//                           ? const Text('Cancelled Orders',
//                               style:
//                                   TextStyle(color: Colors.white, fontSize: 15))
//                           : const Text('Cancelled Orders',
//                               style:
//                                   TextStyle(color: Colors.grey, fontSize: 15)),
//                     ),
//                     TextButton(
//                       onPressed: () {
//                         pageController.animateToPage(++pageChanged,
//                             duration: const Duration(milliseconds: 250),
//                             curve: Curves.bounceIn);
//                       },
//                       child: pageChanged == 1
//                           ? const Text('Completed Orders',
//                               style:
//                                   TextStyle(color: Colors.white, fontSize: 15))
//                           : const Text('Completed Orders',
//                               style:
//                                   TextStyle(color: Colors.grey, fontSize: 15)),
//                     ),
//                     TextButton(
//                       onPressed: () {
//                         pageController.animateToPage(++pageChanged,
//                             duration: const Duration(milliseconds: 250),
//                             curve: Curves.bounceIn);
//                       },
//                       child: pageChanged == 2
//                           ? const Text('Cooking',
//                               style:
//                                   TextStyle(color: Colors.white, fontSize: 15))
//                           : const Text('Cooking',
//                               style:
//                                   TextStyle(color: Colors.grey, fontSize: 15)),
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           )),
//       body: PageView(
//         controller: pageController,
//         onPageChanged: (index) {
//           setState(() {
//             pageChanged = index;
//           });
//         },
//         children: [CancelledOrders(), CompletedOrders(), Cooking()],
//       ),
//     );
//   }
// }
class PageViewScreenOrder extends StatefulWidget {
  PageViewScreenOrderState createState() => PageViewScreenOrderState();
}

class PageViewScreenOrderState extends State<PageViewScreenOrder>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    tabController.addListener(() {
      setState(() {});
    });
  }

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
          padding: EdgeInsets.only(left: width * 0.17),
          child: Text('My Orders',
              textScaleFactor: textScale,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold)),
        ),
        bottom: TabBar(
          controller: tabController,
          indicatorColor: Colors.white,
          tabs: const [
            // Tab(
            //   text: 'Cancelled Orders',
            // ),

            Tab(
              text: 'Cooking',
            ),
            Tab(
              text: 'Completed Orders',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          // CancelledOrders(),
          Cooking(),
          CompletedOrders()
        ],
      ),
    );
  }
}
