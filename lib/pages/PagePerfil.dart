import 'package:flutter/material.dart';
import 'package:barra/pages/sobre_nosotros.dart';
import 'package:barra/pages/terminos.dart';
import 'package:barra/pages/privacidad.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Perfil App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PagePerfil(),
    );
  }
}

class PagePerfil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(49, 188, 206, 0.178),
      appBar: AppBar(
        title: Text('Bienvenidos/as a EncantoNica'),
      ),
      body: Column(
        children: <Widget>[
          ListTile(
            title: Text('Sobre Nosotros'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SobreNosotrosPage()));
            },
          ),
          Divider(),
          ListTile(
            title: Text('Política de Privacidad'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => PrivacidadPage()));
            },
          ),
          Divider(),
          ListTile(
            title: Text('Términos de uso'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => TerminosPage()));
            },
          ),
          Divider(),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Text('Versión 1.0.0'),
          ),
        ],
      ),
    );
  }
}
