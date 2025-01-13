import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../resources/colors.dart';

class AppTheme {
  static final appTheme = ThemeData(
      textTheme: GoogleFonts.montserratTextTheme(
        ThemeData.dark().textTheme,
      ),
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: kBackgroundColor,
    brightness: Brightness.dark,
    fontFamily: 'Montserrat',
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: kBackgroundColor,
      contentTextStyle: TextStyle(color: Colors.white),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xff2c2b2b),
      hintStyle: const TextStyle(
        color: Color(0xffA7A7A7),
        fontWeight: FontWeight.w400,
      ),
      contentPadding: const EdgeInsets.all(10),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(9),
        borderSide: BorderSide.none,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        textStyle: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 16,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    ),
  );
}
