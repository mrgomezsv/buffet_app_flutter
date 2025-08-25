import 'dart:developer' as developer;
import 'local_auth_service.dart';

class AuthService {
  // Servicio simplificado que solo usa autenticación local
  // Firebase se habilitará cuando se resuelvan los conflictos de iOS

  // Stream for auth state changes
  Stream<bool> get authStateChanges {
    return Stream.fromFuture(
      LocalAuthService.isLoggedIn(),
    ).map((isLoggedIn) => isLoggedIn);
  }

  // Get current user
  Map<String, dynamic>? get currentUser =>
      null; // Se manejará de forma asíncrona

  // Check if Firebase is available
  bool get isFirebaseAvailable => false; // Temporalmente deshabilitado

  // Register with email and password
  Future<bool> registerWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    try {
      final success = await LocalAuthService.registerWithEmailAndPassword(
        email,
        password,
        name,
      );
      if (success) {
        developer.log(
          'Usuario registrado exitosamente: $email',
          name: 'AuthService',
        );
        return true;
      } else {
        throw Exception('Error en el registro local');
      }
    } catch (e) {
      developer.log('Error en registro: $e', name: 'AuthService');
      rethrow;
    }
  }

  // Sign in with email and password
  Future<bool> signInWithEmailAndPassword(String email, String password) async {
    try {
      final success = await LocalAuthService.signInWithEmailAndPassword(
        email,
        password,
      );
      if (success) {
        developer.log(
          'Usuario autenticado exitosamente: $email',
          name: 'AuthService',
        );
        return true;
      } else {
        throw Exception('Credenciales inválidas');
      }
    } catch (e) {
      developer.log('Error en inicio de sesión: $e', name: 'AuthService');
      rethrow;
    }
  }

  // Sign in with Google (no disponible temporalmente)
  Future<bool> signInWithGoogle() async {
    throw Exception(
      'Inicio de sesión con Google no está disponible temporalmente',
    );
  }

  // Sign out
  Future<void> signOut() async {
    await LocalAuthService.signOut();
    developer.log('Usuario cerró sesión', name: 'AuthService');
  }

  // Check if user is logged in (works with local auth only)
  Future<bool> isUserLoggedIn() async {
    return await LocalAuthService.isLoggedIn();
  }
}
