import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          // App Bar con imagen de portada
          SliverAppBar(
            expandedHeight: 200,
            floating: false,
            pinned: true,
            backgroundColor: AppColors.orange500,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/images/portada_service.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Contenido de servicios
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  // Título principal
                  Text(
                    'Nuestros Servicios',
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: AppColors.orange700,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 16),

                  // Descripción del servicio
                  Text(
                    'Ofrecemos una amplia gama de servicios para hacer de su evento algo especial y memorable',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: AppColors.gris,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 16),

                  // Servicios disponibles
                  Text(
                    'Desde celebraciones íntimas hasta grandes eventos corporativos',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: AppColors.gris,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 16),

                  Text(
                    'Cada detalle cuenta para crear experiencias únicas',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: AppColors.gris,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 32),

                  // Primera fila de servicios
                  Row(
                    children: [
                      Expanded(
                        child: _buildServiceCard(
                          'assets/images/img1.jpg',
                          'Servicios Sociales',
                          'Ver Servicios',
                          () {},
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _buildServiceCard(
                          'assets/images/merry.jpg',
                          'Quinceañeras',
                          'Ver Quinceañeras',
                          () {},
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Botones de la primera fila
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.orange500,
                            foregroundColor: AppColors.white,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                          child: const Text(
                            'Servicios Sociales',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.orange500,
                            foregroundColor: AppColors.white,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                          child: const Text(
                            'Quinceañeras',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 32),

                  // Segunda fila de servicios
                  Row(
                    children: [
                      Expanded(
                        child: _buildServiceCard(
                          'assets/images/img3.jpg',
                          'Eventos Corporativos',
                          'Ver Eventos',
                          () {},
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _buildServiceCard(
                          'assets/images/img4.jpg',
                          'Cristalería',
                          'Ver Cristalería',
                          () {},
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Botones de la segunda fila
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.orange500,
                            foregroundColor: AppColors.white,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                          child: const Text(
                            'Eventos Corporativos',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.orange500,
                            foregroundColor: AppColors.white,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                          child: const Text(
                            'Cristalería',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCard(
    String imagePath,
    String title,
    String buttonText,
    VoidCallback onTap,
  ) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
