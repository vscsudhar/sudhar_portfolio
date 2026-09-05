import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Backgrounds
  static const Color background = Color(0xFF070A10);
  static const Color surface = Color(0xFF0E131F);
  static const Color surfaceElevated = Color(0xFF141C2E);
  static const Color surfaceCard = Color(0xFF111726);
  static const Color surfaceLight = Color(0xFF1E283D);

  // Flutter Cyan & Blues
  static const Color flutterBlue = Color(0xFF02569B);
  static const Color flutterCyan = Color(0xFF00D2FF);
  static const Color flutterSky = Color(0xFF47C5FB);
  static const Color primary = Color(0xFF00D2FF);
  static const Color primaryDark = Color(0xFF02569B);

  // Secondary & Accents
  static const Color accentIndigo = Color(0xFF6366F1);
  static const Color accentPurple = Color(0xFF8B5CF6);
  static const Color accentMint = Color(0xFF10B981);
  static const Color accentNeonGreen = Color(0xFF00F5A0);
  static const Color accentAmber = Color(0xFFFFB800);
  static const Color accentCoral = Color(0xFFFF5E62);

  // Text Colors
  static const Color textPrimary = Color(0xFFF8FAFC);
  static const Color textSecondary = Color(0xFF94A3B8);
  static const Color textMuted = Color(0xFF64748B);
  static const Color textHighlight = Color(0xFF38BDF8);

  // Borders & Glows
  static const Color borderSubtle = Color(0x1AFFFFFF);
  static const Color borderLight = Color(0x33FFFFFF);
  static const Color borderGlow = Color(0x3300D2FF);
  static const Color glowCyan = Color(0x4D00D2FF);
  static const Color glowPurple = Color(0x4D8B5CF6);

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF00D2FF), Color(0xFF02569B)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient heroTextGradient = LinearGradient(
    colors: [Color(0xFFFFFFFF), Color(0xFFE0F2FE), Color(0xFF00D2FF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient flutterBadgeGradient = LinearGradient(
    colors: [Color(0xFF00D2FF), Color(0xFF6366F1)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient neonGreenGradient = LinearGradient(
    colors: [Color(0xFF00F5A0), Color(0xFF00D2FF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient cardOverlayGradient = LinearGradient(
    colors: [Color(0x1A00D2FF), Color(0x056366F1)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient darkCardGradient = LinearGradient(
    colors: [Color(0xFF141C2E), Color(0xFF0E131F)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
