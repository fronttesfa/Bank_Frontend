import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Instantiate new  theme data
final ThemeData tesfaTheme = _tesfaAppTheme();

//Define Base theme for app
ThemeData _tesfaAppTheme() {
// We'll just overwrite whatever's already there using ThemeData.light()
  final ThemeData base = ThemeData.light();

  // Make changes to light() theme
  return base.copyWith(
      colorScheme: base.colorScheme.copyWith(
        primary: const Color.fromARGB(255, 255, 153, 51),
        onPrimary: Colors.white,
        secondary: const Color.fromARGB(255, 223, 27, 12),
        onSecondary: Colors.white,
        background: const Color.fromARGB(255, 228, 243, 228),
        onBackground: Colors.black,
      ),
      textTheme: _tesfaAppTextTheme(base.textTheme),
      elevatedButtonTheme: _elevatedButtonTheme(base.elevatedButtonTheme),
      inputDecorationTheme: _inputDecorationTheme(base.inputDecorationTheme));
}

// App wise text theme

TextTheme _tesfaAppTextTheme(TextTheme base) => base.copyWith(
// This'll be our appbars title
      displayLarge: GoogleFonts.dmSans(
          fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
// for widgets heading/title
      displayMedium: GoogleFonts.dmSans(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
// for sub-widgets heading/title
      displaySmall: GoogleFonts.dmSans(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
// for widgets contents/paragraph
      bodyLarge: GoogleFonts.dmSans(
          fontSize: 14, fontWeight: FontWeight.w300, color: Colors.black),
// for sub-widgets contents/paragraph
      bodyMedium: GoogleFonts.dmSans(
          fontSize: 12, fontWeight: FontWeight.w300, color: Colors.black),
      // for sub-widgets contents/paragraph
      bodySmall: base.bodySmall!.copyWith(
          fontSize: 10, fontWeight: FontWeight.w300, color: Colors.black45),
    );

// global style for our buttons

ElevatedButtonThemeData _elevatedButtonTheme(ElevatedButtonThemeData base) =>
    ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          const Color.fromARGB(255, 223, 27, 12),
        ),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
      ),
    );

// Global styles for our TextInputs
InputDecorationTheme _inputDecorationTheme(InputDecorationTheme base) =>
    const InputDecorationTheme(
// Label color for the input widget
      labelStyle: TextStyle(color: Colors.black),
// Define border of input form while focused on
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 1.0,
          color: Colors.black,
          style: BorderStyle.solid,
        ),
      ),
    );
