import 'package:flutter/material.dart';
import 'package:barra/pages/lugares/his1-mana.dart';
import 'package:barra/pages/lugares/his2-mana.dart';

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
      home: const HistManagua(title: ''),
    );
  }
}

class HistManagua extends StatefulWidget {
  const HistManagua({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HistManagua> createState() => _HistManaguaState();
}

class _HistManaguaState extends State<HistManagua> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.fromLTRB(20, 40, 20, 20), // Ajuste de márgenes
            alignment: Alignment.centerLeft,
            child: Text(
              'Historia',
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
               buildContainer('assets/hman1.jpg', 'Palacio Nacional de la Cultura', () {
                  // Acción del botón "Ver más" para Museo Gregorio Urbano Gilbert
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => hman1 ()),
                  );
                }),
                const SizedBox(height: 20),
               buildContainer('assets/hman2.jpg', 'Catedral Metropolitana de Managua', () {
                  // Acción del botón "Ver más" para Iglesia San Francisco de Asís
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => hman2 ()),
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