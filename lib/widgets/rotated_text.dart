import 'package:flutter/material.dart';

class RotatedText extends StatelessWidget {
  final double angle;
  final String text;
  final TextStyle style;

  const RotatedText({Key? key, required this.angle, required this.text, required this.style}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(angle: angle, child: Text(text, style: style,));
  }
}
