/// Modelo de datos de cada bebida del catálogo.
class Cafe {
  final String id;
  final String nombre;
  final String categoria;
  final String descripcionCorta;
  final String descripcion;
  final String imagen; // ruta del asset
  final double precio; // en pesos
  final double calificacion; // 0 - 5
  final int minutos; // tiempo de preparación
  final String origen;
  final List<String> notas;
  final List<String> preparacion;
  bool favorito;

  Cafe({
    required this.id,
    required this.nombre,
    required this.categoria,
    required this.descripcionCorta,
    required this.descripcion,
    required this.imagen,
    required this.precio,
    required this.calificacion,
    required this.minutos,
    required this.origen,
    required this.notas,
    required this.preparacion,
    this.favorito = false,
  });
}
