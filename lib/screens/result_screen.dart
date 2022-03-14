import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:all_translator/utils/color.dart';
import 'package:all_translator/widgets/widgets.dart';

class ResultScreen extends StatelessWidget {
  //final bool isGoogle;
  //final bool isPapago;
  //final bool isKakao;
  final String googleText;
  final String papagoText;
  final String kakaoText;

  const ResultScreen(
      {Key? key,
      //required this.isGoogle,
      //required this.isPapago,
      //required this.isKakao
      required this.googleText,
      required this.papagoText,
      required this.kakaoText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
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
              Textbox(text: googleText),
              Textbox(
                text: papagoText,
                color: Colors.green,
              ),
              Textbox(
                text: kakaoText,
                color: Colors.amber,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
