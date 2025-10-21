import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart'; // Paqueteria GeoLocator

class Gps extends StatefulWidget {
  const Gps({super.key});

  @override
  State<Gps> createState() => _GpsState();
}

class _GpsState extends State<Gps> {
  String _coordenadas = "Coordenadas no disponibles";

  // Función para verificar permisos y obtener ubicación actual
  Future<void> _obtenerUbicacion() async {
    bool servicioActivo;
    LocationPermission permiso;

    // Verificar si el servicio de GPS está activado
    servicioActivo = await Geolocator.isLocationServiceEnabled();
    if (!servicioActivo) {
      setState(() {
        _coordenadas = "El GPS está desactivado. Por favor, actívalo.";
      });
      return;
    }

    // Verificar el permiso actual
    permiso = await Geolocator.checkPermission();

    // Si el permiso está denegado, lo solicitamos
    if (permiso == LocationPermission.denied) {
      permiso = await Geolocator.requestPermission();
      if (permiso == LocationPermission.denied) {
        setState(() {
          _coordenadas = "Permiso denegado por el usuario.";
        });
        return;
      }
    }

    // Si el permiso está denegado permanentemente, mostramos un mensaje
    if (permiso == LocationPermission.deniedForever) {
      setState(() {
        _coordenadas =
            "Permisos permanentemente denegados. Activa el acceso en ajustes.";
      });
      return;
    }

    // Obtener la ubicación actual del dispositivo
    Position posicion = await Geolocator.getCurrentPosition(
        // ignore: deprecated_member_use
        desiredAccuracy: LocationAccuracy.high);

    // Mostrar las coordenadas en pantalla
    setState(() {
      _coordenadas =
          "Latitud: ${posicion.latitude}, Longitud: ${posicion.longitude}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ubicación GPS"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _coordenadas,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _obtenerUbicacion,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3333FF),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                ),
                child: const Text(
                  "Obtener Ubicación",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
