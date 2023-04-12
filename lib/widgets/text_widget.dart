import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String label;
  final FontWeight? fontWeight;
  final double fontSize;
  final Color? color;

  const TextWidget(
      {super.key,
      required this.label,
      this.fontWeight,
      this.color,
      this.fontSize = 18});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight ?? FontWeight.w500,
          color: color ?? Colors.white),
    );
  }
}
