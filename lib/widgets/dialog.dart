import 'package:flutter/material.dart';
import 'package:all_translator/utils/color.dart';

showValueDialog(BuildContext context, String text) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext ctx) {
        return AlertDialog(
          content: Text(text),
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
