# Instrucciones para Ejecutar Buffet App

## Requisitos Previos

- Flutter SDK 3.7.2 o superior
- Dart SDK
- Android Studio / Xcode (para desarrollo móvil)
- VS Code o editor preferido
- Git

## Instalación y Configuración

### 1. Clonar el Repositorio

```bash
git clone <url-del-repositorio>
cd buffet_app
```

### 2. Instalar Dependencias

```bash
flutter pub get
```

### 3. Verificar Flutter

```bash
flutter doctor
```

Resuelve cualquier problema reportado por `flutter doctor`.

### 4. Configurar Firebase (Opcional)

Si quieres usar Firebase:

```bash
# Instalar FlutterFire CLI
dart pub global activate flutterfire_cli

# Configurar Firebase
flutterfire configure
```

Si no configuras Firebase, la aplicación funcionará en modo local.

## Ejecutar la Aplicación

### Desarrollo

```bash
# Ejecutar en modo debug
flutter run

# Ejecutar en dispositivo específico
flutter run -d <device-id>

# Ejecutar en modo hot reload
flutter run --hot
```

### Compilación

```bash
# APK de debug para Android
flutter build apk --debug

# APK de release para Android
flutter build apk --release

# App Bundle para Android
flutter build appbundle

# IPA para iOS
flutter build ios

# Web
flutter build web
```

## Configuración de Dispositivos

### Android

1. Habilita el modo desarrollador en tu dispositivo Android
2. Habilita la depuración USB
3. Conecta el dispositivo por USB
4. Ejecuta `flutter devices` para ver dispositivos disponibles

### iOS

1. Abre el proyecto en Xcode
2. Configura tu equipo de desarrollo
3. Configura el Bundle ID
4. Ejecuta `flutter run` desde VS Code o terminal

## Estructura del Proyecto

```
lib/
├── main.dart                 # Punto de entrada de la aplicación
├── firebase_options.dart     # Configuración de Firebase
├── config/                   # Configuraciones de la aplicación
├── constants/                # Constantes (colores, strings)
├── models/                   # Modelos de datos
├── providers/                # Proveedores de estado (Riverpod)
├── services/                 # Servicios (autenticación, API)
├── views/                    # Pantallas de la aplicación
├── widgets/                  # Widgets reutilizables
└── utils/                    # Utilidades y helpers
```

## Características de la Aplicación

### ✅ Implementado
- [x] Pantalla de splash con animaciones
- [x] Sistema de navegación con GoRouter
- [x] Pantallas básicas (Home, Menu, Services, Profile)
- [x] Sistema de autenticación (Firebase + Local)
- [x] Gestión de estado con Riverpod
- [x] UI personalizada con tema consistente
- [x] Manejo de errores robusto
- [x] Configuración para desarrollo y producción

### 🚧 En Desarrollo
- [ ] Pantalla de menú completa
- [ ] Sistema de carrito de compras
- [ ] Gestión de pedidos
- [ ] Sistema de notificaciones
- [ ] Integración con APIs externas

### 📋 Pendiente
- [ ] Tests unitarios y de integración
- [ ] Documentación de API
- [ ] Configuración de CI/CD
- [ ] Optimización de rendimiento
- [ ] Accesibilidad

## Solución de Problemas

### Error: "Firebase not available"
- La aplicación está configurada para funcionar sin Firebase
- Se usará autenticación local automáticamente
- Para usar Firebase, sigue las instrucciones en `FIREBASE_SETUP.md`

### Error: "Dependencies not found"
```bash
flutter clean
flutter pub get
```

### Error: "Build failed"
```bash
flutter clean
flutter pub get
flutter build apk --debug
```

### Error: "Device not found"
```bash
flutter devices
flutter run -d <device-id>
```

## Comandos Útiles

```bash
# Limpiar proyecto
flutter clean

# Obtener dependencias
flutter pub get

# Actualizar dependencias
flutter pub upgrade

# Ver dispositivos disponibles
flutter devices

# Ejecutar tests
flutter test

# Analizar código
flutter analyze

# Formatear código
dart format .

# Ver información del proyecto
flutter doctor -v
```

## Configuración de Entorno

### Variables de Entorno

Crea un archivo `.env` en la raíz del proyecto:

```env
FLUTTER_ENV=development
FIREBASE_ENABLED=false
API_BASE_URL=http://localhost:3000
```

### Configuración de Desarrollo

La aplicación está configurada para desarrollo por defecto. Los cambios se pueden hacer en:

- `lib/config/dev_config.dart` - Configuración de desarrollo
- `lib/config/app_config.dart` - Configuración general
- `lib/services/firebase_config.dart` - Configuración de Firebase

## Contribución

1. Crea una rama para tu feature
2. Haz tus cambios
3. Ejecuta `flutter analyze` y `flutter test`
4. Crea un pull request

## Soporte

Si tienes problemas:

1. Revisa este archivo
2. Revisa `FIREBASE_SETUP.md` si usas Firebase
3. Ejecuta `flutter doctor -v`
4. Busca en la documentación de Flutter
5. Abre un issue en el repositorio

## Notas Importantes

- La aplicación está configurada para funcionar tanto con Firebase como sin él
- En modo local, se usan SharedPreferences para almacenamiento
- Las imágenes están en `assets/images/`
- Los iconos están en `assets/icons/`
- Las fuentes están en `assets/fonts/`
