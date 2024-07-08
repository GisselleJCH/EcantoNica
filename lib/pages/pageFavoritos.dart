import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PageFavoritos extends StatelessWidget {
  PageFavoritos({super.key});

  Future<List<Map<String, String>>> _loadFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Set<String> keys = prefs.getKeys();
    List<Map<String, String>> favorites = [];
    for (String key in keys) {
      if (key.endsWith('_desc')) continue;
      String? description = prefs.getString('${key}_desc');
      if (description != null) {
        favorites.add({'title': key, 'description': description});
      }
    }
    return favorites;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(49, 188, 206, 0.178),
      appBar: AppBar(
        title: Text('Favoritos'),
      ),
      body: FutureBuilder<List<Map<String, String>>>(
        future: _loadFavorites(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No hay favoritos guardados'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var item = snapshot.data![index];
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5.0,
                        spreadRadius: 1.0,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['title']!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        item['description']!,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: List.generate(5, (index) {
                          return Icon(
                            Icons.star,
                            size: 20,
                            color: Colors.amber,
                          );
                        }),
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
