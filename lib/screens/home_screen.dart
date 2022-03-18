import 'package:all_translator/resource/translator_methods.dart';
import 'package:all_translator/screens/result_screen.dart';
import 'package:all_translator/utils/color.dart';
import 'package:all_translator/utils/utils.dart';
import 'package:all_translator/widgets/dialog.dart';
import 'package:all_translator/widgets/textfield.dart';
import 'package:all_translator/widgets/toggle_button.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  List<bool> isSelected = [true, false, false];

  @override
  Widget build(BuildContext context) {
    //var screenHeight = MediaQuery.of(context).size.height;
    //var screenWidth = MediaQuery.of(context).size.width;

    String gText = '';
    String pText = '';
    String kText = '';

    return WillPopScope(
      onWillPop: () async {
        bool result = onWillPop();
        return await Future.value(result);
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle.light,
          elevation: 0,
          backgroundColor: backgroundColor,
          centerTitle: false,
          title: const Text(
            '번역기',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: backgroundColor,
        // SECTION body
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: foregroundColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // ANCHOR textfield
              // TODO Container Column 으로 Textfield위에 언어선택 기능 추가, 외곽선은 Container로
              Textfield(controller: _controller),

              // ANCHOR text field clear button
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  child: const Text(
                    '지우기',
                    style: TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                  onPressed: () => _controller.text = '',
                  style: TextButton.styleFrom(),
                ),
              ),
              const SizedBox(height: 30),

              // ANCHOR toggleButtons
              CustomToggle(list: isSelected),
              const SizedBox(height: 30),
              // ANCHOR run button
              // TODO toggle button 에 선택된 번역기만 작동 하게 함
              ElevatedButton(
                // _controller.text.length < 2 => alter
                // countOccurrencesUsingWhereMethod < 1 => alter
                onPressed: () async {
                  // textfield가 비었거나 한글자만 있을 때 or toggle button 이 하나도 선택되지 않았을 때
                  _controller.text.length < 2 ||
                          countOccurrencesUsingWhereMethod(isSelected, true) ==
                              0
                      ? showValueDialog(context)
                      : {
                          gText = await getGoogleTranslation(
                              _controller.text, 'ko'),
                          pText = await getPapagoTranslation(
                              text: _controller.text,
                              source: 'en',
                              target: 'ko'),
                          kText = await getKakaoTranslation(
                              text: _controller.text,
                              source: 'en',
                              target: 'kr'),
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ResultScreen(
                                isSelected: isSelected,
                                googleText: gText,
                                papagoText: pText,
                                kakaoText: kText,
                              ),
                            ),
                          )
                        };
                },
                child: const Text('번역하기'),
              )
            ],
          ),
        ),
        // !SECTION
      ),
    );
  }
}
