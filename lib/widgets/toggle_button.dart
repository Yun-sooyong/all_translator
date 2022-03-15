import 'package:flutter/material.dart';
import 'package:all_translator/widgets/circle_button.dart';

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
          //icon: Icon(Icons.abc_outlined),
          isSelected: widget.list[0],
          color: Colors.white,
        ),
        CircleButton(
          //icon: Icon(Icons.abc_outlined),
          isSelected: widget.list[1],
          color: Colors.green,
        ),
        CircleButton(
          isSelected: widget.list[2],
          color: Colors.amber,
        ),
      ],
      isSelected: widget.list,
      selectedColor: Colors.red,
      renderBorder: false,
      fillColor: Colors.transparent,
      onPressed: (int index) {
        final isOneSelected =
            widget.list.where((element) => element).length == 1;

        if (isOneSelected && widget.list[index]) return;

        // 1. 무조건 하나 이상 선택 => 현재 사용중
        // 2. 하나도 선택을 하지 않거나 여러개 선택가능
        // 둘 중 하나를 선택 (2의 경우 번역하기 버튼에서 선택을 안했을때의 내용을 추가해줘야함(isSelect 가 모두 false 일때 추가))
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
