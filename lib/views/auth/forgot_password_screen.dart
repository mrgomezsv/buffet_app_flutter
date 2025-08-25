import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_strings.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/custom_button.dart';

class ForgotPasswordScreen extends ConsumerStatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  ConsumerState<ForgotPasswordScreen> createState() =>
      _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends ConsumerState<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  bool _isLoading = false;
  bool _emailSent = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _resetPassword() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
    });

    try {
      // Simular envío de email (en producción se conectaría con Firebase)
      await Future.delayed(const Duration(seconds: 2));

      if (mounted) {
        setState(() {
          _emailSent = true;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: $e'),
            backgroundColor: AppColors.error,
          ),
        );
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(AppStrings.resetPassword),
        backgroundColor: AppColors.orange500,
        foregroundColor: AppColors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 40),

                // Icono de candado
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: AppColors.orange500.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(60),
                  ),
                  child: Icon(
                    Icons.lock_reset,
                    size: 60,
                    color: AppColors.orange500,
                  ),
                ),

                const SizedBox(height: 32),

                // Título
                Text(
                  '¿Olvidaste tu contraseña?',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 16),

                // Descripción
                Text(
                  'No te preocupes, te enviaremos un enlace para restablecer tu contraseña.',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.textSecondary,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 40),

                if (!_emailSent) ...[
                  // Campo de email
                  CustomTextField(
                    controller: _emailController,
                    labelText: AppStrings.email,
                    hintText: 'ejemplo@correo.com',
                    prefixIcon: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppStrings.requiredField;
                      }
                      if (!RegExp(
                        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                      ).hasMatch(value)) {
                        return AppStrings.invalidEmail;
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 32),

                  // Botón de envío
                  CustomButton(
                    text: AppStrings.sendResetLink,
                    onPressed: _isLoading ? null : _resetPassword,
                    isLoading: _isLoading,
                    backgroundColor: AppColors.orange500,
                    textColor: AppColors.white,
                  ),
                ] else ...[
                  // Mensaje de éxito
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.green.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: Colors.green.withValues(alpha: 0.3),
                        width: 1,
                      ),
                    ),
                    child: Column(
                      children: [
                        Icon(
                          Icons.check_circle_outline,
                          size: 64,
                          color: Colors.green,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          '¡Email enviado!',
                          style: Theme.of(
                            context,
                          ).textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Revisa tu bandeja de entrada y sigue las instrucciones para restablecer tu contraseña.',
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(color: Colors.green.shade700),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Botón para volver al login
                  CustomButton(
                    text: AppStrings.backToLogin,
                    onPressed: () => context.go('/login'),
                    backgroundColor: AppColors.orange500,
                    textColor: AppColors.white,
                  ),
                ],

                const SizedBox(height: 24),

                // Enlace para volver al login
                if (!_emailSent) ...[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '¿Recordaste tu contraseña? ',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                      TextButton(
                        onPressed: () => context.go('/login'),
                        child: Text(
                          AppStrings.backToLogin,
                          style: TextStyle(
                            color: AppColors.orange500,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
