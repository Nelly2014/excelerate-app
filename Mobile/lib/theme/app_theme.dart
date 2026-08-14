import 'package:flutter/material.dart';

class AppTheme {
  // Excelerate brand colors (matched to live site)
  // The real logo uses an orange -> magenta/pink gradient.
  static const Color brandOrange = Color(0xFFF7941D);   // gradient start
  static const Color brandPink = Color(0xFFE6007E);     // gradient end / primary accent
  static const Color primaryPink = Color(0xFFC2126B);   // solid buttons / links (slightly deeper for contrast)
  static const Color primaryPurple = primaryPink;       // kept for backwards-compat with existing screens
  static const Color primaryOrange = Color(0xFFF59E0B);
  static const Color accentGray = Color(0xFFF5F5F7);
  static const Color textDark = Color(0xFF1A1A1A);
  static const Color textLight = Color(0xFF6B7280);
  static const Color borderColor = Color(0xFFE5E7EB);
  static const Color successGreen = Color(0xFF10B981);
  static const Color statusInProgress = primaryPink;

  static const LinearGradient brandGradient = LinearGradient(
    colors: [brandOrange, brandPink],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  /// The gradient "Excelerate" wordmark, matching the live site's logo.
  /// Use this instead of a plain "EXCELERATE" Text widget so branding
  /// (mixed case + gradient) stays consistent across every screen.
  static Widget wordmark({double fontSize = 22}) {
    return ShaderMask(
      shaderCallback: (bounds) => brandGradient.createShader(bounds),
      child: Text(
        'Excelerate',
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: Colors.white, // masked by gradient
        ),
      ),
    );
  }

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryPink,
        brightness: Brightness.light,
      ),
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: textDark,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(
          color: textDark,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          color: textDark,
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
        headlineMedium: TextStyle(
          color: textDark,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        headlineSmall: TextStyle(
          color: textDark,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        bodyLarge: TextStyle(
          color: textDark,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        bodyMedium: TextStyle(
          color: textDark,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          color: textLight,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
        labelLarge: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryPink,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: textDark,
          side: const BorderSide(color: borderColor),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: primaryPink, width: 2),
        ),
        hintStyle: const TextStyle(
          color: textLight,
          fontSize: 14,
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: borderColor,
        thickness: 1,
        space: 16,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: primaryPink,
        unselectedItemColor: textLight,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),
    );
  }
}
