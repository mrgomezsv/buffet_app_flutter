import 'package:flutter/foundation.dart';

class DevConfig {
  // Configuración de desarrollo
  static const bool enableDebugMode = true;
  static const bool enableVerboseLogging = true;
  static const bool enableMockData = true;
  
  // Configuración de Firebase para desarrollo
  static const bool useFirebaseEmulator = false;
  static const String firebaseEmulatorHost = 'localhost';
  static const int firebaseEmulatorPort = 8080;
  
  // Configuración de autenticación para desarrollo
  static const bool enableLocalAuth = true;
  static const bool enableFirebaseAuth = false;
  
  // Configuración de base de datos para desarrollo
  static const bool useLocalDatabase = true;
  static const bool useFirestore = false;
  
  // Configuración de imágenes para desarrollo
  static const bool useLocalImages = true;
  static const bool useNetworkImages = false;
  
  // Configuración de notificaciones para desarrollo
  static const bool enablePushNotifications = false;
  static const bool enableLocalNotifications = true;
  
  // Configuración de análisis para desarrollo
  static const bool enableAnalytics = false;
  static const bool enableCrashlytics = false;
  
  // Configuración de rendimiento para desarrollo
  static const bool enablePerformanceMonitoring = false;
  static const bool enableMemoryProfiling = true;
  
  // Configuración de red para desarrollo
  static const Duration networkTimeout = Duration(seconds: 30);
  static const int maxRetries = 3;
  
  // Configuración de caché para desarrollo
  static const Duration cacheTimeout = Duration(minutes: 5);
  static const int maxCacheSize = 50;
  
  // Configuración de validación para desarrollo
  static const bool enableStrictValidation = false;
  static const bool enableFormValidation = true;
  
  // Configuración de UI para desarrollo
  static const bool enableDebugBanner = true;
  static const bool enableGridOverlay = false;
  static const bool enablePerformanceOverlay = false;
  
  // Métodos de utilidad
  static void log(String message) {
    if (enableVerboseLogging) {
      debugPrint('[DEV] $message');
    }
  }
  
  static void logError(String message, [dynamic error, StackTrace? stackTrace]) {
    if (enableVerboseLogging) {
      debugPrint('[DEV ERROR] $message');
      if (error != null) {
        debugPrint('[DEV ERROR] Error: $error');
      }
      if (stackTrace != null) {
        debugPrint('[DEV ERROR] Stack trace: $stackTrace');
      }
    }
  }
  
  static bool get isDevelopment => kDebugMode;
  static bool get isProduction => !kDebugMode;
  static bool get isTest => false; // Se puede configurar para tests
}
