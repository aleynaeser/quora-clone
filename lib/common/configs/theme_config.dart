import '../models/theme_model.dart';
import 'package:flutter/material.dart';
import '../constants/theme_constants.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeConfig {
  static ThemeData getTheme(bool isDarkMode) {
    final (baseTheme, colorScheme, themeColors) = _getThemeData(isDarkMode);

    return baseTheme.copyWith(
      scaffoldBackgroundColor: themeColors.themeColor1,
      textTheme: GoogleFonts.robotoTextTheme(baseTheme.textTheme),
      iconTheme: IconThemeData(color: themeColors.themeColor6),
      extensions: [
        CustomThemeModel(
          themeColor1: themeColors.themeColor1,
          themeColor2: themeColors.themeColor2,
          themeColor3: themeColors.themeColor3,
          themeColor4: themeColors.themeColor4,
          themeColor5: themeColors.themeColor5,
          themeColor6: themeColors.themeColor6,
          themeColor7: themeColors.themeColor7,
          themeColor8: themeColors.themeColor8,
          themeColor9: themeColors.themeColor9,
          themeColor10: themeColors.themeColor10,
        ),
      ],
    );
  }

  static (ThemeData, ColorScheme, ThemeColors) _getThemeData(bool isDarkMode) =>
      isDarkMode
          ? (ThemeData.dark(), ColorScheme.dark(), ThemeColors.dark)
          : (ThemeData.light(), ColorScheme.light(), ThemeColors.light);
}
