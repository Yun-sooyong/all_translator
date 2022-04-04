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
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(width: 1, color: Colors.blueGrey),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          // TODO Text 위치를 dropdown menuu 로 변경
                          Expanded(
                            child: Center(
                              child: Text('언어감지'),
                            ),
                          ),
                          Expanded(
                            child:
                                Icon(Icons.keyboard_double_arrow_right_rounded),
                          ),
                          Expanded(
                            child: Center(
                              child: Text('End'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Textfield(controller: _controller),
                  ],
                ),
              ),

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
              const SizedBox(height: 15),

              // ANCHOR toggleButtons
              CustomToggle(list: isSelected),
              const SizedBox(height: 30),
              // ANCHOR run button
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: backgroundColor),
                onPressed: () async {
                  // textfield가 비었거나 한글자만 있을 때 or toggle button 이 하나도 선택되지 않았을 때
                  _controller.text.length < 2 ||
                          //countOccurrencesUsingWhereMethod(isSelected, true) == 0
                          isSelected.where((element) => element == true).isEmpty
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
                child: const Text(
                  '번역하기',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
        // !SECTION
      ),
    );
  }
}
