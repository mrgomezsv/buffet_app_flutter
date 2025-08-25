# Configuración de Firebase para Buffet App

## Requisitos Previos

1. Tener una cuenta de Google
2. Acceso a [Firebase Console](https://console.firebase.google.com/)
3. Flutter SDK instalado
4. FlutterFire CLI instalado

## Pasos para Configurar Firebase

### 1. Instalar FlutterFire CLI

```bash
dart pub global activate flutterfire_cli
```

### 2. Crear Proyecto en Firebase Console

1. Ve a [Firebase Console](https://console.firebase.google.com/)
2. Haz clic en "Crear un proyecto"
3. Nombra tu proyecto (ej: "buffet-app-dev")
4. Sigue los pasos del asistente

### 3. Configurar FlutterFire

Desde la raíz de tu proyecto Flutter:

```bash
flutterfire configure
```

Este comando:
- Te pedirá seleccionar tu proyecto de Firebase
- Configurará las plataformas (Android, iOS, Web)
- Generará automáticamente `firebase_options.dart`

### 4. Configurar Autenticación

1. En Firebase Console, ve a "Authentication" > "Sign-in method"
2. Habilita "Email/Password"
3. Habilita "Google" (opcional)
4. Para Google Sign-In, configura el SHA-1 de tu proyecto Android

### 5. Configurar Firestore

1. En Firebase Console, ve a "Firestore Database"
2. Crea una base de datos en modo de prueba
3. Configura las reglas de seguridad según tus necesidades

### 6. Configurar Google Sign-In (Android)

Para obtener el SHA-1 de tu proyecto:

```bash
cd android
./gradlew signingReport
```

Luego agrega este SHA-1 en la configuración de Google Sign-In en Firebase Console.

### 7. Configurar Google Sign-In (iOS)

1. Descarga el archivo `GoogleService-Info.plist` de Firebase Console
2. Agrégalo a tu proyecto iOS en Xcode
3. Configura el Bundle ID en Firebase Console

## Estructura de Datos en Firestore

### Colección: users
```json
{
  "uid": "string",
  "name": "string",
  "email": "string",
  "photoURL": "string (opcional)",
  "createdAt": "timestamp",
  "phone": "string (opcional)",
  "address": "string (opcional)"
}
```

### Colección: menu_items
```json
{
  "id": "string",
  "name": "string",
  "description": "string",
  "price": "number",
  "category": "string",
  "imageUrl": "string (opcional)",
  "ingredients": ["string"],
  "allergens": ["string"],
  "preparationTime": "number (minutos)",
  "isAvailable": "boolean"
}
```

### Colección: orders
```json
{
  "id": "string",
  "userId": "string",
  "items": [
    {
      "itemId": "string",
      "quantity": "number",
      "price": "number"
    }
  ],
  "total": "number",
  "status": "string (pending, confirmed, preparing, ready, delivered)",
  "createdAt": "timestamp",
  "deliveryAddress": "string",
  "notes": "string (opcional)"
}
```

## Variables de Entorno

Crea un archivo `.env` en la raíz del proyecto:

```env
FIREBASE_API_KEY=tu_api_key_aqui
FIREBASE_PROJECT_ID=tu_project_id_aqui
FIREBASE_MESSAGING_SENDER_ID=tu_sender_id_aqui
FIREBASE_APP_ID=tu_app_id_aqui
```

## Solución de Problemas Comunes

### Error: "Firebase not available"
- Verifica que `flutterfire configure` se ejecutó correctamente
- Asegúrate de que `firebase_options.dart` existe y tiene valores válidos

### Error: "Google Sign-In not available"
- Verifica la configuración de Google Sign-In en Firebase Console
- Asegúrate de que el SHA-1 esté configurado correctamente

### Error: "Permission denied"
- Verifica las reglas de seguridad de Firestore
- Asegúrate de que la autenticación esté configurada correctamente

## Notas de Desarrollo

- La aplicación está configurada para funcionar tanto con Firebase como sin él
- Si Firebase no está disponible, se usa autenticación local
- Para producción, asegúrate de configurar Firebase correctamente
- Las reglas de seguridad de Firestore deben ser más restrictivas en producción

## Recursos Adicionales

- [Documentación de Firebase](https://firebase.google.com/docs)
- [FlutterFire Documentation](https://firebase.flutter.dev/)
- [Firebase Console](https://console.firebase.google.com/)
