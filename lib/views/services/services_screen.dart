import "package:flutter/material.dart";

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Servicios"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Text(
          "Pantalla de Servicios - En Desarrollo",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
