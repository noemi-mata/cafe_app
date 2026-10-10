import 'package:flutter/material.dart';

import '../modelos/cafe.dart';
import '../tema/app_tema.dart';

/// Tarjeta del catálogo: imagen, título y breve descripción.
class TarjetaCafe extends StatelessWidget {
  final Cafe cafe;
  final VoidCallback onTap;

  const TarjetaCafe({super.key, required this.cafe, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: Colors.white,
      shadowColor: Colors.black.withAlpha(60),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              // Hero: misma etiqueta que en la pantalla de detalle.
              Hero(
                tag: 'cafe-${cafe.id}',
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    cafe.imagen,
                    width: 110,
                    height: 110,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 14),
              // Expanded evita el overflow horizontal con textos largos.
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            cafe.nombre,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontFamily: fuenteTitulo,
                              fontSize: 19,
                              fontWeight: FontWeight.w700,
                              color: Paleta.espresso,
                            ),
                          ),
                        ),
                        if (cafe.favorito)
                          const Icon(Icons.favorite,
                              size: 20, color: Paleta.terracota),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      cafe.descripcionCorta,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 13.5,
                        height: 1.3,
                        color: Colors.brown.shade400,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${cafe.precio.toStringAsFixed(0)}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: Paleta.terracota,
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(Icons.star_rounded,
                                size: 18, color: Paleta.caramelo),
                            const SizedBox(width: 2),
                            Text(
                              cafe.calificacion.toStringAsFixed(1),
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Paleta.espresso,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
