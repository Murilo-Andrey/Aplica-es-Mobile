import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const navy = Color(0xFF10263B);
  static const teal = Color(0xFF0B3D3A);
  static const gold = Color(0xFFD9A441);
  static const coral = Color(0xFFE4572E);
  static const cream = Color(0xFFFBF6EE);
  static const ink = Color(0xFF4B5D6B);
}

ThemeData buildTheme() {
  return ThemeData(
    scaffoldBackgroundColor: AppColors.cream,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.teal,
      primary: AppColors.teal,
      secondary: AppColors.gold,
    ),
    textTheme: TextTheme(
      headlineMedium: GoogleFonts.fraunces(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: AppColors.navy,
      ),
      bodyLarge: GoogleFonts.workSans(fontSize: 16, color: AppColors.navy),
      bodyMedium: GoogleFonts.workSans(fontSize: 14, color: AppColors.ink),
      labelLarge: GoogleFonts.workSans(fontSize: 14, fontWeight: FontWeight.w600),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.navy,
      foregroundColor: Colors.white,
      elevation: 0,
      titleTextStyle: GoogleFonts.fraunces(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.coral,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        textStyle: GoogleFonts.workSans(fontWeight: FontWeight.w600),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.cream,
      contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide.none,
      ),
    ),
  );
}

// linha pontilhada usada no cartão de embarque do checkout
Widget dashedDivider() {
  return Row(
    children: List.generate(
      36,
      (index) => Expanded(
        child: Container(
          color: index % 2 == 0 ? AppColors.ink.withOpacity(0.35) : Colors.transparent,
          height: 1,
        ),
      ),
    ),
  );
}
