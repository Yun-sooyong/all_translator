import 'package:flutter/material.dart';
import 'circle_button.dart';

class Textbox extends StatelessWidget {
  final String text;
  final Color color;

  const Textbox({Key? key, required this.text, this.color = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleButton(color: color),
          Flexible(
            fit: FlexFit.tight,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              width: 600,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              child: Text(text),
            ),
          ),
        ],
      ),
    );
  }
}
