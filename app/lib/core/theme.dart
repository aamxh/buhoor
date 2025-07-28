import 'package:buhoor/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final lightTheme = ThemeData.light().copyWith(
  primaryColor: MyConstants.primaryColor,
  scaffoldBackgroundColor: Colors.white,
  colorScheme: ColorScheme.light().copyWith(
    secondary: Colors.black,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: MyConstants.primaryColor,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    ),
  ),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: MyConstants.primaryColor,
    selectionHandleColor: MyConstants.primaryColor,
  ),
  textTheme: TextTheme(
    headlineLarge: GoogleFonts.amiri(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
    headlineMedium: GoogleFonts.amiri(color: Colors.black, fontSize: 28, fontWeight: FontWeight.bold),
    headlineSmall: GoogleFonts.amiri(color: Colors.black, fontSize: 26, fontWeight: FontWeight.bold),
    titleLarge: GoogleFonts.amiri(color: Colors.black, fontSize: 24, fontWeight: FontWeight.w700),
    titleMedium: GoogleFonts.amiri(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w700),
    titleSmall: GoogleFonts.amiri(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700),
    bodyLarge: GoogleFonts.amiri(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
    bodyMedium: GoogleFonts.amiri(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
    bodySmall: GoogleFonts.amiri(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500),
  ),
);