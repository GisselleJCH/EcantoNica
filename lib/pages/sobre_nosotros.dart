import 'package:flutter/material.dart';

class SobreNosotrosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sobre Nosotros'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'EncantoNica',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'EncantoNica es una aplicación informativa dedicada a brindar a los usuarios una experiencia única y enriquecedora al explorar los maravillosos lugares turísticos de Nicaragua. Nuestro objetivo es destacar la riqueza cultural, histórica y natural de este hermoso país, proporcionando información detallada, imágenes cautivadoras y recomendaciones útiles para que tanto turistas como locales puedan descubrir y disfrutar al máximo cada rincón de Nicaragua. Nos apasiona promover el turismo sostenible y apoyar a las comunidades locales, asegurando que cada visita sea memorable y beneficiosa para todos. ¡Únase a nosotros en esta aventura y descubra el verdadero encanto de Nicaragua con EncantoNica!',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
