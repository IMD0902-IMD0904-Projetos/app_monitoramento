import 'package:flutter/material.dart';
import 'package:PresenceMonitor/app/theme/color_theme.dart';

enum AppTheme {
  MaroonLight,
  MaroonDark,
}

final appThemeData = {
  AppTheme.MaroonLight: ThemeData(
    brightness: Brightness.light,
    primaryColor: GFTheme.primaryMaroon,
    scaffoldBackgroundColor: GFTheme.white1,
    primaryColorLight: GFTheme.secondaryMaroon,
    primaryColorDark: GFTheme.secondaryGrey, colorScheme: const ColorScheme.light(
      primary: GFTheme.primaryMaroon,
    ).copyWith(secondary: GFTheme.primaryMaroon.withOpacity(0.3)),
  ),
  AppTheme.MaroonDark: ThemeData(
    brightness: Brightness.dark,
    primaryColor: GFTheme.secondaryMaroon,
    scaffoldBackgroundColor: GFTheme.primaryGrey,
    primaryColorDark: GFTheme.white2,
    primaryColorLight: GFTheme.secondaryGrey, colorScheme: const ColorScheme.dark(
      primary: GFTheme.secondaryMaroon,
    ).copyWith(secondary: GFTheme.secondaryMaroon.withOpacity(0.3)),
  ),
};