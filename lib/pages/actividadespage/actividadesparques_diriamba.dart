import 'package:barra/pages/lugares/diriamba_parquedos.dart';
import 'package:barra/pages/lugares/diriamba_parqueuno.dart';
import 'package:flutter/material.dart';
import 'package:barra/pages/PageDepartamentos.dart';

void main() {
  runApp(const actividadesparques_diriamba(title: '',));
}

class actividadesparques_diriamba extends StatelessWidget {
  const actividadesparques_diriamba({Key? key, required String title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MyHomePage(title: ''),
      routes: {
        '/actividadUno': (context) => diriamba_parqueuno(), // Define la ruta para la primera actividad
        '/actividadDos': (context) => diriamba_parquedos(), // Define la ruta para la segunda actividad
	      '/pageDepartamentos': (context) => PageDepartamentos(), // Define la ruta para PageDepartamentos
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
                buildContainer('assets/diriamba5.jpg', 'Parque Central de Diriamba', '/actividadUno'),
                const SizedBox(height: 20),
                buildContainer('assets/diriamba6.jpg', 'Parque de ferias Diriamba', '/actividadDos'),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.only(top: 20, right: 20), // Ajuste de margen del botón
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/pageDepartamentos'); // Acción del botón
          },
          backgroundColor: Colors.blue, // Fondo azul
          child: const Icon(Icons.arrow_back),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }

  Widget buildContainer(String imagePath, String title, String route) {
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
                    onPressed: () {
                      Navigator.pushNamed(context, route); // Navega a la ruta especificada
                    },
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
