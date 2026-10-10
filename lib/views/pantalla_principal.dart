import 'package:flutter/material.dart';

import '../data/cafes_data.dart';
import '../modelos/cafe.dart';
import '../tema/app_tema.dart';
import '../widgets/tarjeta_cafe.dart';
import 'pantalla_detalle.dart';

/// Pantalla principal: búsqueda, categorías y lista de bebidas.
class PantallaPrincipal extends StatefulWidget {
  const PantallaPrincipal({super.key});

  @override
  State<PantallaPrincipal> createState() => _PantallaPrincipalState();
}

class _PantallaPrincipalState extends State<PantallaPrincipal> {
  final TextEditingController _controladorBusqueda = TextEditingController();
  String _busqueda = '';
  String _categoriaActual = 'Todos';

  /// Lista filtrada por categoría y por texto de búsqueda.
  List<Cafe> get _filtrados {
    return cafes.where((c) {
      final coincideCategoria =
          _categoriaActual == 'Todos' || c.categoria == _categoriaActual;
      final texto = _busqueda.toLowerCase();
      final coincideTexto = texto.isEmpty ||
          c.nombre.toLowerCase().contains(texto) ||
          c.descripcionCorta.toLowerCase().contains(texto) ||
          c.origen.toLowerCase().contains(texto);
      return coincideCategoria && coincideTexto;
    }).toList();
  }

  Future<void> _abrirDetalle(Cafe cafe) async {
    // Se envía el objeto completo a la siguiente pantalla y se espera
    // (await) el valor que devuelva con Navigator.pop(context, valor).
    final resultado = await Navigator.push<bool>(
      context,
      MaterialPageRoute(builder: (_) => PantallaDetalle(cafe: cafe)),
    );
    if (!mounted) return;
    setState(() {
      if (resultado != null) cafe.favorito = resultado;
    });
  }

  @override
  void dispose() {
    _controladorBusqueda.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final lista = _filtrados;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Origen'),
        actions: [
          IconButton(
            tooltip: 'Perfil',
            icon: const Icon(Icons.account_circle_outlined, size: 30),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Perfil: próximamente')),
              );
            },
          ),
          const SizedBox(width: 6),
        ],
      ),
      body: Column(
        children: [
          // ---- Barra de búsqueda
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
            child: TextField(
              controller: _controladorBusqueda,
              onChanged: (valor) => setState(() => _busqueda = valor),
              decoration: InputDecoration(
                hintText: 'Busca un café, origen o método...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _busqueda.isEmpty
                    ? null
                    : IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          _controladorBusqueda.clear();
                          setState(() => _busqueda = '');
                        },
                      ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(vertical: 14),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          // ---- Categorías (chips)
          SizedBox(
            height: 48,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: categorias.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (context, i) {
                final categoria = categorias[i];
                final activa = categoria == _categoriaActual;
                return ChoiceChip(
                  label: Text(categoria),
                  selected: activa,
                  showCheckmark: false,
                  selectedColor: Paleta.cafe,
                  backgroundColor: Paleta.crema,
                  side: BorderSide.none,
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: activa ? Colors.white : Paleta.espresso,
                  ),
                  onSelected: (_) => setState(() => _categoriaActual = categoria),
                );
              },
            ),
          ),

          // ---- Lista dinámica
          Expanded(
            child: lista.isEmpty
                ? const _SinResultados()
                : ListView.builder(
                    padding: const EdgeInsets.only(top: 6, bottom: 20),
                    itemCount: lista.length,
                    itemBuilder: (context, i) => TarjetaCafe(
                      cafe: lista[i],
                      onTap: () => _abrirDetalle(lista[i]),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

class _SinResultados extends StatelessWidget {
  const _SinResultados();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.coffee_outlined, size: 64, color: Colors.brown.shade200),
          const SizedBox(height: 12),
          Text(
            'No encontramos ese café',
            style: TextStyle(fontSize: 16, color: Colors.brown.shade400),
          ),
        ],
      ),
    );
  }
}
