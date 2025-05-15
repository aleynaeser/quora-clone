import 'package:flutter/material.dart';

class ThemeColors {
  final Color themeColor1;
  final Color themeColor2;
  final Color themeColor3;
  final Color themeColor4;
  final Color themeColor5;
  final Color themeColor6;
  final Color themeColor7;
  final Color themeColor8;
  final Color themeColor9;

  const ThemeColors._({
    required this.themeColor1,
    required this.themeColor2,
    required this.themeColor3,
    required this.themeColor4,
    required this.themeColor5,
    required this.themeColor6,
    required this.themeColor7,
    required this.themeColor8,
    required this.themeColor9,
  });

  static const light = ThemeColors._(
    themeColor1: Color(0xFF181818),
    themeColor2: Color(0xFFFFFFFF),
    themeColor3: Color(0xFFF41724),
    themeColor4: Color(0xFF282829),
    themeColor5: Color(0xFF939598),
    themeColor6: Color(0xFF636466),
    themeColor7: Color.fromARGB(13, 0, 0, 0),
    themeColor8: Color(0xFFdee0e1),
    themeColor9: Color.fromARGB(33, 0, 0, 0),
  );

  static const dark = ThemeColors._(
    themeColor1: Color(0xFF181818),
    themeColor2: Color(0xFF262626),
    themeColor3: Color(0xFFF41724),
    themeColor4: Color(0xFFFFFFFF),
    themeColor5: Color(0xFFB1B3B6),
    themeColor6: Color(0xFFe6e7e8),
    themeColor7: Color.fromARGB(126, 255, 255, 255),
    themeColor8: Color(0xFF393839),
    themeColor9: Color.fromARGB(3, 255, 255, 255),
  );
}
