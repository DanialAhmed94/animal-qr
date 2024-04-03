import 'package:flutter/material.dart';
import 'package:pet_project/constants/app_constants.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData get lightTheme => ThemeData.light().copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppConstants.primaryColor,
        ),
        brightness: Brightness.light,
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontFamily: "JakartaExtraBold",
            color: Colors.black,
          ),
          titleMedium: TextStyle(
            fontFamily: "JakartaBold",
            color: Colors.black,
          ),
          titleSmall: TextStyle(
            fontFamily: "JakartaSemiBold",
            color: Colors.black,
          ),
          bodyLarge: TextStyle(
            fontFamily: "JakartaRegular",
            color: Colors.black,
          ),
        ),
      );
}
