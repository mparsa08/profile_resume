import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static final darkTheme = ThemeData(
    useMaterial3: true,
    primaryColor: Colors.pink,
    primaryColorDark: const Color(0x0DFFFFFF),
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
      titleTextStyle: GoogleFonts.dancingScript().copyWith(fontSize: 20),
    ),
    textTheme: TextTheme(
      // TITLE
      headline1: GoogleFonts.teko(
          fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
      // BODY
      bodyText1: GoogleFonts.teko(fontSize: 14),

      // BODY LIGHT
      bodyText2: GoogleFonts.teko(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
      filled: true,
      fillColor: Colors.white12,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.white),
            backgroundColor: MaterialStateProperty.all(Colors.pink))),
  );
  static final lightTheme = ThemeData(
    useMaterial3: true,
    primaryColor: Colors.pink,
    primaryColorDark: Colors.black26,
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      elevation: 0,
      titleTextStyle: GoogleFonts.dancingScript()
          .copyWith(fontSize: 20, color: Colors.black),
    ),
    textTheme: TextTheme(
      // TITLE
      headline1: GoogleFonts.teko(
          fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
      // BODY
      bodyText1: GoogleFonts.teko(fontSize: 14),

      // BODY LIGHT
      bodyText2: GoogleFonts.teko(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
      filled: true,
      fillColor: Colors.black12,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.white),
            backgroundColor: MaterialStateProperty.all(Colors.pink))),
  );
}
