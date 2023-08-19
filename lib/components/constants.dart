import 'package:flutter/material.dart';

const double defaultRadius = 10;
const defaultSpacing = 16.0;

BoxDecoration getCardDecoration(Color? color) {
  return BoxDecoration(
    color: color ?? Colors.white,
    borderRadius: BorderRadius.circular(defaultRadius),
    boxShadow: const [
      BoxShadow(
        color: Colors.black,
        offset: Offset(0, 2),
        blurRadius: 5.0,
      )
    ],
  );
}

BoxDecoration cardDecoration = BoxDecoration(
  color: ColorPallate.white,
  borderRadius: BorderRadius.circular(defaultRadius),
  boxShadow: const [
    BoxShadow(
      color: Colors.black,
      offset: Offset(0, 2),
      blurRadius: 5.0,
    )
  ],
);

TextStyle cardTextStyle = TextStyle(
    fontSize: 35, color: ColorPallate.blue, fontWeight: FontWeight.bold);

class ColorPallate {
  static Color blue = const Color(0xFF0D1282);
  static Color white = const Color(0xFFEEEDED);
  static Color yellow = const Color(0xFFF0DE36);
  static Color red = const Color(0xFFD71313);
}
