import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: const Color(0xFFD32F2F), // Deep Red
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'Poppins', // Default font
      colorScheme: const ColorScheme.light(
        primary: Color(0xFFD32F2F),
        secondary: Colors.black,
        surface: Colors.white,
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.bold, color: Colors.black),
        displayMedium: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.bold, color: Colors.black),
        displaySmall: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.bold, color: Colors.black),
        headlineMedium: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.bold, color: Colors.black),
        bodyLarge: TextStyle(fontFamily: 'Poppins', color: Colors.black),
        bodyMedium: TextStyle(fontFamily: 'Poppins', color: Colors.black),
        titleMedium: TextStyle(fontFamily: 'Poppins', color: Colors.black),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.grey[100],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        hintStyle: TextStyle(color: Colors.grey[500], fontFamily: 'Poppins'),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFD32F2F),
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
          ),
        ),
      ),
    );
  }
}
