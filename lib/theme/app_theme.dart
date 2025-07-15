import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Define base font family for easier management
  static final String _fontFamily = GoogleFonts.roboto().fontFamily!;

  // --- LIGHT THEME ---
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.lightBlue, // Your primary seed color
      brightness: Brightness.light,
      // You can override specific colors if needed:
      // primary: Colors.lightBlue,
      // secondary: Colors.amber,
      // surface: Colors.grey[50],
      // background: Colors.white,
      // error: Colors.redAccent,
    ),
    fontFamily: _fontFamily,
    appBarTheme: AppBarTheme(
      elevation: 0, // Common M3 style for app bars
      centerTitle: true, // Example: center title
      backgroundColor: Colors.transparent, // Can be made transparent or use surface color
      foregroundColor: Colors.black, // Icon and title color
      titleTextStyle: GoogleFonts.roboto( // Can also use _fontFamily here
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black, // Explicitly set for AppBar
      ),
    ),
    textTheme: TextTheme(
      // Display styles
      displayLarge: GoogleFonts.roboto(fontSize: 57, fontWeight: FontWeight.w400, letterSpacing: -0.25),
      displayMedium: GoogleFonts.roboto(fontSize: 45, fontWeight: FontWeight.w400, letterSpacing: 0.0),
      displaySmall: GoogleFonts.roboto(fontSize: 36, fontWeight: FontWeight.w400, letterSpacing: 0.0),

      // Headline styles
      headlineLarge: GoogleFonts.roboto(fontSize: 32, fontWeight: FontWeight.w600, letterSpacing: 0.0), // Adjusted size
      headlineMedium: GoogleFonts.roboto(fontSize: 28, fontWeight: FontWeight.w600, letterSpacing: 0.0),
      headlineSmall: GoogleFonts.roboto(fontSize: 24, fontWeight: FontWeight.w600, letterSpacing: 0.0),

      // Title styles
      titleLarge: GoogleFonts.roboto(fontSize: 22, fontWeight: FontWeight.w500, letterSpacing: 0.0),
      titleMedium: GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w500, letterSpacing: 0.15),
      titleSmall: GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),

      // Body styles
      bodyLarge: GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
      bodyMedium: GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25), // Standard body
      bodySmall: GoogleFonts.roboto(fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),

      // Label styles (often used for buttons, captions)
      labelLarge: GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),
      labelMedium: GoogleFonts.roboto(fontSize: 12, fontWeight: FontWeight.w500, letterSpacing: 0.5),
      labelSmall: GoogleFonts.roboto(fontSize: 11, fontWeight: FontWeight.w500, letterSpacing: 0.5),
    ).apply( // Apply default body and display colors from the color scheme
      bodyColor: Colors.black87, // Example: Default for body text
      displayColor: Colors.black, // Example: Default for display/headline text
    ),
    cardTheme: CardThemeData(
      elevation: 1.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      // color: Colors.white, // Or use colorScheme.surfaceVariant
      // margin: const EdgeInsets.all(8.0),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        // backgroundColor: Colors.lightBlue, // Uses colorScheme.primary by default
        // foregroundColor: Colors.white, // Uses colorScheme.onPrimary by default
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        textStyle: GoogleFonts.roboto(fontSize: 15, fontWeight: FontWeight.w600),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        // borderSide: BorderSide(color: Colors.grey[400]!),
      ),
      // focusedBorder: OutlineInputBorder(
      //   borderRadius: BorderRadius.circular(8.0),
      //   borderSide: BorderSide(color: Colors.lightBlue),
      // ),
      // labelStyle: GoogleFonts.roboto(color: Colors.grey[600]),
    ),
    // Add other component themes as needed (FloatingActionButtonTheme, ChipTheme, etc.)
  );

  // --- DARK THEME ---
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blueGrey, // Your primary seed color for dark theme
      brightness: Brightness.dark,
      // You can override specific colors if needed for dark theme:
      // primary: Colors.blueGrey[700],
      // secondary: Colors.tealAccent[400],
      // surface: Colors.grey[850], // Darker surface
      // background: Colors.grey[900], // Darker background
    ),
    fontFamily: _fontFamily,
    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.transparent, // Or a dark surface color
      foregroundColor: Colors.white,
      titleTextStyle: GoogleFonts.roboto(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    textTheme: TextTheme(
      // Define dark theme text styles similarly to light theme
      displayLarge: GoogleFonts.roboto(fontSize: 57, fontWeight: FontWeight.w400, letterSpacing: -0.25),
      displayMedium: GoogleFonts.roboto(fontSize: 45, fontWeight: FontWeight.w400, letterSpacing: 0.0),
      displaySmall: GoogleFonts.roboto(fontSize: 36, fontWeight: FontWeight.w400, letterSpacing: 0.0),

      headlineLarge: GoogleFonts.roboto(fontSize: 32, fontWeight: FontWeight.w600, letterSpacing: 0.0),
      headlineMedium: GoogleFonts.roboto(fontSize: 28, fontWeight: FontWeight.w600, letterSpacing: 0.0),
      headlineSmall: GoogleFonts.roboto(fontSize: 24, fontWeight: FontWeight.w600, letterSpacing: 0.0),

      titleLarge: GoogleFonts.roboto(fontSize: 22, fontWeight: FontWeight.w500, letterSpacing: 0.0),
      titleMedium: GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w500, letterSpacing: 0.15),
      titleSmall: GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),

      bodyLarge: GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
      bodyMedium: GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
      bodySmall: GoogleFonts.roboto(fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),

      labelLarge: GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),
      labelMedium: GoogleFonts.roboto(fontSize: 12, fontWeight: FontWeight.w500, letterSpacing: 0.5),
      labelSmall: GoogleFonts.roboto(fontSize: 11, fontWeight: FontWeight.w500, letterSpacing: 0.5),
    ).apply( // Apply default body and display colors from the dark color scheme
      bodyColor: Colors.white70, // Slightly dimmer for body text in dark mode
      displayColor: Colors.white, // Brighter for headlines
    ),
    cardTheme: CardThemeData(
      elevation: 1.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      // color: Colors.grey[800], // Or use colorScheme.surfaceVariant for dark
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        // backgroundColor: Colors.blueGrey[600], // Uses colorScheme.primary by default
        // foregroundColor: Colors.white, // Uses colorScheme.onPrimary by default
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        textStyle: GoogleFonts.roboto(fontSize: 15, fontWeight: FontWeight.w600),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        // borderSide: BorderSide(color: Colors.grey[700]!),
      ),
      // focusedBorder: OutlineInputBorder(
      //   borderRadius: BorderRadius.circular(8.0),
      //   borderSide: BorderSide(color: Colors.blueGrey[400]!),
      // ),
      // labelStyle: GoogleFonts.roboto(color: Colors.grey[400]),
      // fillColor: Colors.grey[800], // Example: for filled variant
      // filled: true,
    ),
    // ... other component themes for dark mode
  );
}
