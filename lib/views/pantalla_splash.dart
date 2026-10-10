import 'dart:async';

import 'package:flutter/material.dart';

import '../tema/app_tema.dart';
import 'pantalla_principal.dart';

/// Pantalla de bienvenida: logo animado + indicador de carga.
/// Pasa sola a la pantalla principal a los 3 segundos.
class PantallaSplash extends StatefulWidget {
  const PantallaSplash({super.key});

  @override
  State<PantallaSplash> createState() => _PantallaSplashState();
}

class _PantallaSplashState extends State<PantallaSplash>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controlador;
  late final Animation<double> _opacidad;
  late final Animation<double> _escala;
  Timer? _temporizador;

  @override
  void initState() {
    super.initState();

    _controlador = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    )..forward();

    _opacidad = CurvedAnimation(parent: _controlador, curve: Curves.easeIn);
    _escala = Tween<double>(begin: 0.7, end: 1.0).animate(
      CurvedAnimation(parent: _controlador, curve: Curves.easeOutBack),
    );

    // Transición automática después de 3 segundos.
    _temporizador = Timer(const Duration(seconds: 3), _irAPrincipal);
  }

  void _irAPrincipal() {
    if (!mounted) return;
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 600),
        pageBuilder: (_, __, ___) => const PantallaPrincipal(),
        transitionsBuilder: (_, animacion, __, hijo) =>
            FadeTransition(opacity: animacion, child: hijo),
      ),
    );
  }

  @override
  void dispose() {
    _temporizador?.cancel();
    _controlador.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Paleta.espresso,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeTransition(
              opacity: _opacidad,
              child: ScaleTransition(
                scale: _escala,
                child: Image.asset('assets/images/logo.png', width: 170),
              ),
            ),
            const SizedBox(height: 28),
            FadeTransition(
              opacity: _opacidad,
              child: Column(
                children: const [
                  Text(
                    'Origen',
                    style: TextStyle(
                      fontFamily: fuenteTitulo,
                      fontSize: 42,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 2,
                      color: Paleta.crema,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Guía de café de especialidad',
                    style: TextStyle(
                      fontSize: 16,
                      color: Paleta.caramelo,
                      letterSpacing: 0.8,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 56),
            const CircularProgressIndicator(
              color: Paleta.caramelo,
              strokeWidth: 3,
            ),
          ],
        ),
      ),
    );
  }
}
