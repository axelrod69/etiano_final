import 'package:flutter/material.dart';

class MenuSearchBar extends StatefulWidget {
  MenuSearchBarState createState() => MenuSearchBarState();
}

class MenuSearchBarState extends State<MenuSearchBar> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var textScale = MediaQuery.of(context).textScaleFactor * 1.2;

    TextEditingController _controller = TextEditingController();

    // TODO: implement build
    return Container(
      width: width * 0.9,
      height: height * 0.05,
      padding: EdgeInsets.only(
          left: width * 0.02, top: height * 0.01, right: width * 0.02),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(30)),
      child: Row(
        children: [
          const Flexible(flex: 1, child: Icon(Icons.search, size: 35)),
          SizedBox(width: width * 0.01),
          Flexible(
            flex: 9,
            child: TextField(
              controller: _controller,
              autofocus: false,
              cursorColor: Colors.grey,
              style: const TextStyle(color: Colors.grey, fontSize: 22),
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search Food',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 22,
                  )),
            ),
          )
        ],
      ),
    );
  }
}
