import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      inputDecorationTheme: const InputDecorationTheme(
        // Default style cho TextField
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        // Default style cho Button
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          textStyle: const TextStyle(fontSize: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
      // Thêm các tùy chỉnh theme khác
    );
  }

  // Có thể thêm darkTheme nếu cần
  // static ThemeData get darkTheme { ... }
}
