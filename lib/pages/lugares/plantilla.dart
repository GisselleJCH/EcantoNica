import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:barra/pages/lugares/Negocio.dart';

class RestaurantePage extends StatelessWidget {
  const RestaurantePage({Key? key, required this.title, required this.negocio, required this.imageName}) : super(key: key);

  final String title;
  final Negocio negocio;
  final String imageName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
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
                  image: AssetImage('assets/$imageName'),
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
            _buildSection('Precio', negocio.rangoPrecios!),
            const SizedBox(height: 10),
            _buildSection('Teléfono', negocio.telefonos.toString()), // Añadir sección de teléfono
            const SizedBox(height: 10),
            _buildSection('Nivel de dificultad', negocio.dificultad!),
            const SizedBox(height: 10),
            _buildSection('Duración', negocio.duracion!),
            const SizedBox(height: 10),
            _buildReviewSection(),
            const SizedBox(height: 20),
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
}
