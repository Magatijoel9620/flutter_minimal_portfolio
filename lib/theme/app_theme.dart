import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    colorScheme: const ColorScheme.light(
      primary: Colors.lightBlue,
    ),
    appBarTheme: AppBarTheme(
      titleTextStyle: GoogleFonts.roboto(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: TextTheme(
      headlineLarge: GoogleFonts.roboto(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      bodyMedium: GoogleFonts.roboto(
        fontSize: 16,
        color: Colors.black87,
      ),
    ),
    useMaterial3: true
  );

  static ThemeData darkTheme = ThemeData(
      colorScheme: const ColorScheme.dark(
        primary: Colors.blueGrey,
      ),
      appBarTheme: AppBarTheme(
        titleTextStyle: GoogleFonts.roboto(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white
        ),
      ),
      textTheme: TextTheme(
        headlineLarge: GoogleFonts.roboto(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        bodyMedium: GoogleFonts.roboto(
          fontSize: 16,
          color: Colors.white70,
        ),
      ),
      useMaterial3: true
  );
}