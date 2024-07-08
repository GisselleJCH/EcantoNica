import 'package:flutter/material.dart';
import 'package:barra/pages/lugares/sende1-ccn.dart';
import 'package:barra/pages/lugares/sende2-ccn.dart';

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
      home: const Sendeccn(title: ''),
    );
  }
}

class Sendeccn extends StatefulWidget {
  const Sendeccn({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Sendeccn> createState() => _SendeccnState();
}

class _SendeccnState extends State<Sendeccn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
            alignment: Alignment.centerLeft,
            child: Text(
              'Senderismo en la Costa Caribe Norte',
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
                buildContainer('assets/sccn1.jpg', 'Cascada de La Gloria: Un tesoro escondido en Costa Caribe Norte', () {
                  // Acción del botón "Ver más" para Cascada de La Gloria
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => sendeccn1()),
                  );
                }),
                const SizedBox(height: 20),
                buildContainer('assets/sccn2.jpg', 'Sendero Laguna de Wawa', () {
                  // Acción del botón "Ver más" para Sendero Laguna de Wawa
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => sendeccn2()),
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

