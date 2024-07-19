import 'package:flutter/material.dart';
import 'package:practice_flutter/project/theme/theme_colors.dart';

ThemeData get darkTheme => ThemeData(
      brightness: Brightness.dark,
      primaryColor: primaryDark,
      scaffoldBackgroundColor: deepDark,
      appBarTheme: const AppBarTheme(color: primaryDark),
    );

ThemeData get lightTheme => ThemeData(
      brightness: Brightness.light,
      primaryColor: primaryLight,
      scaffoldBackgroundColor: primaryLight,
      appBarTheme: const AppBarTheme(color: primaryLight),
    );
