import 'package:barra/pages/lugares/Negocio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';
void main() {
  runApp(const hji1());
}

class hji1 extends StatelessWidget {
  const hji1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final negocio = Negocio(
      '',
      'Un museo que alberga una colección de piezas arqueológicas, objetos históricos y culturales de la región. Aprende sobre la historia, tradiciones y costumbres de Jinotega.',
      'Abierto de martes a domingo de 8:00 a 12:00 y de 13:00 a 17:00 horas. Cerrado los lunes.',
      'Entrada: US 1.',
      0,
      'Barrio Monseñor Lezcano, Jinotega, Nicaragua.',
      '',
      '',
      ''
    );

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: RestaurantePage(title: 'Museo Regional de Jinotega', negocio: negocio),
    );
  }
}

class RestaurantePage extends StatefulWidget {
  const RestaurantePage({Key? key, required this.title, required this.negocio}) : super(key: key);

  final String title;
  final Negocio negocio;

  @override
  _RestaurantePageState createState() => _RestaurantePageState();
}

class _RestaurantePageState extends State<RestaurantePage> {
  bool isFavorite = false;
 final String googleMapsUrl = 'https://maps.app.goo.gl/hAighbdzFy8pGqof6 ';
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
      await prefs.setString('${widget.title}_desc', widget.negocio.descripcion!);
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
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/his1jino.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            _buildSection('Ubicación', widget.negocio.ubicacion!),
            const SizedBox(height: 10),
            _buildSection('Descripción', widget.negocio.descripcion!),
            const SizedBox(height: 10),
            _buildSection('Horario', widget.negocio.horarios!),
            const SizedBox(height: 10),
            _buildSection('Precio', widget.negocio.rangoPrecios!),
            const SizedBox(height: 10),
            _buildReviewSection(),
            const SizedBox(height: 20),
             _buildGoogleMapsLink(context),
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
        color: const Color.fromARGB(0, 255, 255, 255),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Reseña',
            style: TextStyle(
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
    Widget _buildGoogleMapsLink(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: const Color.fromARGB(0, 255, 255, 255),
        borderRadius: BorderRadius.circular(10),
      ),
      child: GestureDetector(
        onTap: () => _launchGoogleMapsURL(context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Icon(Icons.location_on, color: Colors.blue),
            SizedBox(width: 5),
            Text(
              'Ver en Google Maps',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 16,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Método para lanzar el enlace de Google Maps
  void _launchGoogleMapsURL(BuildContext context) async {
    if (await canLaunch(googleMapsUrl)) {
      await launch(googleMapsUrl);
    } else {
      throw 'No se puede abrir $googleMapsUrl';
    }
  }
}
