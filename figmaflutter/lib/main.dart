import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  BotonPersonalizado(
                    texto: "Login",
                    colorFondo: Color(0xFF3333FF),
                    colorTexto: Color(0xFFFFFFFF),
                    onPressed: null,
                  ),
                  SizedBox(width: 16),
                  BotonPersonalizado(
                    texto: "Sign Up",
                    colorFondo: Color(0xFFFFFFFF),
                    colorTexto: Color(0xFF3333FF),
                    onPressed: null,
                  ),
                ],
              ),

              SizedBox(height: 40),

              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  BotonCirculo(),
                  SizedBox(width: 16),
                  BotonCirculo(),
                  SizedBox(width: 16),
                  BotonCirculo(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BotonPersonalizado extends StatelessWidget {
  final String texto;
  final VoidCallback? onPressed;
  final Color colorFondo;
  final Color colorTexto;

  const BotonPersonalizado({
    super.key,
    required this.texto,
    this.onPressed,
    this.colorFondo = const Color(0xFF3333FF),
    this.colorTexto = const Color(0xFFFFFFFF),
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: colorFondo,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: Color(0xFF000000),
              offset: Offset(0, 4),
              blurRadius: 6,
            ),
          ],
          border: Border.all(
            color: const Color(0xFF3333FF),
            width: 2,
          ),
        ),
        child: Text(
          texto,
          style: TextStyle(
            color: colorTexto,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class BotonCirculo extends StatelessWidget {
  const BotonCirculo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: const BoxDecoration(
        color: Colors.grey,
        shape: BoxShape.circle,
      ),
    );
  }
}
