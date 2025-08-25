import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../constants/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Mi Perfil'),
        backgroundColor: AppColors.orange500,
        foregroundColor: AppColors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            // Avatar y información básica
            Center(
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage(
                      'assets/images/facebook_avatar.png',
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Usuario Buffet',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: AppColors.gris,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'usuario@buffet.com',
                    style: Theme.of(
                      context,
                    ).textTheme.titleMedium?.copyWith(color: AppColors.gris),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // Opciones del perfil
            _buildProfileSection('Información Personal', [
              _buildProfileOption(
                Icons.person,
                'Datos Personales',
                'Editar información básica',
                () {},
              ),
              _buildProfileOption(
                Icons.phone,
                'Teléfono',
                '+57 300 123 4567',
                () {},
              ),
              _buildProfileOption(
                Icons.location_on,
                'Dirección',
                'Calle 123, Ciudad',
                () {},
              ),
            ]),

            const SizedBox(height: 24),

            _buildProfileSection('Configuración', [
              _buildProfileOption(
                Icons.settings,
                'Preferencias',
                'Ajustes de la aplicación',
                () {},
              ),
              _buildProfileOption(
                Icons.notifications,
                'Notificaciones',
                'Gestionar alertas y recordatorios',
                () {},
              ),
              _buildProfileOption(Icons.language, 'Idioma', 'Español', () {}),
            ]),

            const SizedBox(height: 24),

            _buildProfileSection('Seguridad', [
              _buildProfileOption(
                Icons.security,
                'Privacidad',
                'Configurar privacidad de datos',
                () {},
              ),
              _buildProfileOption(
                Icons.lock,
                'Cambiar Contraseña',
                'Actualizar credenciales',
                () {},
              ),
              _buildProfileOption(
                Icons.verified_user,
                'Verificación',
                'Cuenta verificada',
                () {},
              ),
            ]),

            const SizedBox(height: 24),

            _buildProfileSection('Soporte', [
              _buildProfileOption(
                Icons.help,
                'Centro de Ayuda',
                'Preguntas frecuentes y soporte',
                () {},
              ),
              _buildProfileOption(
                Icons.feedback,
                'Enviar Feedback',
                'Compartir tu opinión',
                () {},
              ),
              _buildProfileOption(
                Icons.info,
                'Acerca de',
                'Versión 1.0.0',
                () {},
              ),
            ]),

            const SizedBox(height: 40),

            // Botón de cerrar sesión
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  _showLogoutDialog(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.error,
                  foregroundColor: AppColors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Cerrar Sesión',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.black,
          ),
        ),
        const SizedBox(height: 16),
        ...children,
      ],
    );
  }

  Widget _buildProfileOption(
    IconData icon,
    String title,
    String subtitle,
    VoidCallback onTap,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: AppColors.orange500.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: AppColors.orange500, size: 24),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: AppColors.black,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(color: AppColors.gris, fontSize: 14),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: AppColors.gris,
          size: 16,
        ),
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: const Text(
            'Cerrar Sesión',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: const Text('¿Estás seguro de que quieres cerrar sesión?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Cancelar',
                style: TextStyle(color: AppColors.gris),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                context.go('/login');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.error,
                foregroundColor: AppColors.white,
              ),
              child: const Text('Cerrar Sesión'),
            ),
          ],
        );
      },
    );
  }
}
