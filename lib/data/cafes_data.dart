import '../modelos/cafe.dart';

/// Categorías para los chips de filtro.
const List<String> categorias = ['Todos', 'Espresso', 'Filtrado', 'Fríos'];

/// Datos ficticios (mock data) que alimentan la app.
final List<Cafe> cafes = [
  Cafe(
    id: 'espresso',
    nombre: 'Espresso',
    categoria: 'Espresso',
    descripcionCorta: 'Intenso y concentrado, con crema espesa y color avellana.',
    descripcion:
        'La base de todo el menú. Se extrae a alta presión en 25 a 30 segundos '
        'y entrega un cuerpo denso, con una crema persistente que atrapa los '
        'aromas del grano recién molido.',
    imagen: 'assets/images/espresso.png',
    precio: 45,
    calificacion: 4.7,
    minutos: 2,
    origen: 'Chiapas, México',
    notas: ['Chocolate amargo', 'Nuez', 'Caramelo'],
    preparacion: [
      'Moler 18 g de café a molienda fina.',
      'Compactar de forma pareja y colocar el portafiltro.',
      'Extraer 36 g de bebida en 25 a 30 segundos.',
      'Servir de inmediato en taza precalentada.',
    ],
  ),
  Cafe(
    id: 'cortado',
    nombre: 'Cortado',
    categoria: 'Espresso',
    descripcionCorta: 'Espresso "cortado" con un toque de leche texturizada.',
    descripcion:
        'Una proporción casi 1 a 1 entre espresso y leche vaporizada. La leche '
        'suaviza la acidez sin ocultar el carácter del café, ideal para quien '
        'busca algo intenso pero redondo.',
    imagen: 'assets/images/cortado.png',
    precio: 55,
    calificacion: 4.6,
    minutos: 3,
    origen: 'Veracruz, México',
    notas: ['Cacao', 'Leche tostada', 'Panela'],
    preparacion: [
      'Extraer un espresso doble en vaso pequeño.',
      'Vaporizar 60 ml de leche hasta una textura sedosa.',
      'Verter la leche sobre el espresso sin formar espuma alta.',
    ],
  ),
  Cafe(
    id: 'flat_white',
    nombre: 'Flat White',
    categoria: 'Espresso',
    descripcionCorta: 'Cremoso y aterciopelado, con microespuma y arte latte.',
    descripcion:
        'Doble espresso con leche microtexturizada y una capa muy fina de '
        'espuma. Más café y menos volumen que un latte, con un acabado sedoso '
        'y un dibujo en forma de corazón.',
    imagen: 'assets/images/flat_white.png',
    precio: 65,
    calificacion: 4.8,
    minutos: 4,
    origen: 'Oaxaca, México',
    notas: ['Vainilla', 'Almendra', 'Chocolate con leche'],
    preparacion: [
      'Extraer un espresso doble directamente en la taza.',
      'Texturizar 120 ml de leche a 60 °C aprox.',
      'Verter en un hilo constante y dibujar el corazón al final.',
    ],
  ),
  Cafe(
    id: 'v60',
    nombre: 'V60 Etíope',
    categoria: 'Filtrado',
    descripcionCorta: 'Café de filtro limpio, floral y con acidez brillante.',
    descripcion:
        'Método de goteo manual que resalta la claridad del grano. Con un café '
        'lavado de Etiopía produce una taza ligera, aromática y con final '
        'dulce, muy distinta a un espresso.',
    imagen: 'assets/images/v60.png',
    precio: 75,
    calificacion: 4.9,
    minutos: 5,
    origen: 'Yirgacheffe, Etiopía',
    notas: ['Jazmín', 'Bergamota', 'Durazno'],
    preparacion: [
      'Enjuagar el filtro con agua caliente y desechar el agua.',
      'Agregar 15 g de café molido medio y 250 ml de agua a 93 °C.',
      'Bloom de 30 segundos con 40 ml de agua.',
      'Verter en círculos hasta completar a los 2:30 a 3:00 minutos.',
    ],
  ),
  Cafe(
    id: 'chemex',
    nombre: 'Chemex',
    categoria: 'Filtrado',
    descripcionCorta: 'Taza limpia y sedosa, preparada para compartir.',
    descripcion:
        'Su filtro grueso retiene aceites y sedimentos, dejando una taza muy '
        'limpia y ligera. Se sirve en jarra, perfecta para compartir entre dos '
        'o tres personas.',
    imagen: 'assets/images/chemex.png',
    precio: 95,
    calificacion: 4.7,
    minutos: 6,
    origen: 'Huila, Colombia',
    notas: ['Panela', 'Manzana verde', 'Cítricos'],
    preparacion: [
      'Colocar el filtro y enjuagarlo con agua caliente.',
      'Agregar 30 g de café de molienda media-gruesa.',
      'Hacer el bloom y verter 500 ml de agua en pulsos.',
      'Retirar el filtro y servir caliente.',
    ],
  ),
  Cafe(
    id: 'cold_brew',
    nombre: 'Cold Brew',
    categoria: 'Fríos',
    descripcionCorta: 'Infusión en frío de 18 horas, suave y sin amargor.',
    descripcion:
        'Café molido grueso que reposa en agua fría durante 18 horas. El '
        'resultado es una bebida de baja acidez, naturalmente dulce y muy '
        'refrescante, que se sirve sobre hielo.',
    imagen: 'assets/images/cold_brew.png',
    precio: 70,
    calificacion: 4.6,
    minutos: 2,
    origen: 'Chiapas, México',
    notas: ['Cacao', 'Panela', 'Cereza'],
    preparacion: [
      'Mezclar 1 parte de café grueso con 8 de agua fría.',
      'Refrigerar 18 horas y colar con filtro de tela.',
      'Servir sobre hielo; se conserva hasta 7 días en refrigeración.',
    ],
  ),
  Cafe(
    id: 'espresso_tonic',
    nombre: 'Espresso Tonic',
    categoria: 'Fríos',
    descripcionCorta: 'Agua tónica, hielo y espresso: cítrico y burbujeante.',
    descripcion:
        'Una combinación inesperada y muy refrescante. El espresso flota sobre '
        'agua tónica con hielo y una rodaja de limón, creando capas de sabor '
        'amargo, dulce y cítrico.',
    imagen: 'assets/images/espresso_tonic.png',
    precio: 80,
    calificacion: 4.5,
    minutos: 3,
    origen: 'Nariño, Colombia',
    notas: ['Limón', 'Quinina', 'Miel'],
    preparacion: [
      'Llenar un vaso alto con hielo y 150 ml de agua tónica fría.',
      'Extraer un espresso doble.',
      'Verter el espresso despacio sobre el hielo para formar capas.',
      'Decorar con una rodaja de limón.',
    ],
  ),
  Cafe(
    id: 'latte_helado',
    nombre: 'Latte Helado',
    categoria: 'Fríos',
    descripcionCorta: 'Espresso, leche fría y hielo; suave y cremoso.',
    descripcion:
        'La opción más amable para los días de calor: espresso doble, leche '
        'fría y mucho hielo. Se puede endulzar con jarabe de vainilla o piloncillo.',
    imagen: 'assets/images/latte_helado.png',
    precio: 68,
    calificacion: 4.4,
    minutos: 3,
    origen: 'Puebla, México',
    notas: ['Leche dulce', 'Vainilla', 'Avellana'],
    preparacion: [
      'Llenar un vaso con hielo y 180 ml de leche fría.',
      'Extraer un espresso doble.',
      'Verter el espresso encima y mezclar al gusto.',
    ],
  ),
];
