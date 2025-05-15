import 'package:flutter/material.dart';

extension ThemeExtensions on BuildContext {
  CustomThemeModel get themeColors =>
      Theme.of(this).extension<CustomThemeModel>()!;
}

@immutable
class CustomThemeModel extends ThemeExtension<CustomThemeModel> {
  final Color themeColor1;
  final Color themeColor2;
  final Color themeColor3;
  final Color themeColor4;
  final Color themeColor5;
  final Color themeColor6;
  final Color themeColor7;
  final Color themeColor8;
  final Color themeColor9;
  final Color themeColor10;

  const CustomThemeModel({
    required this.themeColor1,
    required this.themeColor2,
    required this.themeColor3,
    required this.themeColor4,
    required this.themeColor5,
    required this.themeColor6,
    required this.themeColor7,
    required this.themeColor8,
    required this.themeColor9,
    required this.themeColor10,
  });

  @override
  CustomThemeModel copyWith({
    Color? themeColor1,
    Color? themeColor2,
    Color? themeColor3,
    Color? themeColor4,
    Color? themeColor5,
    Color? themeColor6,
    Color? themeColor7,
    Color? themeColor8,
    Color? themeColor9,
    Color? themeColor10,
  }) {
    return CustomThemeModel(
      themeColor1: themeColor1 ?? this.themeColor1,
      themeColor2: themeColor2 ?? this.themeColor2,
      themeColor3: themeColor3 ?? this.themeColor3,
      themeColor4: themeColor4 ?? this.themeColor4,
      themeColor5: themeColor5 ?? this.themeColor5,
      themeColor6: themeColor6 ?? this.themeColor6,
      themeColor7: themeColor7 ?? this.themeColor7,
      themeColor8: themeColor8 ?? this.themeColor8,
      themeColor9: themeColor9 ?? this.themeColor9,
      themeColor10: themeColor10 ?? this.themeColor10,
    );
  }

  @override
  CustomThemeModel lerp(ThemeExtension<CustomThemeModel>? other, double t) {
    if (other is! CustomThemeModel) {
      return this;
    }
    return CustomThemeModel(
      themeColor1: Color.lerp(themeColor1, other.themeColor1, t)!,
      themeColor2: Color.lerp(themeColor2, other.themeColor2, t)!,
      themeColor3: Color.lerp(themeColor3, other.themeColor3, t)!,
      themeColor4: Color.lerp(themeColor4, other.themeColor4, t)!,
      themeColor5: Color.lerp(themeColor5, other.themeColor5, t)!,
      themeColor6: Color.lerp(themeColor6, other.themeColor6, t)!,
      themeColor7: Color.lerp(themeColor7, other.themeColor7, t)!,
      themeColor8: Color.lerp(themeColor8, other.themeColor8, t)!,
      themeColor9: Color.lerp(themeColor9, other.themeColor9, t)!,
      themeColor10: Color.lerp(themeColor10, other.themeColor10, t)!,
    );
  }
}
