import 'package:flutter/material.dart';
import 'package:barra/pages/lugares/resta1-esteli.dart';
import 'package:barra/pages/lugares/resta2-esteli.dart';

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
      home: const RestaEsteli(title: ''),
    );
  }
}

class RestaEsteli extends StatefulWidget {
  const RestaEsteli({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<RestaEsteli> createState() => _RestaEsteliState();
}

class _RestaEsteliState extends State<RestaEsteli> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
            alignment: Alignment.centerLeft,
            child: Text(
              'Restaurantes',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(247, 151, 6, 1),
              ),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView(
              children: <Widget>[
                buildContainer('assets/r1este.jpg', 'Restaurante El Portón', () {
                  // Acción del botón "Ver más" para Restaurante El Portón
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => rseta1()),
                  );
                }),
                const SizedBox(height: 20),
                buildContainer('assets/r2este.jpg', 'Restaurante La Casona', () {
                  // Acción del botón "Ver más" para Restaurante La Casona
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => rseta2()),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.arrow_back),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }

  Widget buildContainer(String imagePath, String title, VoidCallback onPressed) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              imagePath,
              width: 150,
              height: 150,
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
                    fontSize: 20,
                    color: const Color.fromARGB(255, 17, 92, 153),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
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
