import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../constants/app_colors.dart';

class NetworkErrorScreen extends StatelessWidget {
  const NetworkErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // Imagen principal
            Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 22),
                child: Image.asset(
                  'assets/images/img_main_network.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Texto de error principal
            Container(
              margin: const EdgeInsets.only(bottom: 16),
              child: Text(
                '¡Ups! Sin Internet',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: AppColors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            // Texto de descripción
            Container(
              margin: const EdgeInsets.only(bottom: 32),
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Por favor, compruebe su conexión de red',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: AppColors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            // Botón de reintentar
            Container(
              width: double.infinity,
              height: 60,
              margin: const EdgeInsets.symmetric(horizontal: 24),
              child: ElevatedButton(
                onPressed: () {
                  // Aquí se puede implementar la lógica para verificar la conexión
                  context.go('/home');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.gris,
                  foregroundColor: AppColors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Intentar Otra Vez',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
            ),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
