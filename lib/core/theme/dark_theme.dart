
import 'package:define_todo_app/core/theme/color_palette.dart';
import 'package:define_todo_app/core/theme/extensions/color_extension.dart';
import 'package:define_todo_app/core/theme/extensions/space_extension.dart';
import 'package:define_todo_app/core/theme/extensions/typography_extension.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dark_theme.g.dart';

final _darkTheme = ThemeData(
  brightness: Brightness.dark,
  extensions: [
    AppColorExtension(
      primary: AppColorPalettes.blue400,
      secondary: AppColorPalettes.grey1000,
      text: AppColorPalettes.white500,
      textInverse: AppColorPalettes.blue900,
      textSubtle: AppColorPalettes.gray300,
      textSubtlest: AppColorPalettes.grey400,
      textDisabled: AppColorPalettes.grey350,
      bottomNavBorder: AppColorPalettes.grey350.withOpacity(0.2),
    ),
    AppSpaceExtension.fromBaseSpace(8),
    AppTypographyExtension.fromColors(
      defaultFontColor: AppColorPalettes.white500,
      linkColor: Colors.blue,
      dimFontColor: AppColorPalettes.grey400,
    ),
  ],
);

@riverpod
ThemeData darkTheme(DarkThemeRef ref) {
  return _darkTheme;
}
