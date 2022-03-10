import 'package:all_translator/resource/google_cloud_translator.dart';
import 'package:all_translator/utils/color.dart';
import 'package:all_translator/widgets/widgets.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// TODO 가능하면 provider 사용해보기
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

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        elevation: 0,
        backgroundColor: backgroundColor,
        centerTitle: false,
        title: const Text(
          '3 translator',
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: backgroundColor,
      // SECTION body
      body: Container(
        alignment: Alignment.center,
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
            TextField(
              controller: _controller,
              keyboardType: TextInputType.multiline,
              maxLines: 10,
              decoration: const InputDecoration(
                fillColor: Colors.white,
                hintText: '내용을 입력하세요.',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: Colors.blueGrey,
                  ),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: Colors.blueGrey,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            // FIXME make 3 buttons : google / papago / kakao
            // ANCHOR toggleButtons
            ToggleButtons(
              children: [
                CircleButton(
                  //icon: Icon(Icons.abc_outlined),
                  isSelected: isSelected[0],
                  color: Colors.white,
                ),
                CircleButton(
                  //icon: Icon(Icons.abc_outlined),
                  isSelected: isSelected[1],
                  color: Colors.green,
                ),
                CircleButton(
                  isSelected: isSelected[2],
                  color: Colors.amber,
                ),
              ],
              isSelected: isSelected,
              selectedColor: Colors.red,
              renderBorder: false,
              fillColor: Colors.transparent,
              onPressed: (int index) {
                final isOneSelected =
                    isSelected.where((element) => element).length == 1;

                if (isOneSelected && isSelected[index]) return;

                setState(() {
                  for (int buttonIndex = 0;
                      buttonIndex < isSelected.length;
                      buttonIndex++) {
                    if (buttonIndex == index) {
                      isSelected[buttonIndex] = !isSelected[index];
                    }
                  }
                });
              },
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () async {
                // TODO : 번역 도달 언어 선택기능 추가
                await getGoogleTranslation(_controller.text);
              },
              child: const Text('번역하기'),
            )
          ],
        ),
      ),
      // !SECTION
    );
  }
}
