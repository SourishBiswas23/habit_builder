import 'package:flutter/material.dart';

class AppTheme {
  static const Color sunset = Color(0xFFF65B4E);
  static const Color twilight = Color(0XFF29319F);
  static const Color morning = Color(0XFFFFBA7C);
  static const Color fog = Color(0XFFFFDEEF);
  static const Color eclipse = Color(0XFF573353);
  static const Color creame = Color(0xFFFFF3E9);
  static const Color transparentWhite = Color.fromARGB(0, 255, 243, 233);

  final ThemeData themeData = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: fog,
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        color: eclipse,
        fontSize: 40,
        fontFamily: 'klasik',
      ),
      headlineMedium: TextStyle(
        color: eclipse,
        fontSize: 32,
        fontFamily: 'klasik',
      ),
      headlineSmall: TextStyle(
        color: eclipse,
        fontSize: 25,
        fontFamily: 'klasik',
      ),
      bodyLarge: TextStyle(
        color: eclipse,
        fontSize: 18,
        fontWeight: FontWeight.bold,
        fontFamily: 'manrope',
      ),
      bodyMedium: TextStyle(
        color: eclipse,
        fontSize: 16,
        fontWeight: FontWeight.bold,
        fontFamily: 'manrope',
      ),
      bodySmall: TextStyle(
        color: eclipse,
        fontSize: 12,
        fontWeight: FontWeight.bold,
        fontFamily: 'manrope',
      ),
      titleMedium: TextStyle(
        color: eclipse,
        fontWeight: FontWeight.bold,
        fontFamily: 'manrope',
      ),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: eclipse,
    ),
    inputDecorationTheme: InputDecorationTheme(
      suffixIconColor: eclipse,
      filled: true,
      fillColor: creame,
      prefixIconColor: morning,
      hintStyle: TextStyle(
        color: eclipse.withOpacity(0.5),
        fontFamily: 'manrope',
        fontWeight: FontWeight.bold,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.transparent),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.transparent),
      ),
    ),
  );
}
