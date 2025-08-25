# Buffet App - Flutter

Una aplicación móvil moderna desarrollada en Flutter que replica la funcionalidad y diseño de la aplicación Android original de Buffet.

## 🎯 Características Principales

### 🏠 Pantalla Principal (Home)
- **Image Slider**: Banner rotativo con imágenes promocionales
- **Bottom Navigation**: Navegación entre 4 secciones principales
- **Fragmentos Dinámicos**: Contenido que cambia según la selección del usuario

### 🍽️ Secciones de la Aplicación

#### 1. Almuerzos (Lunch)
- Grid de menús con tarjetas atractivas
- Información detallada de cada plato
- Precios y categorías claramente visibles

#### 2. Antojitos (Snacks)
- Variedad de opciones de aperitivos
- Diseño consistente con el resto de la app
- Navegación intuitiva

#### 3. Buffet (Servicios)
- Catálogo de servicios especiales
- Imágenes de portada para cada categoría
- Botones de acción para cada servicio

#### 4. Mi Perfil
- Información del usuario
- Configuraciones de la aplicación
- Opciones de seguridad y privacidad

### 🎨 Diseño y UI
- **Colores**: Paleta naranja consistente con la marca
- **Tipografía**: Fuentes legibles y jerarquía visual clara
- **Componentes**: Tarjetas, botones y elementos reutilizables
- **Responsive**: Adaptable a diferentes tamaños de pantalla

## 🚀 Instalación y Configuración

### Prerrequisitos
- Flutter SDK 3.7.2 o superior
- Dart SDK
- Android Studio / Xcode (para desarrollo móvil)

### Pasos de Instalación

1. **Clonar el repositorio**
   ```bash
   git clone <repository-url>
   cd buffet_app
   ```

2. **Instalar dependencias**
   ```bash
   flutter pub get
   ```

3. **Ejecutar la aplicación**
   ```bash
   flutter run
   ```

## 📱 Estructura del Proyecto

```
lib/
├── config/           # Configuraciones de la aplicación
├── constants/        # Constantes, colores y strings
├── controllers/      # Controladores de lógica de negocio
├── models/          # Modelos de datos
├── providers/       # Proveedores de estado
├── services/        # Servicios y APIs
├── utils/           # Utilidades y helpers
├── views/           # Pantallas de la aplicación
│   ├── auth/        # Autenticación
│   ├── home/        # Pantalla principal
│   ├── menu/        # Catálogo de menús
│   ├── profile/     # Perfil del usuario
│   └── services/    # Servicios y error de red
├── widgets/         # Widgets reutilizables
└── main.dart        # Punto de entrada
```

## 🎯 Templates Implementados

### Basados en el Proyecto Android Original

1. **Home Screen** (`activity_home.xml`)
   - Image slider con banner promocional
   - Bottom navigation con 4 tabs
   - Fragment container para contenido dinámico

2. **Network Error Screen** (`activity_main_network.xml`)
   - Pantalla de error cuando no hay conexión
   - Imagen ilustrativa y mensaje claro
   - Botón de reintento

3. **Services Screen** (`activity_our_services.xml`)
   - Catálogo de servicios con imágenes
   - Descripciones detalladas
   - Botones de acción para cada servicio

4. **Menu Screen** (`tarjeta_menus.xml`)
   - Tarjetas de menú con gradientes
   - Información completa de cada plato
   - Filtros por categoría

5. **Profile Screen** (basado en `ProfileFragment.kt`)
   - Información del usuario
   - Opciones de configuración
   - Gestión de seguridad y privacidad

## 🔧 Dependencias Principales

- **carousel_slider**: Para el banner rotativo
- **go_router**: Navegación entre pantallas
- **flutter_riverpod**: Gestión de estado
- **shared_preferences**: Almacenamiento local
- **cached_network_image**: Carga de imágenes optimizada

## 🎨 Paleta de Colores

```dart
class AppColors {
  static const Color orange500 = Color(0xFFdb9323);    // Color principal
  static const Color orange700 = Color(0xFFa46500);    // Color secundario
  static const Color background = Color(0xFFFFF8CE);   // Fondo principal
  static const Color background2 = Color(0xFFFAFBF6);  // Fondo secundario
  static const Color gris = Color(0xFF707070);         // Texto secundario
  static const Color black = Color(0xFF000000);        // Texto principal
  static const Color white = Color(0xFFFFFFFF);        // Texto sobre naranja
}
```

## 📱 Navegación

La aplicación utiliza GoRouter para la navegación entre pantallas:

- `/` → Splash Screen
- `/login` → Pantalla de login
- `/register` → Pantalla de registro
- `/home` → Pantalla principal con tabs
- `/menu` → Catálogo de menús
- `/services` → Servicios disponibles
- `/profile` → Perfil del usuario
- `/network-error` → Pantalla de error de red

## 🚀 Próximas Mejoras

- [ ] Integración con Firebase
- [ ] Autenticación de usuarios
- [ ] Base de datos local
- [ ] Notificaciones push
- [ ] Modo offline
- [ ] Tests unitarios y de widgets
- [ ] Internacionalización (i18n)

## 🤝 Contribución

1. Fork el proyecto
2. Crea una rama para tu feature (`git checkout -b feature/AmazingFeature`)
3. Commit tus cambios (`git commit -m 'Add some AmazingFeature'`)
4. Push a la rama (`git push origin feature/AmazingFeature`)
5. Abre un Pull Request

## 📄 Licencia

Este proyecto está bajo la Licencia MIT. Ver el archivo `LICENSE` para más detalles.

## 📞 Contacto

- **Desarrollador**: Mario Gómez
- **Email**: mrgomez@example.com
- **Proyecto**: [Buffet App Flutter](https://github.com/username/buffet_app)

---

**Nota**: Esta aplicación es una versión Flutter del proyecto Android original, manteniendo la misma funcionalidad y diseño visual pero con las ventajas de Flutter como framework multiplataforma.
