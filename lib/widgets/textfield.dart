import 'package:all_translator/utils/color.dart';
import 'package:flutter/material.dart';

class Textfield extends StatefulWidget {
  final TextEditingController controller;
  const Textfield({Key? key, required this.controller}) : super(key: key);

  @override
  State<Textfield> createState() => _TextfieldState();
}

class _TextfieldState extends State<Textfield> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      keyboardType: TextInputType.multiline,
      maxLines: 14,
      decoration: const InputDecoration(
        fillColor: Colors.white,
        hintText: '내용을 입력하세요.',
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
      ),
    );
  }
}
