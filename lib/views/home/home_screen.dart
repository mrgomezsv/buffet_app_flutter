import 'package:flutter/material.dart';
import 'dart:async';
import 'package:go_router/go_router.dart';
import '../../constants/app_colors.dart';
import '../../widgets/menu_card_widget.dart';
import '../../widgets/glassmorphism_container.dart';
import '../../models/menu_producto.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  int _selectedTabIndex = 0;
  Timer? _timer;
  final PageController _pageController = PageController();

  // Datos de ejemplo para el slider
  final List<String> sliderImages = [
    'assets/images/portada.jpg',
    'assets/images/portada_service.jpg',
    'assets/images/portada_sociales.jpg',
    'assets/images/portada_quince.jpg',
    'assets/images/portada_cristaleria.jpg',
  ];

  final List<Widget> _fragments = [
    const LunchFragment(),
    const SnackFragment(),
    const BuffetFragment(),
    const ProfileFragment(),
  ];

  final List<BottomNavigationBarItem> _bottomNavItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.lunch_dining),
      label: 'Almuerzos',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.restaurant),
      label: 'Antojitos',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.celebration),
      label: 'Buffet',
    ),
    const BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Mi Perfil'),
  ];

  @override
  void initState() {
    super.initState();
    _startAutoPlay();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoPlay() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_currentIndex < sliderImages.length - 1) {
        _currentIndex++;
      } else {
        _currentIndex = 0;
      }
      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GlassmorphismBackground(
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 10),
              // Image Slider
              Container(
                margin: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                  bottom: 10,
                  top: 30,
                ),
                child: GlassmorphismCard(
                  borderRadius: 16,
                  backgroundColor: AppColors.surface,
                  blur: 20,
                  opacity: 0.2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: SizedBox(
                      height: 200,
                      child: PageView.builder(
                        controller: _pageController,
                        onPageChanged: (index) {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                        itemCount: sliderImages.length,
                        itemBuilder: (context, index) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(sliderImages[index]),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),

              // Indicadores de página
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  sliderImages.length,
                  (index) => GlassmorphismContainer(
                    borderRadius: 50,
                    width: 12,
                    height: 12,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    backgroundColor:
                        _currentIndex == index
                            ? AppColors.orange500
                            : AppColors.textTertiary,
                    blur: 8,
                    opacity: _currentIndex == index ? 0.4 : 0.2,
                    child: Container(),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Fragment Container
              Expanded(child: _fragments[_selectedTabIndex]),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.orange500,
        selectedItemColor: AppColors.white,
        unselectedItemColor: AppColors.white.withAlpha(179),
        currentIndex: _selectedTabIndex,
        onTap: (index) {
          setState(() {
            _selectedTabIndex = index;
          });
        },
        items: _bottomNavItems,
      ),
    );
  }
}

// Fragment para Almuerzos
class LunchFragment extends StatelessWidget {
  const LunchFragment({super.key});

  @override
  Widget build(BuildContext context) {
    final List<MenuProducto> lunchItems = [
      MenuProducto(
        id: '1',
        name: 'Almuerzo Ejecutivo',
        description: 'Plato principal, sopa y bebida',
        price: 12.99,
        imgUrl: 'assets/images/lunch.png',
        category: 'Almuerzo',
      ),
      MenuProducto(
        id: '2',
        name: 'Almuerzo Familiar',
        description: 'Variedad de platos para toda la familia',
        price: 25.99,
        imgUrl: 'assets/images/lunch.png',
        category: 'Almuerzo',
      ),
      MenuProducto(
        id: '3',
        name: 'Almuerzo Vegetariano',
        description: 'Opción saludable sin carne',
        price: 15.99,
        imgUrl: 'assets/images/lunch.png',
        category: 'Almuerzo',
      ),
      MenuProducto(
        id: '4',
        name: 'Almuerzo Premium',
        description: 'Nuestra selección más exclusiva',
        price: 35.99,
        imgUrl: 'assets/images/lunch.png',
        category: 'Almuerzo',
      ),
    ];

    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            'Almuerzos',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontFamily: 'Dancing Script',
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.8,
              ),
              itemCount: lunchItems.length,
              itemBuilder: (context, index) {
                return MenuGridCardWidget(
                  menuItem: lunchItems[index],
                  onTap: () {
                    // Aquí se puede navegar al detalle del menú
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Fragment para Antojitos
class SnackFragment extends StatelessWidget {
  const SnackFragment({super.key});

  @override
  Widget build(BuildContext context) {
    final List<MenuProducto> snackItems = [
      MenuProducto(
        id: '1',
        name: 'Empanadas',
        description: 'Empanadas de carne y pollo',
        price: 8.99,
        imgUrl: 'assets/images/ic_snack.xml',
        category: 'Antojito',
      ),
      MenuProducto(
        id: '2',
        name: 'Arepas',
        description: 'Arepas rellenas de queso',
        price: 6.99,
        imgUrl: 'assets/images/ic_snack.xml',
        category: 'Antojito',
      ),
      MenuProducto(
        id: '3',
        name: 'Tequeños',
        description: 'Deditos de queso envueltos',
        price: 7.99,
        imgUrl: 'assets/images/ic_snack.xml',
        category: 'Antojito',
      ),
      MenuProducto(
        id: '4',
        name: 'Cachapas',
        description: 'Cachapas con queso y mantequilla',
        price: 9.99,
        imgUrl: 'assets/images/ic_snack.xml',
        category: 'Antojito',
      ),
    ];

    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            'Antojitos',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontFamily: 'Dancing Script',
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.8,
              ),
              itemCount: snackItems.length,
              itemBuilder: (context, index) {
                return MenuGridCardWidget(
                  menuItem: snackItems[index],
                  onTap: () {
                    // Aquí se puede navegar al detalle del antojito
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Fragment para Buffet
class BuffetFragment extends StatelessWidget {
  const BuffetFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            'Nuestros Servicios',
            style: Theme.of(
              context,
            ).textTheme.headlineMedium?.copyWith(color: AppColors.textPrimary),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildServiceSection(
                    'Servicios Sociales',
                    'Celebraciones especiales y eventos únicos',
                    'assets/images/portada_sociales.jpg',
                    'Ver Servicios',
                  ),
                  const SizedBox(height: 20),
                  _buildServiceSection(
                    'Quinceañeras',
                    'Momentos inolvidables para celebrar',
                    'assets/images/portada_quince.jpg',
                    'Ver Quinceañeras',
                  ),
                  const SizedBox(height: 20),
                  _buildServiceSection(
                    'Cristalería',
                    'Elegancia y sofisticación en cada detalle',
                    'assets/images/portada_cristaleria.jpg',
                    'Ver Cristalería',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceSection(
    String title,
    String description,
    String imagePath,
    String buttonText,
  ) {
    return GlassmorphismCard(
      borderRadius: 20,
      backgroundColor: AppColors.surface,
      blur: 20,
      opacity: 0.25,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            GlassmorphismContainer(
              borderRadius: 16,
              backgroundColor: AppColors.surfaceLight,
              blur: 12,
              opacity: 0.15,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  imagePath,
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              description,
              style: const TextStyle(
                fontSize: 16,
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            GlassmorphismButton(
              borderRadius: 12,
              backgroundColor: AppColors.orange500,
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
              blur: 15,
              opacity: 0.3,
              onPressed: () {},
              child: Text(
                buttonText,
                style: const TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Fragment para Perfil
class ProfileFragment extends StatelessWidget {
  const ProfileFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          GlassmorphismContainer(
            borderRadius: 60,
            width: 120,
            height: 120,
            backgroundColor: AppColors.surface,
            blur: 20,
            opacity: 0.2,
            child: CircleAvatar(
              radius: 60,
              backgroundImage: const AssetImage(
                'assets/images/facebook_avatar.png',
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Mi Perfil',
            style: Theme.of(
              context,
            ).textTheme.headlineMedium?.copyWith(color: AppColors.textPrimary),
          ),
          const SizedBox(height: 30),
          _buildProfileOption(
            Icons.person,
            'Información Personal',
            'Editar datos del perfil',
            () {},
          ),
          _buildProfileOption(
            Icons.settings,
            'Configuración',
            'Ajustes de la aplicación',
            () {},
          ),
          _buildProfileOption(
            Icons.notifications,
            'Notificaciones',
            'Gestionar alertas',
            () {},
          ),
          _buildProfileOption(
            Icons.security,
            'Privacidad',
            'Configurar privacidad',
            () {},
          ),
          const SizedBox(height: 40),
          SizedBox(
            width: double.infinity,
            child: GlassmorphismButton(
              borderRadius: 16,
              backgroundColor: AppColors.error,
              padding: const EdgeInsets.symmetric(vertical: 16),
              blur: 15,
              opacity: 0.3,
              onPressed: () {
                context.go('/login');
              },
              child: const Text(
                'Cerrar Sesión',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildProfileOption(
    IconData icon,
    String title,
    String subtitle,
    VoidCallback onTap,
  ) {
    return GlassmorphismCard(
      margin: const EdgeInsets.only(bottom: 16),
      borderRadius: 16,
      backgroundColor: AppColors.surface,
      blur: 15,
      opacity: 0.2,
      onTap: onTap,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        leading: GlassmorphismContainer(
          borderRadius: 50,
          backgroundColor: AppColors.orange500,
          width: 50,
          height: 50,
          blur: 10,
          opacity: 0.4,
          child: Icon(icon, color: AppColors.white, size: 24),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: AppColors.textPrimary,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(color: AppColors.textSecondary, fontSize: 14),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: AppColors.textTertiary,
        ),
      ),
    );
  }
}
