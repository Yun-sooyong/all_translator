import 'dart:ui';

import 'package:flutter/material.dart';

class CircleButton extends StatefulWidget {
  final bool isSelected;
  final Color color;
  final ImageProvider? image;
  //final Icon icon;

  const CircleButton({
    Key? key,
    this.isSelected = false,
    required this.color,
    this.image,
    //required this.icon
  }) : super(key: key);

  @override
  State<CircleButton> createState() => _CircleButtonState();
}

class _CircleButtonState extends State<CircleButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.all(2),
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        border: widget.isSelected
            ? Border.all(color: widget.color, width: 2)
            : null,
        borderRadius: const BorderRadius.all(
          Radius.circular(45),
        ),
      ),
      child: CircleAvatar(
        backgroundColor: widget.color,
        backgroundImage: widget.image,
        //child: widget.icon,
      ),
    );
  }
}

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
