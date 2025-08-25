import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'services/firebase_config.dart';  // Comentado temporalmente

import 'constants/app_colors.dart';
import 'constants/app_strings.dart';
import 'views/auth/login_screen.dart';
import 'views/auth/register_screen.dart';
import 'views/home/home_screen.dart';
import 'views/profile/profile_screen.dart';
import 'views/services/services_screen.dart';
import 'views/services/network_error_screen.dart';
import 'views/menu/menu_screen.dart';
import 'views/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Firebase comentado temporalmente para resolver conflictos de iOS
  // await FirebaseConfig.initialize();

  await SharedPreferences.getInstance();

  runApp(const ProviderScope(child: BuffetApp()));
}

class BuffetApp extends StatelessWidget {
  const BuffetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        primaryColor: AppColors.orange500,
        scaffoldBackgroundColor: AppColors.background,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.orange500,
          foregroundColor: AppColors.white,
          elevation: 0,
          centerTitle: true,
        ),
        cardTheme: CardTheme(
          color: AppColors.background2,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.orange500,
            foregroundColor: AppColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
        ),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: AppColors.black,
          ),
          headlineMedium: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
          titleLarge: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
          titleMedium: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: AppColors.black,
          ),
          bodyLarge: TextStyle(fontSize: 16, color: AppColors.black),
          bodyMedium: TextStyle(fontSize: 14, color: AppColors.gris),
        ),
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}

final _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
    GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
    GoRoute(path: '/menu', builder: (context, state) => const MenuScreen()),
    GoRoute(
      path: '/services',
      builder: (context, state) => const ServicesScreen(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfileScreen(),
    ),
    GoRoute(
      path: '/network-error',
      builder: (context, state) => const NetworkErrorScreen(),
    ),
  ],
);
