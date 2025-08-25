import 'package:flutter/foundation.dart';

class AppConfig {
  static const String appName = 'Buffet App';
  static const String appVersion = '1.0.0';
  
  // Configuración de Firebase
  static const bool enableFirebase = true;
  static const bool enableGoogleSignIn = true;
  
  // Configuración de desarrollo
  static const bool isDevelopment = kDebugMode;
  
  // Configuración de autenticación local
  static const bool enableLocalAuth = true;
  
  // Configuración de UI
  static const double defaultPadding = 16.0;
  static const double defaultRadius = 12.0;
  static const Duration defaultAnimationDuration = Duration(milliseconds: 300);
  
  // Configuración de validación
  static const int minPasswordLength = 6;
  static const int maxPasswordLength = 50;
  
  // Mensajes de error
  static const String firebaseNotAvailableMessage = 'Firebase no está disponible en este momento';
  static const String networkErrorMessage = 'Error de conexión. Verifica tu internet';
  static const String unknownErrorMessage = 'Ocurrió un error inesperado';
  
  // Configuración de tiempo de splash
  static const Duration splashDuration = Duration(milliseconds: 3000);
  
  // Configuración de caché
  static const Duration imageCacheDuration = Duration(days: 7);
  static const int maxImageCacheSize = 100;
}
