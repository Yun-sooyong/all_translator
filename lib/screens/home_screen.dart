import 'package:all_translator/resource/google_cloud_translator.dart';
import 'package:all_translator/utils/color.dart';
import 'package:all_translator/utils/screen_size.dart';
import 'package:flutter/cupertino.dart';

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

  @override
  Widget build(BuildContext context) {
    //var screenHeight = MediaQuery.of(context).size.height;
    //var screenWidth = MediaQuery.of(context).size.width;
    String inputText = '';

    

    // bool isGoogleT = isSelected[0];
    // bool isPapagoT = isSelected[1];
    // bool isKakaoT = isSelected[2];

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
            TextField(
              controller: _controller,
              keyboardType: TextInputType.multiline,
              maxLines: 5,
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
            ToggleButtons(
              children: const [
                Icon(Icons.ac_unit),
                Icon(Icons.access_time_filled_outlined),
                Icon(Icons.zoom_in_rounded)
              ],
              onPressed: (int index) {
                setState(() {
                  // isSelected[index] = !isSelected[index];
                  // print('isSelected[$index] : ${isSelected[index]}');
                });
              },
              isSelected: ,
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                setState(() async {
                  inputText = _controller.text;
                  await getGoogleTranslation(inputText);
                });
              },
              child: const Text('번역하기'),
            )
          ],
        ),
      ),
    );
  }
}
