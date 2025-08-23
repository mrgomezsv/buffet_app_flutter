import "package:flutter/material.dart";

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menú"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Text(
          "Pantalla de Menú - En Desarrollo",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
