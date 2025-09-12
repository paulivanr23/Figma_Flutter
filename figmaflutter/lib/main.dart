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
          child: BotonPersonalizado(
            texto: 'Click Me',
            onPressed: null, // Aquí puedes definir la función que se ejecutará al presionar el botón
          ),
        ),
      ),
    );
  }
}

class BotonPersonalizado extends StatelessWidget{
  final String texto;
  final VoidCallback? onPressed;

  const BotonPersonalizado({
    super.key,
    required this.texto,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: const Color(0xFF3333FF),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF000000).withOpacity(0.2),
              offset: const Offset(0, 4),
              blurRadius: 6,
            ),
          ],
        ),
        child: Text(
          texto,
          style: const TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}