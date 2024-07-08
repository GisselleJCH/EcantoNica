import 'package:barra/pages/lugares/Negocio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const masaya_senderismodos());
}

class masaya_senderismodos extends StatelessWidget {
  const masaya_senderismodos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final negocio = Negocio(
      'Sendero El Chocoyero',
      'La Reserva Natural de ‘El Chocoyero’ es un lugar grandioso para ir de excursión y observar la naturaleza. Esta reserva esta localizada a menos de 30 kilómetros de Managua. Los últimos siete kilómetros no están pavimentados y atraviesan plantaciones de piña, café y banano. Esto lo atrasará un poco, pero no se aburrirá, la vista es magnífica. La vieja cadena volcánica rodea la reserva y la naturaleza está en todas partes.',
      'Lunes a Domingo , 05:00am-05:00pm',
      'Precios varian según actividad, entre 100 a 200 Córdobas.',
      22767810,
      'De la vuelta de Telcor,75 mts a este, Ticuantepe, Nicaragua',
      'Los caminos en El Chocoyero tienen diferente longitud y dificultad. El camino de Aventura lleva a las montañas y toma seis horas para finalizarlo. Los otros caminos son más cortos y lo llevarán a las cascadas. Hay dos cascadas: Chocoyero y el Brujo. El camino a El Brujo es empinado pero no tan largo. La cascada de El Chocoyero está a más o menos 30 minutos de la entrada y no necesita escalar para llegar a ella',
      '',
      'Chocoyero también le da la oportunidad de quedarse la noche en el parque. La reserva tiene tiendas de campaña y lugares para acampar en el medio del bosque. También puede contratar un guía para escalar en la noche. A la vez puede para quedarse a dormir o realizar el tour de noche, que consiste en la casa de Murciélagos.'
    );

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: RestaurantePage(title: 'Sendero El Chocoyero', negocio: negocio,),
    );
  }
}

class RestaurantePage extends StatefulWidget {
  const RestaurantePage({Key? key, required this.title, required this.negocio}) : super(key: key);

  final String title;
  final Negocio negocio;

  @override
  _RestaurantePageState createState() => _RestaurantePageState(negocio: negocio);
}

class _RestaurantePageState extends State<RestaurantePage> {
  final String googleMapsUrl = 'https://www.google.com/maps/place/Reserva+Natural+El+Chocoyero+y+El+Brujo/@11.9796657,-86.2562128,15z/data=!4m6!3m5!1s0x8f76aa755968ecb5:0x37c6a6b50de0022!8m2!3d11.9796657!4d-86.2562128!16s%2Fm%2F02qrcp5?entry=ttu';
  bool isFavorite = false;
  final Negocio negocio;

  _RestaurantePageState({required this.negocio});

  @override
  void initState() {
    super.initState();
    _loadFavoriteStatus();
  }

  void _loadFavoriteStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? favoriteStatus = prefs.getBool(widget.title);
    if (mounted) {
      setState(() {
        isFavorite = favoriteStatus ?? false;
      });
    }
  }

  void _toggleFavorite() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool newFavoriteStatus = !isFavorite;
  if (newFavoriteStatus) {
    await prefs.setBool(widget.title, true);
    await prefs.setString('${widget.title}_desc', widget.negocio.descripcion ?? '');
  } else {
    await prefs.remove(widget.title);
    await prefs.remove('${widget.title}_desc');
  }
  if (mounted) {
    setState(() {
      isFavorite = newFavoriteStatus;
    });
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: <Widget>[
          Padding(
             padding: const EdgeInsets.only(right: 50.0),
            child: IconButton(
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.orange : Colors.black54,
              ),
              onPressed: _toggleFavorite,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/masaya6.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            _buildSection('Ubicación', negocio.ubicacion!),
            const SizedBox(height: 10),
            _buildSection('Descripción', negocio.descripcion!),
            const SizedBox(height: 10),
            _buildSection('Horario', negocio.horarios!),
            const SizedBox(height: 10),
            _buildSection('Precios', negocio.rangoPrecios!),
            const SizedBox(height: 10),
            _buildSection('Teléfono', negocio.telefonos!.toString()),
            const SizedBox(height: 10),
            _buildSection('Dificultad', negocio.dificultad!),
            const SizedBox(height: 10),
             _buildSection('Servicios', negocio.servicio!),
            const SizedBox(height: 10),
            _buildReviewSection(),
            const SizedBox(height: 20),
            _buildGoogleMapsLink(context),  // Widget para mostrar el enlace de Google Maps
            const SizedBox(height: 20),  // Espaciado vertical
          ],
        ),
      ),
    );
  }

 Widget _buildSection(String title, String content) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: const Color.fromARGB(0, 255, 255, 255),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            content,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewSection() {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Color.fromARGB(0, 255, 255, 255),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Reseña',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 10),
          RatingBar(
            initialRating: 3, // Calificación inicial
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            ratingWidget: RatingWidget(
              full: const Icon(Icons.star, color: Colors.amber),
              half: const Icon(Icons.star_half, color: Colors.amber),
              empty: const Icon(Icons.star_border, color: Colors.amber),
            ),
            itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
            onRatingUpdate: (rating) {
              // Manejar la actualización de la calificación
            },
          ),
        ],
      ),
    );
  }

   // Método para construir el enlace de Google Maps
  Widget _buildGoogleMapsLink(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: const Color.fromARGB(0, 255, 255, 255),
        borderRadius: BorderRadius.circular(10),
      ),
      child: GestureDetector(
        onTap: () => _launchGoogleMapsURL(context),  // Función al hacer clic en el enlace de Google Maps
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Icon(Icons.location_on, color: Colors.blue),  // Ícono de ubicación
            SizedBox(width: 5),
            Text(
              'Ver en Google Maps',  // Texto del enlace
              style: TextStyle(
                color: Colors.blue,  // Color del texto
                fontSize: 16,
                decoration: TextDecoration.underline,  // Subrayado del texto
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Método para lanzar la URL de Google Maps
  void _launchGoogleMapsURL(BuildContext context) async {
    if (await canLaunch(googleMapsUrl)) {
      await launch(googleMapsUrl);  // Abrir URL si es posible
    } else {
      throw 'No se puede abrir $googleMapsUrl';  // Lanzar error si no se puede abrir la URL
    }
  }
}


