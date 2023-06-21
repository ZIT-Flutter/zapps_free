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
  color: Colors.white,
  borderRadius: BorderRadius.circular(defaultRadius),
  boxShadow: const [
    BoxShadow(
      color: Colors.black,
      offset: Offset(0, 2),
      blurRadius: 5.0,
    )
  ],
);

const TextStyle cardTextStyle = TextStyle(
  decoration: TextDecoration.none,
  fontSize: 25,
  color: Colors.black54,
);
