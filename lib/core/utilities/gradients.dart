import 'package:flutter/material.dart';

class Gradients {
  static const blueLinearGradient = LinearGradient(
    colors: [
      Color(0xFF2352A1), // #2352A1
      Color(0xFF18386E), // #18386E
      Color(0xFF122951), // #122951
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const currentPathGradient = LinearGradient(
    begin: Alignment(1.00, 0.00),
    end: Alignment(0.04, 0.93),
    colors: [Color(0xFFEEF4FF), Color(0xFFD0DEF8), Color(0xFFB2C7EE)],
  );
}