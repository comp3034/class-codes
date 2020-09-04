import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const MaterialColor red = MaterialColor(
    _redPrimaryValue,
    <int, Color>{
      50: Color(0xFFFBDBDD),
      100: Color(0xFFF8C9CD),
      200: Color(0xFFF4A4AB),
      300: Color(0xFFEF8089),
      400: Color(0xFFEB5C68),
      500: Color(_redPrimaryValue),
      600: Color(0xFFDA1B2D),
      700: Color(0xFFB61624),
      800: Color(0xFF7F1019),
      900: Color(0xFF5B0B12),
    },
  );
  static const int _redPrimaryValue = 0xFFE63946;

  static const MaterialColor blue = MaterialColor(
    _blueValue,
    <int, Color>{
      50: Color(0xFFD5DCEC),
      100: Color(0xFFB9C5DF),
      200: Color(0xFF9CAED3),
      300: Color(0xFF8096C6),
      400: Color(0xFF647FB9),
      500: Color(_blueValue),
      600: Color(0xFF3F588D),
      700: Color(0xFF2D3F65),
      800: Color(0xFF263554),
      900: Color(0xFF192338),
    },
  );
  static const int _blueValue = 0xFF4C69A9;
}
