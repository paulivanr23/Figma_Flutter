# Figma_Flutter
Esta documentación explica los cambios realizados en la aplicación Flutter para integrar la librería Geolocator, que permite obtener las coordenadas GPS del dispositivo.
También detalla los pasos que debe seguir el usuario para instalar la dependencia, otorgar permisos de ubicación y entender los nuevos componentes añadidos a la aplicación.

Se agregó una nueva pantalla llamada gps.dart, la cual contiene:

- Un botón con el diseño personalizado de la app “Obtener Ubicación”.
- Una función que solicita permisos de ubicación al usuario.
- Obtención de la latitud y longitud actuales del dispositivo.
- Visualización en pantalla de las coordenadas obtenidas.

Librería utilizada: Geolocator

Para instalarla, el usuario debe ejecutar en la terminal del proyecto:

flutter pub add geolocator

Esto añadirá la siguiente línea al archivo pubspec.yaml del proyecto:

dependencies:
	geolocator: ^12.0.0    (la versión puede variar)

Editar el archivo:

android/app/src/main/AndroidManifest.xml

Antes de la etiqueta <application>, agregar lo siguiente:

<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />

Dentro de <application>, asegurarse de incluir:

<uses-library android:name="org.apache.http.legacy" android:required="false"/>

Cambios en la Aplicación:

Pantalla principal con botones "Login", "Sign Up" y "Ver Ubicación GPS"
Se agregó navegación hacia la nueva pantalla gps.dart

gps_page.dart
Nueva pantalla con:
- AppBar con botón de regreso
- Texto para mostrar coordenadas
- Botón personalizado para obtener ubicación
- Función _obtenerUbicacion() con control de permisos

La función _obtenerUbicacion() realiza los siguientes pasos:

- Verifica si el servicio de ubicación del dispositivo está activado.
- Comprueba si la app tiene permisos de acceso a la ubicación.
- Si los permisos fueron denegados, los solicita al usuario.
- Si el usuario los deniega permanentemente, muestra un mensaje indicando que debe habilitarlos manualmente.
- Obtiene las coordenadas GPS (latitud y longitud) con alta precisión.
- Muestra los valores en pantalla.

Todos los botones “Login”, “Sign Up” y “Ver Ubicación GPS” comparten el mismo diseño gracias al widget BotonPersonalizado el cual tiene:

- Fondo azul (#3333FF)
- Texto blanco
- Bordes redondeados
- Sombra negra
- Reutilizable mediante parámetros de color y texto

Instrucciones para ejecutar el proyecto:

- Asegúrate de tener Flutter instalado y configurado.
- Abre la carpeta del proyecto en VS Code o Android Studio.
- Ejecuta el siguiente comando para instalar dependencias:	flutter pub get
- Conecta un dispositivo físico o inicia un emulador Android/iOS.
- Ejecuta la app con:	flutter run
Una vez en la app:
- Pulsa el botón “Ver Ubicación GPS”
- Luego presiona “Obtener Ubicación”
- Acepta los permisos solicitados por el sistema operativo
- Verás tus coordenadas GPS en pantalla

El sistema solicitará los siguientes permisos:

- ACCESS_FINE_LOCATION: permite obtener la ubicación precisa (latitud y longitud exactas).
- ACCESS_COARSE_LOCATION: permite obtener una ubicación aproximada.