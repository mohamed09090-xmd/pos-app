import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF6C63FF);
  static const Color secondaryColor = Color(0xFF03DAC6);
  static const Color backgroundColor = Color(0xFFF2F2F7);
  static const Color surfaceColor = Colors.white;
  static const Color errorColor = Color(0xFFB00020);

  // ألوان الوضع المظلم (Dark Mode Colors)
  static const Color darkBackgroundColor = Color(0xFF0F172A); // كحلي غامق
  static const Color darkSurfaceColor = Color(0xFF1E293B);    // أزرق صخري للبطاقات
  static const Color darkTextColor = Color(0xFFF1F5F9);

  static final TextTheme textTheme = GoogleFonts.ibmPlexSansTextTheme().copyWith(
    bodyLarge: GoogleFonts.ibmPlexSans(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
  );

  // --- الوضع الفاتح (Light Theme) ---
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: backgroundColor,
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.transparent,
      ),
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        primary: primaryColor,
        secondary: secondaryColor,
        surface: surfaceColor,
        error: errorColor,
        brightness: Brightness.light,
      ),
      textTheme: textTheme.apply(
        bodyColor: Colors.black87,
        displayColor: Colors.black,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: textTheme.titleLarge?.copyWith(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      cardTheme: CardThemeData(
        elevation: 4,
        shadowColor: Colors.black.withValues(alpha: 0.1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: surfaceColor,
      ),
      inputDecorationTheme: _inputDecoration(Colors.white, Colors.grey[300]!),
      elevatedButtonTheme: _buttonTheme(),
    );
  }

  // --- الوضع المظلم (Dark Theme) ---
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: darkBackgroundColor,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        primary: primaryColor,
        secondary: secondaryColor,
        surface: darkSurfaceColor,
        error: errorColor,
        brightness: Brightness.dark,
      ),
      textTheme: textTheme.apply(
        bodyColor: darkTextColor,
        displayColor: Colors.white,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: darkBackgroundColor,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: textTheme.titleLarge?.copyWith(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      cardTheme: CardThemeData(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: darkSurfaceColor,
      ),
      inputDecorationTheme: _inputDecoration(darkSurfaceColor, Colors.white10),
      elevatedButtonTheme: _buttonTheme(),
    );
  }

  // تنسيق الحقول (مُشترك)
  static InputDecorationTheme _inputDecoration(Color fill, Color border) {
    return InputDecorationTheme(
      filled: true,
      fillColor: fill,
      hintStyle: TextStyle(color: Colors.grey[400], fontSize: 13),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: border)),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: border)),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: primaryColor, width: 2)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    );
  }

  // تنسيق الأزرار (مُشترك)
  static ElevatedButtonThemeData _buttonTheme() {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        elevation: 4,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}