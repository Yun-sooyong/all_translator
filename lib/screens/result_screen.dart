import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:all_translator/utils/color.dart';
import 'package:all_translator/widgets/textbox.dart';

class ResultScreen extends StatelessWidget {
  //final bool isGoogle;
  //final bool isPapago;
  //final bool isKakao;
  final String? googleText;
  final String? papagoText;
  final String? kakaoText;
  final List isSelected;

  const ResultScreen({
    Key? key,
    //required this.isGoogle,
    //required this.isPapago,
    //required this.isKakao
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
        // TODO Column에서 Listview 로 변경 itemcount 는 items 를 사용
        child: Column(
          children: [
            if (isSelected[0]) Textbox(text: googleText!),
            if (isSelected[1])
              Textbox(
                text: papagoText!,
                color: Colors.green,
              ),
            if (isSelected[2])
              Textbox(
                text: kakaoText!,
                color: Colors.amber,
              ),
          ],
        ),
      ),
    );
  }
}
