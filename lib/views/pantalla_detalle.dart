import 'package:flutter/material.dart';

import '../modelos/cafe.dart';
import '../tema/app_tema.dart';

/// Pantalla de detalle: recibe el objeto [Cafe] seleccionado.
class PantallaDetalle extends StatefulWidget {
  final Cafe cafe;

  const PantallaDetalle({super.key, required this.cafe});

  @override
  State<PantallaDetalle> createState() => _PantallaDetalleState();
}

class _PantallaDetalleState extends State<PantallaDetalle> {
  late bool _favorito;

  @override
  void initState() {
    super.initState();
    _favorito = widget.cafe.favorito;
  }

  void _alternarFavorito() {
    setState(() {
      _favorito = !_favorito;
      widget.cafe.favorito = _favorito;
    });
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(_favorito
              ? '${widget.cafe.nombre} agregado a favoritos'
              : '${widget.cafe.nombre} quitado de favoritos'),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    final cafe = widget.cafe;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // ---- Imagen destacada con efecto Hero
          SliverAppBar(
            expandedHeight: 320,
            pinned: true,
            backgroundColor: Paleta.cafe,
            automaticallyImplyLeading: false,
            leading: Padding(
              padding: const EdgeInsets.all(8),
              child: CircleAvatar(
                backgroundColor: Colors.white.withAlpha(220),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Paleta.espresso),
                  // Devuelve el estado de favorito a la pantalla anterior.
                  onPressed: () => Navigator.pop(context, _favorito),
                ),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: 'cafe-${cafe.id}',
                child: Image.asset(cafe.imagen, fit: BoxFit.cover),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 22, 20, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cafe.nombre,
                    style: const TextStyle(
                      fontFamily: fuenteTitulo,
                      fontSize: 32,
                      fontWeight: FontWeight.w800,
                      color: Paleta.espresso,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(Icons.place_outlined,
                          size: 18, color: Paleta.terracota),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          cafe.origen,
                          style: TextStyle(
                              fontSize: 15, color: Colors.brown.shade400),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // ---- Iconos informativos
                  Row(
                    children: [
                      _DatoInfo(
                        icono: Icons.timer_outlined,
                        valor: '${cafe.minutos} min',
                        etiqueta: 'Preparación',
                      ),
                      const SizedBox(width: 10),
                      _DatoInfo(
                        icono: Icons.payments_outlined,
                        valor: '\$${cafe.precio.toStringAsFixed(0)}',
                        etiqueta: 'Precio',
                      ),
                      const SizedBox(width: 10),
                      _DatoInfo(
                        icono: Icons.star_rounded,
                        valor: cafe.calificacion.toStringAsFixed(1),
                        etiqueta: 'Calificación',
                      ),
                    ],
                  ),

                  const _Titulo('Descripción'),
                  Text(
                    cafe.descripcion,
                    style: const TextStyle(
                        fontSize: 15.5, height: 1.5, color: Paleta.espresso),
                  ),

                  const _Titulo('Notas de cata'),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      for (final nota in cafe.notas)
                        Chip(
                          label: Text(nota),
                          backgroundColor: Paleta.crema,
                          side: BorderSide.none,
                          labelStyle: const TextStyle(
                            color: Paleta.cafe,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                    ],
                  ),

                  const _Titulo('Preparación'),
                  for (int i = 0; i < cafe.preparacion.length; i++)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 13,
                            backgroundColor: Paleta.terracota,
                            child: Text(
                              '${i + 1}',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              cafe.preparacion[i],
                              style: const TextStyle(
                                  fontSize: 15, height: 1.4),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),

      // ---- Botón de acción
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
          child: Row(
            children: [
              Expanded(
                child: FilledButton.icon(
                  onPressed: _alternarFavorito,
                  style: FilledButton.styleFrom(
                    backgroundColor:
                        _favorito ? Paleta.terracota : Paleta.cafe,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  icon: Icon(_favorito ? Icons.favorite : Icons.favorite_border),
                  label: Text(
                    _favorito ? 'Quitar de favoritos' : 'Agregar a favoritos',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              IconButton.outlined(
                tooltip: 'Compartir',
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Compartir ${cafe.nombre}')),
                  );
                },
                icon: const Icon(Icons.share_outlined),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Titulo extends StatelessWidget {
  final String texto;
  const _Titulo(this.texto);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 26, bottom: 10),
      child: Text(
        texto,
        style: const TextStyle(
          fontFamily: fuenteTitulo,
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: Paleta.espresso,
        ),
      ),
    );
  }
}

class _DatoInfo extends StatelessWidget {
  final IconData icono;
  final String valor;
  final String etiqueta;

  const _DatoInfo({
    required this.icono,
    required this.valor,
    required this.etiqueta,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: Paleta.crema,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Icon(icono, color: Paleta.terracota, size: 26),
            const SizedBox(height: 6),
            Text(
              valor,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w800,
                color: Paleta.espresso,
              ),
            ),
            Text(
              etiqueta,
              style: TextStyle(fontSize: 12, color: Colors.brown.shade400),
            ),
          ],
        ),
      ),
    );
  }
}
