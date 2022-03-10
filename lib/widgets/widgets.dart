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

class CustomIcon extends StatefulWidget {
  final Icon? icon;
  final bool isSelected;
  final Color color;

  const CustomIcon(
      {Key? key,
      this.color = Colors.green,
      this.isSelected = false,
      required this.icon})
      : super(key: key);

  @override
  State<CustomIcon> createState() => _CustomIconState();
}

class _CustomIconState extends State<CustomIcon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        border: widget.isSelected
            ? Border.all(
                color: const Color(0xffC5CaE9),
              )
            : null,
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Center(
        child: Container(
          height: 32,
          width: 32,
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: const BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          child: widget.icon,
        ),
      ),
    );
  }
}
