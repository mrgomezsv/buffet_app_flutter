import "package:flutter/material.dart";

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Registro")),
      body: const Center(
        child: Text(
          "Pantalla de Registro - En Desarrollo",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
