# Buffet App - Flutter Version

## Descripción

Esta es la versión Flutter del proyecto Buffet App, migrado desde la versión original en Kotlin/Android. La aplicación mantiene toda la funcionalidad, estilos y lógica del proyecto original, pero ahora implementada en Flutter para mayor flexibilidad y compatibilidad multiplataforma.

## Características

- 🍽️ **Gestión de Menús**: Buffet, Almuerzo, Snacks, Antojitos
- 👥 **Sistema de Usuarios**: Registro, login y perfiles
- 📱 **UI Moderna**: Diseño Material 3 con animaciones fluidas
- 🔄 **Estado Reactivo**: Gestión de estado con Riverpod
- 🎨 **Tema Personalizado**: Colores y estilos consistentes
- 📱 **Responsive**: Adaptable a diferentes tamaños de pantalla
- 🔐 **Autenticación**: Sistema de login seguro
- 💾 **Almacenamiento Local**: SharedPreferences y SQLite
- 🌐 **Navegación**: Routing con GoRouter

## Estructura del Proyecto

```
lib/
├── constants/           # Constantes de la aplicación
│   ├── app_colors.dart
│   └── app_strings.dart
├── models/             # Modelos de datos
│   ├── menu_producto.dart
│   ├── antojitos_producto.dart
│   ├── buffet.dart
│   ├── lunch.dart
│   ├── snack.dart
│   ├── news.dart
│   └── user.dart
├── views/              # Pantallas de la aplicación
│   ├── auth/           # Autenticación
│   ├── home/           # Pantalla principal
│   ├── menu/           # Gestión de menús
│   ├── profile/        # Perfil de usuario
│   └── services/       # Servicios disponibles
├── widgets/            # Widgets personalizados
│   ├── custom_button.dart
│   └── custom_text_field.dart
├── controllers/        # Controladores de estado
├── services/           # Servicios y APIs
└── utils/              # Utilidades y helpers
```

## Tecnologías Utilizadas

- **Flutter**: Framework principal
- **Dart**: Lenguaje de programación
- **Riverpod**: Gestión de estado
- **GoRouter**: Navegación
- **SharedPreferences**: Almacenamiento local
- **SQLite**: Base de datos local
- **HTTP/Dio**: Cliente HTTP
- **Cached Network Image**: Carga de imágenes
- **Firebase**: Autenticación y base de datos (opcional)

## Instalación

### Prerrequisitos

- Flutter SDK (versión 3.7.2 o superior)
- Dart SDK
- Android Studio / VS Code
- Emulador Android o dispositivo físico

### Pasos de Instalación

1. **Clonar el repositorio**
   ```bash
   git clone <repository-url>
   cd buffet_flutter/buffet_app
   ```

2. **Instalar dependencias**
   ```bash
   flutter pub get
   ```

3. **Ejecutar la aplicación**
   ```bash
   flutter run
   ```

## Configuración

### Variables de Entorno

Crear un archivo `.env` en la raíz del proyecto:

```env
API_BASE_URL=https://api.buffetapp.com
FIREBASE_PROJECT_ID=your-project-id
```

### Firebase (Opcional)

Si deseas usar Firebase:

1. Crear proyecto en Firebase Console
2. Descargar `google-services.json` (Android) y `GoogleService-Info.plist` (iOS)
3. Colocar en las carpetas correspondientes
4. Habilitar Authentication y Firestore

## Funcionalidades Principales

### 1. Autenticación
- Login con email y contraseña
- Registro de nuevos usuarios
- Recuperación de contraseña
- Sesiones persistentes

### 2. Gestión de Menús
- **Buffet**: Menús completos para eventos
- **Lunch**: Opciones de almuerzo
- **Snacks**: Aperitivos y bocadillos
- **Antojitos**: Comida rápida y tradicional

### 3. Sistema de Usuarios
- Perfiles personalizables
- Historial de pedidos
- Preferencias de usuario
- Configuraciones de la aplicación

### 4. Servicios
- Catering para eventos
- Renta de cristalería
- Organización de bodas
- Eventos corporativos

## Arquitectura

La aplicación sigue el patrón **MVVM** (Model-View-ViewModel) con Riverpod para la gestión de estado:

- **Models**: Clases de datos inmutables
- **Views**: Widgets de UI
- **Controllers**: Lógica de negocio y estado
- **Services**: Acceso a datos y APIs
- **Providers**: Gestión de estado con Riverpod

## Navegación

La aplicación utiliza GoRouter para la navegación entre pantallas:

- `/` - Splash Screen
- `/login` - Pantalla de login
- `/register` - Registro de usuario
- `/home` - Pantalla principal
- `/menu` - Gestión de menús
- `/services` - Servicios disponibles
- `/profile` - Perfil de usuario

## Temas y Estilos

### Colores Principales
- **Primary**: Azul (#1976D2)
- **Secondary**: Naranja (#FF9800)
- **Accent**: Verde (#4CAF50)
- **Background**: Gris claro (#FAFAFA)

### Tipografías
- **Headlines**: Roboto Bold
- **Body**: Roboto Regular
- **Captions**: Roboto Light

## Testing

```bash
# Ejecutar tests unitarios
flutter test

# Ejecutar tests de integración
flutter test integration_test/

# Generar reporte de cobertura
flutter test --coverage
```

## Build y Deploy

### Android
```bash
# Build APK
flutter build apk

# Build App Bundle
flutter build appbundle

# Build para release
flutter build apk --release
```

### iOS
```bash
# Build para iOS
flutter build ios

# Build para release
flutter build ios --release
```

## Contribución

1. Fork el proyecto
2. Crear una rama para tu feature (`git checkout -b feature/AmazingFeature`)
3. Commit tus cambios (`git commit -m 'Add some AmazingFeature'`)
4. Push a la rama (`git push origin feature/AmazingFeature`)
5. Abrir un Pull Request

## Licencia

Este proyecto está bajo la Licencia MIT. Ver el archivo `LICENSE` para más detalles.

## Contacto

- **Desarrollador**: Mario Roberto Gomez Martinez
- **Email**: [tu-email@ejemplo.com]
- **Proyecto**: [URL del repositorio]

## Changelog

### v1.0.0
- Migración completa desde Kotlin a Flutter
- Implementación de todas las funcionalidades principales
- UI moderna con Material 3
- Sistema de navegación con GoRouter
- Gestión de estado con Riverpod

## Roadmap

- [ ] Implementación de notificaciones push
- [ ] Integración con servicios de pago
- [ ] Modo offline completo
- [ ] Soporte para múltiples idiomas
- [ ] Widgets para Android
- [ ] Versión web
- [ ] Integración con wearables

---

**Nota**: Este proyecto es una migración completa desde la versión original en Kotlin. Todas las funcionalidades, estilos y lógica de negocio han sido preservadas y adaptadas al ecosistema Flutter.
