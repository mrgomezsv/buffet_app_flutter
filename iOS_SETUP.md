# Configuración de iOS para Buffet App

## ✅ Problema de Dependencias Resuelto

Las dependencias problemáticas de Firebase y Google Sign-In han sido comentadas temporalmente para resolver los conflictos de CocoaPods. La aplicación ahora funciona con autenticación local.

## 🔧 Configuración de Certificados iOS

### Problema Actual
```
No profiles for 'com.buffetapp.pro.buffetApp' were found: Xcode couldn't find any iOS App Development provisioning profiles matching 'com.buffetapp.pro.buffetApp'.
```

### Solución

#### Opción 1: Configuración Automática (Recomendada)
```bash
flutter build ios --debug --allow-provisioning-updates
```

#### Opción 2: Configuración Manual en Xcode

1. **Abrir el proyecto en Xcode:**
   ```bash
   open ios/Runner.xcworkspace
   ```

2. **Configurar el Bundle Identifier:**
   - Selecciona el proyecto "Runner" en el navegador
   - Ve a la pestaña "General"
   - Cambia "Bundle Identifier" a algo único como:
     - `com.tuempresa.buffetapp`
     - `com.tunombre.buffetapp`
     - `com.buffetapp.dev`

3. **Configurar el Team de Desarrollo:**
   - En la misma pestaña "General"
   - En "Signing & Capabilities"
   - Selecciona tu "Team" de Apple Developer
   - Marca "Automatically manage signing"

4. **Verificar Certificados:**
   - Ve a Xcode > Preferences > Accounts
   - Asegúrate de que tu Apple ID esté agregado
   - Haz clic en "Download Manual Profiles" si es necesario

#### Opción 3: Usar Simulador (Más Simple)
```bash
# Listar simuladores disponibles
flutter devices

# Ejecutar en simulador
flutter run -d "iPhone 16 Pro Max"
```

## 🚀 Ejecutar la Aplicación

### En Simulador (Recomendado para desarrollo)
```bash
flutter run -d "iPhone 16 Pro Max"
```

### En Dispositivo Físico
```bash
# Primero configurar certificados en Xcode
flutter run -d "iPhone de Mario"
```

### Compilar para Distribución
```bash
flutter build ios --release
```

## 📱 Configuración del Proyecto iOS

### Bundle Identifier
El Bundle Identifier actual es: `com.buffetapp.pro.buffetApp`

**Recomendación:** Cambiarlo a algo más simple como:
- `com.tuempresa.buffetapp`
- `com.tunombre.buffetapp`

### Deployment Target
- **iOS mínimo:** 13.0
- **Xcode recomendado:** 16.0+

### Configuración de Signing
- **Automático:** Recomendado para desarrollo
- **Manual:** Solo si tienes experiencia con certificados

## 🔍 Verificación de Configuración

### 1. Verificar Flutter
```bash
flutter doctor
```

### 2. Verificar Dispositivos
```bash
flutter devices
```

### 3. Verificar Dependencias
```bash
flutter pub get
flutter analyze
```

### 4. Verificar iOS
```bash
cd ios
pod install
cd ..
```

## 🛠️ Solución de Problemas Comunes

### Error: "No profiles found"
**Solución:** Configurar certificados en Xcode o usar simulador

### Error: "Bundle identifier not found"
**Solución:** Cambiar Bundle Identifier en Xcode

### Error: "Team not found"
**Solución:** Agregar Apple ID en Xcode > Preferences > Accounts

### Error: "Provisioning profile not found"
**Solución:** Marcar "Automatically manage signing" en Xcode

## 📋 Checklist de Configuración

- [ ] Flutter doctor sin errores
- [ ] Dependencias instaladas (`flutter pub get`)
- [ ] Análisis sin errores (`flutter analyze`)
- [ ] Pods instalados (`cd ios && pod install`)
- [ ] Bundle Identifier configurado
- [ ] Team de desarrollo seleccionado
- [ ] Signing automático habilitado
- [ ] Certificados descargados

## 🎯 Próximos Pasos

1. **Configurar certificados iOS** (opcional para desarrollo)
2. **Ejecutar en simulador** (recomendado)
3. **Probar funcionalidad básica**
4. **Re-habilitar Firebase** cuando se resuelvan los conflictos

## 📚 Recursos Adicionales

- [Flutter iOS Setup](https://flutter.dev/docs/get-started/install/macos#ios-setup)
- [Xcode Signing](https://developer.apple.com/support/code-signing/)
- [Apple Developer Program](https://developer.apple.com/programs/)

## ⚠️ Notas Importantes

- **Firebase está temporalmente deshabilitado** para resolver conflictos de iOS
- **La aplicación funciona con autenticación local**
- **Los certificados iOS son necesarios solo para dispositivos físicos**
- **El simulador no requiere certificados**

## 🆘 Soporte

Si tienes problemas:
1. Revisa este archivo
2. Ejecuta `flutter doctor -v`
3. Verifica la configuración en Xcode
4. Usa el simulador para desarrollo
