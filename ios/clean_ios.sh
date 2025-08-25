#!/bin/bash

echo "🧹 Limpiando iOS..."

# Eliminar directorios generados
rm -rf Pods
rm -rf .symlinks
rm -rf Flutter/Flutter.framework
rm -rf Flutter/Flutter.podspec
rm -rf Flutter/Generated.xcconfig

# Limpiar cache de CocoaPods
pod cache clean --all

# Limpiar cache de Flutter
flutter clean

# Reinstalar dependencias de Flutter
flutter pub get

# Reinstalar pods
pod install --repo-update

echo "✅ Limpieza de iOS completada!"
echo "🚀 Ahora puedes ejecutar la aplicación en iOS"
