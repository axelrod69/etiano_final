import 'package:flutter/material.dart';
import '../widgets/inbox/inboxListItem.dart';

class InboxScreen extends StatelessWidget {
  final Map<String, dynamic> _inbox = {
    'data': [
      {
        'id': '1',
        'subject': 'Promotions',
        'message': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
        'date': '16th Nov'
      },
      {
        'id': '2',
        'subject': 'Promotions',
        'message': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
        'date': '16th Nov'
      },
      {
        'id': '3',
        'subject': 'Promotions',
        'message': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
        'date': '16th Nov'
      },
      {
        'id': '4',
        'subject': 'Promotions',
        'message': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
        'date': '16th Nov'
      },
      {
        'id': '5',
        'subject': 'Promotions',
        'message': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
        'date': '16th Nov'
      },
      {
        'id': '6',
        'subject': 'Promotions',
        'message': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
        'date': '16th Nov'
      },
      {
        'id': '7',
        'subject': 'Promotions',
        'message': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
        'date': '16th Nov'
      },
      {
        'id': '8',
        'subject': 'Promotions',
        'message': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
        'date': '16th Nov'
      },
      {
        'id': '9',
        'subject': 'Promotions',
        'message': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
        'date': '16th Nov'
      },
      {
        'id': '10',
        'subject': 'Promotions',
        'message': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
        'date': '16th Nov'
      },
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
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          leading: InkWell(
              onTap: () =>
                  Navigator.of(context).pushReplacementNamed('/bottom-bar'),
              child: const Icon(Icons.arrow_back_ios, color: Colors.red)),
          title: Padding(
            padding: EdgeInsets.only(left: width * 0.26),
            child: Text(
              'Inbox',
              textScaleFactor: textScale,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/Hand_drawn.png'),
                  fit: BoxFit.cover)),
          child: Padding(
            padding: EdgeInsets.only(left: width * 0.1, right: height * 0.05),
            child: ListView.builder(
              itemBuilder: (context, index) => InboxListItem(
                _inbox['data'][index]['subject'],
                _inbox['data'][index]['message'],
                _inbox['data'][index]['date'],
              ),
              itemCount: _inbox['data'].length,
            ),
          ),
        ));
  }
}
