import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../models/menu_producto.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final List<MenuProducto> _menuItems = [
    MenuProducto(
      id: '1',
      name: 'Menú Ejecutivo',
      description: 'Plato principal, sopa, ensalada y bebida',
      price: 12.99,
      imgUrl: 'assets/images/ic_buffet_food.xml',
      category: 'Almuerzo',
    ),
    MenuProducto(
      id: '2',
      name: 'Buffet Familiar',
      description: 'Variedad de platos para toda la familia',
      price: 25.99,
      imgUrl: 'assets/images/ic_buffet_food.xml',
      category: 'Buffet',
    ),
    MenuProducto(
      id: '3',
      name: 'Menú Vegetariano',
      description: 'Opción saludable sin carne',
      price: 15.99,
      imgUrl: 'assets/images/ic_buffet_food.xml',
      category: 'Especial',
    ),
    MenuProducto(
      id: '4',
      name: 'Paquete Fiesta',
      description: 'Ideal para celebraciones y eventos',
      price: 35.99,
      imgUrl: 'assets/images/ic_buffet_food.xml',
      category: 'Eventos',
    ),
    MenuProducto(
      id: '5',
      name: 'Menú Infantil',
      description: 'Especialmente diseñado para niños',
      price: 8.99,
      imgUrl: 'assets/images/ic_buffet_food.xml',
      category: 'Infantil',
    ),
    MenuProducto(
      id: '6',
      name: 'Buffet Premium',
      description: 'Nuestra selección más exclusiva',
      price: 45.99,
      imgUrl: 'assets/images/ic_buffet_food.xml',
      category: 'Premium',
    ),
  ];

  String _selectedCategory = 'Todos';

  final List<String> _categories = [
    'Todos',
    'Almuerzo',
    'Buffet',
    'Especial',
    'Eventos',
    'Infantil',
    'Premium',
  ];

  List<MenuProducto> get _filteredItems {
    if (_selectedCategory == 'Todos') {
      return _menuItems;
    }
    return _menuItems
        .where((item) => item.category == _selectedCategory)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Nuestros Menús'),
        backgroundColor: AppColors.orange500,
        foregroundColor: AppColors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Filtro de categorías
          Container(
            height: 60,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _categories.length,
              itemBuilder: (context, index) {
                final category = _categories[index];
                final isSelected = _selectedCategory == category;

                return Container(
                  margin: const EdgeInsets.only(right: 12),
                  child: FilterChip(
                    label: Text(category),
                    selected: isSelected,
                    onSelected: (selected) {
                      setState(() {
                        _selectedCategory = category;
                      });
                    },
                    selectedColor: AppColors.orange500,
                    checkmarkColor: AppColors.white,
                    labelStyle: TextStyle(
                      color: isSelected ? AppColors.white : AppColors.gris,
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                );
              },
            ),
          ),

          // Lista de menús
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _filteredItems.length,
              itemBuilder: (context, index) {
                final menuItem = _filteredItems[index];
                return _buildMenuCard(menuItem);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuCard(MenuProducto menuItem) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColors.orange500, AppColors.orange700],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              // Icono del menú
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: AppColors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.restaurant_menu,
                  size: 40,
                  color: AppColors.white,
                ),
              ),

              const SizedBox(width: 16),

              // Información del menú
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      menuItem.name,
                      style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      menuItem.description,
                      style: TextStyle(
                        color: AppColors.white.withOpacity(0.9),
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            menuItem.category,
                            style: const TextStyle(
                              color: AppColors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Text(
                          '\$${menuItem.price.toStringAsFixed(2)}',
                          style: const TextStyle(
                            color: AppColors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
