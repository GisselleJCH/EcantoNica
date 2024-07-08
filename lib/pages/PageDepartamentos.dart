import 'package:flutter/material.dart';
import 'package:barra/pages/PageActividades.dart';

class PageDepartamentos extends StatelessWidget {
  final String searchQuery;

  const PageDepartamentos({Key? key, this.searchQuery = ''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(206, 255, 255, 255)),
        useMaterial3: true,
      ),
      home: MyHomePageDepartamentos(title: 'Departamentos', searchQuery: searchQuery),
    );
  }
}

class MyHomePageDepartamentos extends StatefulWidget {
  final String title;
  final String searchQuery;

  const MyHomePageDepartamentos({Key? key, required this.title, required this.searchQuery}) : super(key: key);

  @override
  State<MyHomePageDepartamentos> createState() => _MyHomePageDepartamentosState();
}

class _MyHomePageDepartamentosState extends State<MyHomePageDepartamentos> {
  final List<String> imageUrls = [
    'https://upload.wikimedia.org/wikipedia/commons/0/01/Ciudad_Masaya.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/d/dc/Diriamba.jpg/1280px-Diriamba.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/1/18/Leon_Cathedral_2018.jpg/1280px-Leon_Cathedral_2018.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8f/Nicaragua_2017-03-15_%2833978834325%29.jpg/1280px-Nicaragua_2017-03-15_%2833978834325%29.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/2/22/Acceso_principal_Ciudad_de_Chinandega.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f5/Juigalpa_Landscape.jpg/1280px-Juigalpa_Landscape.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/b/bd/Desde_mirador_el_calvario.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/6/66/OmetepeView_08.jpg/1280px-OmetepeView_08.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f9/Boaco_at_night.jpg/1280px-Boaco_at_night.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Esteli_Nicaragua_Skyline_from_Tisey.jpg/1280px-Esteli_Nicaragua_Skyline_from_Tisey.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d3/Corn_field_in_San_Bartolo.jpg/1280px-Corn_field_in_San_Bartolo.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/1/18/Jinotega_desde_La_Pe%C3%B1a_de_La_Cruz.jpg/1280px-Jinotega_desde_La_Pe%C3%B1a_de_La_Cruz.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/4/46/Volc%C3%A1n_Tepesomoto.JPG',
    'https://upload.wikimedia.org/wikipedia/commons/d/db/Riosanjuan.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/1/12/Managua_Nicaragua.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/8/89/Krukira_Lagoon.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d8/Pearl_Cays_Pearl_Lagoon.jpg/1024px-Pearl_Cays_Pearl_Lagoon.jpg',
  ];

  final List<String> imageNames = [
    'Masaya',
    'Diriamba-Carazo',
    'León',
    'Granada',
    'Chinandega',
    'Chontales',
    'Matagalpa',
    'Rivas',
    'Boaco',
    'Esteli',
    'Nueva Segovia',
    'Jinotega',
    'Madriz',
    'Rio SanJuan',
    'Managua',
    'Costa Caribe Norte',
    'Costa Caribe Sur',
  ];

  List<String> filteredImageUrls = [];
  List<String> filteredImageNames = [];

  @override
  void initState() {
    super.initState();
    filteredImageUrls.addAll(imageUrls);
    filteredImageNames.addAll(imageNames);

    if (widget.searchQuery.isNotEmpty) {
      search(widget.searchQuery);
    }
  }

  void search(String query) {
    filteredImageUrls.clear();
    filteredImageNames.clear();

    for (int i = 0; i < imageNames.length; i++) {
      if (imageNames[i].toLowerCase().contains(query.toLowerCase())) {
        filteredImageUrls.add(imageUrls[i]);
        filteredImageNames.add(imageNames[i]);
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(
            color: Color.fromARGB(248, 231, 127, 15),
            fontWeight: FontWeight.w900,
            fontSize: 30,
          ),
        ),
      ),
      backgroundColor: Color.fromRGBO(212, 232, 235, 1),
      
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
          ),
          itemCount: filteredImageUrls.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategoriesPage(
                      departamento: filteredImageNames[index],
                    ),
                  ),
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: AspectRatio(
                      aspectRatio: 1.2,
                      child: Image.network(
                        filteredImageUrls[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 1),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(left: 10.0),
                    child: Text(
                      filteredImageNames[index],
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
