import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../models/menu_producto.dart';
import 'glassmorphism_container.dart';

class MenuCardWidget extends StatelessWidget {
  final MenuProducto menuItem;
  final VoidCallback? onTap;
  final bool showPrice;
  final bool showCategory;

  const MenuCardWidget({
    super.key,
    required this.menuItem,
    this.onTap,
    this.showPrice = true,
    this.showCategory = true,
  });

  @override
  Widget build(BuildContext context) {
    return GlassmorphismCard(
      margin: const EdgeInsets.only(bottom: 16),
      borderRadius: 20,
      backgroundColor: AppColors.orange500,
      blur: 20,
      opacity: 0.3,
      onTap: onTap,
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
              GlassmorphismContainer(
                borderRadius: 12,
                backgroundColor: AppColors.white,
                width: 60,
                height: 60,
                blur: 10,
                opacity: 0.3,
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
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      menuItem.description,
                      style: TextStyle(
                        color: AppColors.white.withOpacity(0.9),
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (showCategory || showPrice) ...[
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          if (showCategory) ...[
                            GlassmorphismContainer(
                              borderRadius: 12,
                              backgroundColor: AppColors.white,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              blur: 8,
                              opacity: 0.3,
                              child: Text(
                                menuItem.category,
                                style: const TextStyle(
                                  color: AppColors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            if (showPrice) const Spacer(),
                          ],
                          if (showPrice)
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

// Widget para tarjetas de menú en grid
class MenuGridCardWidget extends StatelessWidget {
  final MenuProducto menuItem;
  final VoidCallback? onTap;

  const MenuGridCardWidget({super.key, required this.menuItem, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GlassmorphismCard(
      borderRadius: 20,
      backgroundColor: AppColors.orange500,
      blur: 20,
      opacity: 0.3,
      onTap: onTap,
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icono del menú
              Center(
                child: GlassmorphismContainer(
                  borderRadius: 12,
                  backgroundColor: AppColors.white,
                  width: 60,
                  height: 60,
                  blur: 10,
                  opacity: 0.3,
                  child: Icon(
                    Icons.restaurant_menu,
                    size: 40,
                    color: AppColors.white,
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Título del menú
              Text(
                menuItem.name,
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),

              const SizedBox(height: 8),

              // Descripción
              Text(
                menuItem.description,
                style: TextStyle(
                  color: AppColors.white.withOpacity(0.9),
                  fontSize: 14,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),

              const Spacer(),

              // Precio
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GlassmorphismContainer(
                    borderRadius: 12,
                    backgroundColor: AppColors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    blur: 8,
                    opacity: 0.3,
                    child: Text(
                      menuItem.category,
                      style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Text(
                    '\$${menuItem.price.toStringAsFixed(2)}',
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
