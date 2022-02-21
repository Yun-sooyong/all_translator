import 'dart:async';

import 'package:all_translator/screens/home_screen.dart';
import 'package:all_translator/utils/screen_size.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState;
    Timer(
      const Duration(milliseconds: 10000),
      () {
        Navigator.pushReplacementNamed(context, '/home');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      // FIXME Splash Screen 내용으로 변경
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 100,
              color: Colors.amber,
            ),
            Container(
              height: 100,
              color: Colors.cyan,
            ),
            Container(
              height: 100,
              color: Colors.redAccent,
            ),
          ],
        ),
      ),
    );
  }
}
