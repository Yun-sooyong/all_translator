import 'package:all_translator/utils/screen_size.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        color: Colors.red,
        height: screenHeight,
        width: screenWidth,
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: screenWidth > screenWidthSize ? screenWidth * 0.1 : 0,
            vertical: screenWidth > screenWidthSize ? 5 : 0,
          ),
          color: Colors.amber,
        ),
      ),
    );
  }
}
