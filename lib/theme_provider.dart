import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeProvider extends ChangeNotifier{
  final TextTheme _textTheme = TextTheme(
    displayMedium: GoogleFonts.montserrat(),
    headlineMedium: GoogleFonts.montserrat(),
    bodyMedium: GoogleFonts.montserrat(),
    bodySmall: GoogleFonts.montserrat(),
    headlineSmall: GoogleFonts.montserrat(),
  );

  ThemeData _theme = ThemeData.light();
  ThemeData get theme => _theme;


  void toggleTheme() {
    final isDark = _theme == ThemeData.dark();

    if (isDark) {
      _theme = ThemeData.light();
    } else {
      _theme = ThemeData.dark();
    }
    notifyListeners();
  }

}