import 'package:barra/pages/lugares/Negocio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const diriamba_parqueuno());
}

class diriamba_parqueuno extends StatelessWidget {
  const diriamba_parqueuno({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final negocio = Negocio(
      'Parque Central de Diriamba',
      'Un parque central vibrante con árboles frondosos, bancos para sentarse y una atmósfera animada.',
      'Abre las 24 horas del día, los 7 días de la semana.',
      '',
      0,
      'Ubicado en Diriamba, Nicaragua.',
      '',
      '',
      ''
    );

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: RestaurantePage(title: 'Parque Central de Diriamba', negocio: negocio),
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
  final String googleMapsUrl = 'https://maps.google.com/?cid=14622773880615993870';
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
                  image: AssetImage('assets/diriamba5.jpg'),
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