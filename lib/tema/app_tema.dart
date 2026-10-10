import 'package:flutter/material.dart';

/// Paleta de la app "Origen" (café de especialidad).
class Paleta {
  static const Color espresso = Color(0xFF3E2723);
  static const Color cafe = Color(0xFF6F4E37);
  static const Color crema = Color(0xFFF5EBDD);
  static const Color lienzo = Color(0xFFFBF6EE);
  static const Color terracota = Color(0xFFC8693B);
  static const Color caramelo = Color(0xFFD9A15B);
}

/// Familia tipográfica para títulos (serif del sistema, sin paquetes extra).
const String fuenteTitulo = 'serif';

ThemeData temaApp() {
  final esquema = ColorScheme.fromSeed(
    seedColor: Paleta.cafe,
    primary: Paleta.cafe,
    secondary: Paleta.terracota,
    brightness: Brightness.light,
  );

  return ThemeData(
    useMaterial3: true,
    colorScheme: esquema,
    scaffoldBackgroundColor: Paleta.lienzo,
    appBarTheme: const AppBarTheme(
      backgroundColor: Paleta.lienzo,
      foregroundColor: Paleta.espresso,
      elevation: 0,
      centerTitle: false,
      titleTextStyle: TextStyle(
        fontFamily: fuenteTitulo,
        color: Paleta.espresso,
        fontSize: 26,
        fontWeight: FontWeight.w800,
        letterSpacing: 0.5,
      ),
    ),
  );
}
