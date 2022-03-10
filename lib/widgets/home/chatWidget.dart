import 'package:flutter/material.dart';

class ChatWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: MediaQuery.of(context).size.width * 1,
      height: MediaQuery.of(context).size.height * 1,
      decoration: const BoxDecoration(
          // color: Colors.red,
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage('assets/images/3D.png'),
            fit: BoxFit.cover,
            // scale: 2.0
          )),
      // child: Center(
      //     child: Image.asset('assets/images/3Dxx.png', fit: BoxFit.contain)),
    );
  }
}
