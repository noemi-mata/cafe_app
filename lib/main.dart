import 'package:flutter/material.dart';

import 'tema/app_tema.dart';
import 'views/pantalla_splash.dart';

void main() => runApp(const OrigenApp());

class OrigenApp extends StatelessWidget {
  const OrigenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Origen',
      debugShowCheckedModeBanner: false,
      theme: temaApp(),
      home: const PantallaSplash(),
    );
  }
}
