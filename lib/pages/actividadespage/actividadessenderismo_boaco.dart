import 'package:flutter/material.dart';
import 'package:barra/pages/lugares/sende1-boaco.dart';
import 'package:barra/pages/lugares/sende2-boaco.dart';

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
      home: const Sendeboaco(title: ''),
    );
  }
}

class Sendeboaco extends StatefulWidget {
  const Sendeboaco({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Sendeboaco> createState() => _SendeboacoState();
}

class _SendeboacoState extends State<Sendeboaco> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
            alignment: Alignment.centerLeft,
            child: Text(
              'Senderismo en Boaco',
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
                buildContainer('assets/c1.jpg', 'Cerro Apó', () {
                  // Acción del botón "Ver más" para Cerro Apó
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => sboaco1()),
                  );
                }),
                const SizedBox(height: 20),
                buildContainer('assets/c2.jpg', 'Cascadas de La Estancia', () {
                  // Acción del botón "Ver más" para Cascadas de La Estancia
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => sboaco2()),
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
                const SizedBox(height: 8),
                SizedBox(
                  height: 40,
                  child: ElevatedButton(
                    onPressed: onPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    child: const Text(
                      'Ver más',
                      style: TextStyle(
                        color: Colors.white,
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

