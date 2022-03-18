import 'package:flutter/material.dart';
import 'package:all_translator/widgets/circle_button.dart';
import 'package:all_translator/utils/color.dart';

class CustomToggle extends StatefulWidget {
  final List<bool> list;

  const CustomToggle({Key? key, required this.list}) : super(key: key);

  @override
  State<CustomToggle> createState() => _ToggleButtonsState();
}

class _ToggleButtonsState extends State<CustomToggle> {
  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      children: [
        CircleButton(
          image: googleLogo,
          isSelected: widget.list[0],
          color: googleColor,
        ),
        CircleButton(
          image: papagoLogo,
          isSelected: widget.list[1],
          color: papagoColor,
        ),
        CircleButton(
          image: kakaoLogo,
          isSelected: widget.list[2],
          color: kakaoColor,
        ),
      ],
      isSelected: widget.list,
      renderBorder: false,
      fillColor: Colors.transparent,
      onPressed: (int index) {
        // NOTE 번역기가 한개이상 무조건 선택되게 함
        // final isOneSelected =
        //     widget.list.where((element) => element).length == 1;

        // if (isOneSelected && widget.list[index]) return;

        setState(
          () {
            for (int buttonIndex = 0;
                buttonIndex < widget.list.length;
                buttonIndex++) {
              if (buttonIndex == index) {
                widget.list[buttonIndex] = !widget.list[index];
              }
            }
          },
        );
      },
    );
  }
}
