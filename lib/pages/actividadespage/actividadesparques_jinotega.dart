import 'package:flutter/material.dart';
import 'package:barra/pages/lugares/parq1-jino.dart';
import 'package:barra/pages/lugares/parq2-jino.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const Parjino(title: ''),
    );
  }
}

class Parjino extends StatefulWidget {
  const Parjino({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Parjino> createState() => _ParjinoState();
}

class _ParjinoState extends State<Parjino> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.fromLTRB(20, 40, 20, 20), // Ajuste de márgenes
            alignment: Alignment.centerLeft,
            child: Text(
              'Parques',
              style: TextStyle(
                fontSize: 30, // Tamaño del texto
                fontWeight: FontWeight.bold, // Fuente en negrita
                color: Color.fromRGBO(247, 151, 6, 1), // Color naranja
              ),
            ),
          ),
          SizedBox(height: 20), // Separación entre el título y los contenedores
          Expanded(
            child: ListView(
              children: <Widget>[
                buildContainer('assets/parjino1.jpg', 'Parque Central de Estelí', () {
                  // Acción del botón "Ver más" para Parque Central de Estelí
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => parj1()),
                  );
                }),
                const SizedBox(height: 20),
                buildContainer('assets/parjino2.jpg', 'Parque de la Independencia', () {
                  // Acción del botón "Ver más" para Parque de la Independencia
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => parj2()),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context); // Retrocede a la pantalla anterior
        },
        backgroundColor: Colors.blue, // Fondo azul
        child: const Icon(Icons.arrow_back),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }

  Widget buildContainer(String imagePath, String title, VoidCallback onPressed) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10), // Ajuste de márgenes
      decoration: BoxDecoration(
        color: Colors.grey[300], // Fondo gris
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(15), // Semi redonda
            child: Image.asset(
              imagePath,
              width: 150, // Tamaño fijo para la imagen
              height: 150, // Tamaño fijo para la imagen
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20, // Tamaño del texto
                    color: const Color.fromARGB(255, 17, 92, 153), // Color del texto
                    fontWeight: FontWeight.bold, // Fuente en negrita
                  ),
                ),
                const SizedBox(height: 80),
                const SizedBox(width: 300),
                SizedBox(
                  height: 40, // Altura del SizedBox para separar el botón del texto
                  child: ElevatedButton(
                    onPressed: onPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Fondo azul
                    ),
                    child: const Text(
                      'Ver más',
                      style: TextStyle(
                        color: Colors.white, // Texto blanco
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

