import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> campos = [
      "Nombre",
      "Apellido Paterno",
      "Apellido Materno",
      "Correo",
      "Teléfono",
      "Contraseña",
      "Confirmar Contraseña"
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Registro"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            for (var campo in campos)
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: TextField(
                  obscureText: campo.toLowerCase().contains("contraseña"),
                  decoration: InputDecoration(labelText: campo),
                ),
              ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF3333FF),
                padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 40),
              ),
              child: const Text(
                "Registrarse",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
