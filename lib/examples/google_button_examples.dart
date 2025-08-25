import 'package:flutter/material.dart';
import '../widgets/google_sign_in_button.dart';

class GoogleButtonExamples extends StatelessWidget {
  const GoogleButtonExamples({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejemplos de Botones de Google'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: const Color(0xFF90EE90), // Verde claro como en la imagen
            width: 2,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Botón Superior (Claro con Borde)
              GoogleSignInButton(
                onPressed: () => _showMessage(context, 'Botón Claro con Borde'),
                style: GoogleButtonStyle.light,
                text: 'Sign in with Google',
              ),

              const SizedBox(height: 24),

              // Botón del Medio (Oscuro)
              GoogleSignInButton(
                onPressed: () => _showMessage(context, 'Botón Oscuro'),
                style: GoogleButtonStyle.dark,
                text: 'Sign in with Google',
              ),

              const SizedBox(height: 24),

              // Botón Inferior (Claro sin Borde)
              GoogleSignInButton(
                onPressed: () => _showMessage(context, 'Botón Claro sin Borde'),
                style: GoogleButtonStyle.lightNoBorder,
                text: 'Sign in with Google',
              ),

              const SizedBox(height: 40),

              // Información sobre los estilos
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Text(
                      'Estilos Disponibles:',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    _buildStyleInfo('Light', 'Blanco con borde gris'),
                    _buildStyleInfo('Dark', 'Negro sin borde'),
                    _buildStyleInfo('Light No Border', 'Gris claro sin borde'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStyleInfo(String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text('$title: ', style: const TextStyle(fontWeight: FontWeight.w600)),
          Expanded(child: Text(description)),
        ],
      ),
    );
  }

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: const Duration(seconds: 1)),
    );
  }
}
