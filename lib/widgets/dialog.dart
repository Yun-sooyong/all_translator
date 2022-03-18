import 'package:flutter/material.dart';
import 'package:all_translator/utils/color.dart';

showValueDialog(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext ctx) {
        return AlertDialog(
          content: Row(
            children: const [
              Expanded(child: SizedBox()),
              Expanded(
                  flex: 5,
                  child: Text(
                    '내용이 너무 짧거나 번역기를 선택하지 않았습니다',
                    softWrap: true,
                  )),
              Expanded(child: SizedBox()),
            ],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          actions: [
            Align(
              alignment: Alignment.center,
              child: ConstrainedBox(
                constraints: const BoxConstraints.tightFor(width: 230),
                child: TextButton(
                  child: const Text('확인'),
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: backgroundColor,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            )
          ],
        );
      });
}
