import 'package:flutter/material.dart';

class AppColors {
  // Colores principales - optimizados para glassmorphism
  static const Color orange500 = Color(0xFFdb9323);
  static const Color orange700 = Color(0xFFa46500);
  static const Color orange300 = Color(0xFFf4a261);
  static const Color orange100 = Color(0xFFfef3e2);

  // Colores de fondo - gradiente más oscuro para mejor contraste
  static const Color background = Color(0xFF1a1a2e);
  static const Color background2 = Color(0xFF16213e);
  static const Color background3 = Color(0xFF0f3460);

  // Colores de superficie para glassmorphism
  static const Color surface = Color(0xFF2d2d44);
  static const Color surfaceLight = Color(0xFF3a3a5c);
  static const Color surfaceDark = Color(0xFF1e1e3a);

  // Colores de texto optimizados
  static const Color textPrimary = Color(0xFFffffff);
  static const Color textSecondary = Color(0xFFb8b8d1);
  static const Color textTertiary = Color(0xFF8b8ba7);

  // Colores de acento
  static const Color accent = Color(0xFF4ecdc4);
  static const Color accentDark = Color(0xFF2a9d8f);
  static const Color accentLight = Color(0xFF7dd3fc);

  // Colores de estado
  static const Color success = Color(0xFF10b981);
  static const Color warning = Color(0xFFf59e0b);
  static const Color error = Color(0xFFef4444);
  static const Color info = Color(0xFF3b82f6);

  // Colores neutros
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color gray100 = Color(0xFFf3f4f6);
  static const Color gray200 = Color(0xFFe5e7eb);
  static const Color gray300 = Color(0xFFd1d5db);
  static const Color gray400 = Color(0xFF9ca3af);
  static const Color gray500 = Color(0xFF6b7280);
  static const Color gray600 = Color(0xFF4b5563);
  static const Color gray700 = Color(0xFF374151);
  static const Color gray800 = Color(0xFF1f2937);
  static const Color gray900 = Color(0xFF111827);

  // Colores de redes sociales
  static const Color azulFacebook = Color(0xFF1877f2);
  static const Color verdeWhatsapp = Color(0xFF25d366);

  // Colores legacy para compatibilidad
  static const Color teal200 = accent;
  static const Color teal700 = accentDark;
  static const Color metal = gray400;
  static const Color gris = textSecondary;
  static const Color underline = gray400;

  // Mantener compatibilidad con nombres anteriores
  static const Color purple500 = orange500;
  static const Color purple700 = orange700;
}
