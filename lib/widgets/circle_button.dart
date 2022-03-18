import 'package:flutter/material.dart';

class CircleButton extends StatefulWidget {
  final bool isSelected;
  final Color color;
  final AssetImage image;

  const CircleButton({
    Key? key,
    this.isSelected = false,
    required this.color,
    required this.image,
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
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(9),
          decoration: BoxDecoration(
            image: DecorationImage(
              scale: 0.4,
              fit: BoxFit.fill,
              image: widget.image,
            ),
            color: widget.color,
            borderRadius: const BorderRadius.all(
              Radius.circular(45),
            ),
          ),
        ),
      ),
    );
  }
}
