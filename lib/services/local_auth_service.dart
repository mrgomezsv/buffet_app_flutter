import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class LocalAuthService {
  static const String _userKey = 'local_user';
  static const String _isLoggedInKey = 'isLoggedIn';

  // Check if user is logged in
  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isLoggedInKey) ?? false;
  }

  // Get current user
  static Future<Map<String, dynamic>?> getCurrentUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString(_userKey);
    if (userJson != null) {
      return json.decode(userJson) as Map<String, dynamic>;
    }
    return null;
  }

  // Sign in with email and password (local validation)
  static Future<bool> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    // Validación básica local
    if (email.isEmpty || password.isEmpty) {
      return false;
    }

    // Simular autenticación exitosa
    final user = {
      'id': 'local_${DateTime.now().millisecondsSinceEpoch}',
      'email': email,
      'name': email.split('@')[0], // Usar parte del email como nombre
      'createdAt': DateTime.now().toIso8601String(),
    };

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userKey, json.encode(user));
    await prefs.setBool(_isLoggedInKey, true);

    return true;
  }

  // Register with email and password
  static Future<bool> registerWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    // Validación básica local
    if (email.isEmpty || password.isEmpty || name.isEmpty) {
      return false;
    }

    // Simular registro exitoso
    final user = {
      'id': 'local_${DateTime.now().millisecondsSinceEpoch}',
      'email': email,
      'name': name,
      'createdAt': DateTime.now().toIso8601String(),
    };

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userKey, json.encode(user));
    await prefs.setBool(_isLoggedInKey, true);

    return true;
  }

  // Sign out
  static Future<void> signOut() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userKey);
    await prefs.setBool(_isLoggedInKey, false);
  }

  // Update user profile
  static Future<bool> updateProfile(String name) async {
    final currentUser = await getCurrentUser();
    if (currentUser != null) {
      currentUser['name'] = name;
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_userKey, json.encode(currentUser));
      return true;
    }
    return false;
  }
}
