import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:all_translator/utils/color.dart';
import 'package:all_translator/widgets/textbox.dart';

class ResultScreen extends StatelessWidget {
  final String? googleText;
  final String? papagoText;
  final String? kakaoText;
  final List isSelected;

  const ResultScreen({
    Key? key,
    this.googleText,
    this.papagoText,
    this.kakaoText,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        elevation: 0,
        backgroundColor: backgroundColor,
        centerTitle: false,
        title: const Text(
          '번역 결과',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (isSelected[0])
              Textbox(
                text: googleText!,
                image: googleLogo,
              ),
            if (isSelected[1])
              Textbox(
                text: papagoText!,
                color: Colors.green,
                image: papagoLogo,
              ),
            if (isSelected[2])
              Textbox(
                text: kakaoText!,
                color: Colors.amber,
                image: kakaoLogo,
              ),
          ],
        ),
      ),
    );
  }
}
