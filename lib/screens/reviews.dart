import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/blogs/blogs_provider.dart';

class Reviews extends StatefulWidget {
  ReviewsState createState() => ReviewsState();
}

class ReviewsState extends State<Reviews> {
  bool _isLoading = true;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   Provider.of<BlogsProvider>(context).fetchData().then((_) {
  //     setState(() {
  //       _isLoading = false;
  //     });
  //   });
  // }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    Provider.of<BlogsProvider>(context).fetchData().then((_) {
      setState(() {
        _isLoading = false;
      });
    });
  }

  // final Map<String, dynamic> _reviews = {
  //   'data': [
  //     {
  //       'id': 1,
  //       'name': 'Peter Cat',
  //       'description':
  //           'Lorem ipsum dolor sit amet, consectetur adipiscing elit,\n sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\n Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat'
  //     },
  //     {
  //       'id': 2,
  //       'name': 'BBQ',
  //       'description':
  //           'Lorem ipsum dolor sit amet, consectetur adipiscing elit,\n sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\n Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat'
  //     },
  //     {
  //       'id': 3,
  //       'name': 'Chowman',
  //       'description':
  //           'Lorem ipsum dolor sit amet, consectetur adipiscing elit,\n sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\n Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat'
  //     },
  //     {
  //       'id': 4,
  //       'name': 'Food Club',
  //       'description':
  //           'Lorem ipsum dolor sit amet, consectetur adipiscing elit,\n sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\n Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat'
  //     },
  //     {
  //       'id': 5,
  //       'name': 'Bikers Club',
  //       'description':
  //           'Lorem ipsum dolor sit amet, consectetur adipiscing elit,\n sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\n Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat'
  //     },
  //     {
  //       'id': 6,
  //       'name': 'Peter Cat',
  //       'description':
  //           'Lorem ipsum dolor sit amet, consectetur adipiscing elit,\n sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\n Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat'
  //     },
  //     {
  //       'id': 7,
  //       'name': 'BBQ',
  //       'description':
  //           'Lorem ipsum dolor sit amet, consectetur adipiscing elit,\n sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\n Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat'
  //     },
  //     {
  //       'id': 8,
  //       'name': 'Chowman',
  //       'description':
  //           'Lorem ipsum dolor sit amet, consectetur adipiscing elit,\n sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\n Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat'
  //     },
  //     {
  //       'id': 9,
  //       'name': 'Food Club',
  //       'description':
  //           'Lorem ipsum dolor sit amet, consectetur adipiscing elit,\n sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\n Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat'
  //     },
  //     {
  //       'id': 10,
  //       'name': 'Bikers Club',
  //       'description':
  //           'Lorem ipsum dolor sit amet, consectetur adipiscing elit,\n sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\n Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat'
  //     }
  //   ]
  // };

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final textScale = MediaQuery.of(context).textScaleFactor * 1.2;
    final provider = Provider.of<BlogsProvider>(context).blogs;

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
            padding: EdgeInsets.only(left: width * 0.22),
            child: Text('Reviews',
                textScaleFactor: textScale,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        ),
        body: _isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              )
            : ListView.builder(
                itemBuilder: (context, index) => Container(
                  width: double.infinity,
                  height: height * 0.1,
                  margin: EdgeInsets.only(bottom: height * 0.02),
                  // color: Colors.red,
                  padding: EdgeInsets.only(left: width * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          // _reviews['data'][index]['name']
                          provider['data'][index]['blog_heading'],
                          textScaleFactor: textScale,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: height * 0.01),
                      Text(
                          //_reviews['data'][index]['description'],
                          provider['data'][index]['blog_details'],
                          textScaleFactor: textScale,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 9,
                          ))
                    ],
                  ),
                ),
                itemCount: provider['data'].length,
              ));
  }
}
