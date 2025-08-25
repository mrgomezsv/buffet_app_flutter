// TEMPORALMENTE COMENTADO PARA RESOLVER CONFLICTOS DE iOS
/*
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import '../firebase_options.dart';

class FirebaseConfig {
  static bool _isInitialized = false;
  static String? _error;

  static bool get isInitialized => _isInitialized;
  static String? get error => _error;

  static Future<bool> initialize() async {
    if (_isInitialized) return true;

    try {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      _isInitialized = true;
      _error = null;
      return true;
    } catch (e) {
      _error = e.toString();
      if (kDebugMode) {
        debugPrint('Firebase initialization failed: $e');
      }
      return false;
    }
  }

  static void reset() {
    _isInitialized = false;
    _error = null;
  }
}
*/
