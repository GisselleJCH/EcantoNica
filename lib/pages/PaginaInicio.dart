import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:barra/pages/PageDepartamentos.dart';
import 'package:barra/pages/pageFavoritos.dart';
import 'package:barra/pages/PagePerfil.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(PaginaInicio());
}

final TextEditingController _searchController = TextEditingController();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PaginaInicio(),
    );
  }
}

class PaginaInicio extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<PaginaInicio> {
  int _page = 0;

  final PageDepartamentos _listDepartamentos = PageDepartamentos();
  final PageFavoritos _listFavoritos = PageFavoritos();
  final PageInicioContent _listInicio = PageInicioContent();
  final PagePerfil _listPerfil = PagePerfil();

  Widget _pagesChooser(int page) {
    switch (page) {
      case 0:
        return _listInicio;
      case 1:
        return _listDepartamentos;
      case 2:
        return _listFavoritos;
      case 3:
        return _listPerfil;
      default:
        return Container(
          child: Center(
            child: Text(
              'No page found',
              style: TextStyle(fontSize: 30),
            ),
          ),
        );
    }
  }

  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    // Si el usuario ha iniciado sesión, muestra la barra de navegación inferior y las demás páginas
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 60.0,
        items: <Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.explore, size: 30),
          Icon(Icons.favorite, size: 30),
          Icon(Icons.perm_identity, size: 30)
        ],
        backgroundColor: Color.fromRGBO(49, 188, 206, 0.178),
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (int tappedIndex) {
          setState(() {
            _page = tappedIndex;
          });
        },
        letIndexChange: (tappedIndex) => true,
      ),
      body: Container(
        child: _pagesChooser(_page),
      ),
    );   
  }
}

class PageInicioContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(49, 188, 206, 0.178),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NicaraguaCover(),
            SizedBox(
                height: 20), // Ajusta la distancia entre la imagen y el texto
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Departamentos más visitados',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(248, 231, 127, 15),
                ),
              ),
            ),
            SizedBox(
                height: 10), // Ajusta la distancia entre el texto y el GridView
            MyHomePage(),
          ],
        ),
      ),
    );
  }
}

class NicaraguaCover extends StatelessWidget {
  // Lista de URLs de imágenes
  final List<String> imageUrls = [
    'https://upload.wikimedia.org/wikipedia/commons/f/f5/Nicaragua_Ometepe_Concepci%C3%B3n_15.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Imagen de fondo
        Container(
          height: 350,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(imageUrls[0]),
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Texto superpuesto
        Positioned(
          top: 100,
          left: 20,
          right: 20,
          child: Column(
            children: [
              Text(
                'NICARAGUA:',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.black,
                      offset: Offset(2.0, 2.0),
                    ),
                  ],
                ),
              ),
              Text(
                '¡Tierra de lagos y volcanes!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.black,
                      offset: Offset(2.0, 2.0),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // Barra de búsqueda
        Positioned(
          bottom: 40,
          left: 20,
          right: 20,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: '¿Cuál es tu destino?',
                border: InputBorder.none,
                icon: Icon(Icons.search),
              ),
              onSubmitted: (query) {
                _searchAndNavigate(context, query);
              },
            ),
          ),
        ),
      ],
    );
  }

  void _searchAndNavigate(BuildContext context, String query) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PageDepartamentos(searchQuery: query),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Lista de URLs de imágenes para cada cuadro
  final List<String> imageUrls = [
    'https://upload.wikimedia.org/wikipedia/commons/thumb/1/18/Leon_Cathedral_2018.jpg/1280px-Leon_Cathedral_2018.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/6/66/OmetepeView_08.jpg/1280px-OmetepeView_08.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Esteli_Nicaragua_Skyline_from_Tisey.jpg/1280px-Esteli_Nicaragua_Skyline_from_Tisey.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8f/Nicaragua_2017-03-15_%2833978834325%29.jpg/1280px-Nicaragua_2017-03-15_%2833978834325%29.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/1/18/Jinotega_desde_La_Pe%C3%B1a_de_La_Cruz.jpg/1280px-Jinotega_desde_La_Pe%C3%B1a_de_La_Cruz.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/1/12/Managua_Nicaragua.jpg'
  ];

  // Lista de nombres para cada imagen
  final List<String> imageNames = [
    'León',
    'Ometepe',
    'Esteli',
    'Granada',
    'Jinotega',
    'Managua'
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.all(8.0), // Ajusta el margen exterior del GridView
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
        ),
        itemCount: imageUrls.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          // Cada cuadro muestra una imagen diferente de la lista de URLs de imágenes
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: AspectRatio(
                  aspectRatio: 1.2,
                  child: Image.network(
                    imageUrls[index],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 1),
              Container(
                alignment:
                    Alignment.centerLeft, // Alinea el texto a la izquierda
                margin: EdgeInsets.only(
                    left: 10.0), // Agrega un margen a la izquierda
                child: Text(
                  imageNames[index],
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
