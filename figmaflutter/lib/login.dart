import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController correoController = TextEditingController();
    final TextEditingController contrasenaController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Inicio de Sesión"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: correoController,
              decoration: const InputDecoration(labelText: "Correo"),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: contrasenaController,
              obscureText: true,
              decoration: const InputDecoration(labelText: "Contraseña"),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF3333FF),
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              child: const Text(
                "Iniciar Sesión",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
