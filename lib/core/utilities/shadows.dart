import 'package:flutter/material.dart';

class BoxShadows {
  static const blackShadow = BoxShadow(
    color: Colors.black26,
    offset: Offset(0, 4), // X: 4, Y: 4
    blurRadius: 4, // Blur: 4
    spreadRadius: 0, // Spread: 0
  );

  static const blueShadow = BoxShadow(
    color: Color(0x33131314),
    offset: Offset(0, 4),
    blurRadius: 4,
    spreadRadius: 0,
  );
}
