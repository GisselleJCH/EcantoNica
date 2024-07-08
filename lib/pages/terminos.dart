import 'package:flutter/material.dart';

class TerminosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Términos de Uso'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Bienvenido/a a EncantoNica, Lugares Turísticos de Nicaragua',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('1. Aceptación de los Términos',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text(
                'Al acceder y utilizar nuestra aplicación EncantoNica, usted acepta y se compromete a cumplir con los presentes Términos de Uso. Si no está de acuerdo con estos términos, por favor, no utilice la Aplicación.'),
            SizedBox(height: 10),
            Text('2. Descripción del Servicio',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text(
                'La Aplicación proporciona información sobre diversos lugares turísticos en Nicaragua, incluyendo descripciones, imágenes, ubicaciones.'),
            SizedBox(height: 10),
            Text('3. Uso de la Aplicación',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text('- Acceso y Uso: Usted puede acceder y utilizar la Aplicación para fines personales y no comerciales, siempre que cumpla con estos Términos de Uso.'),
            Text('- Restricciones: No está permitido:'),
            Text('  - Modificar, copiar, distribuir, transmitir, exhibir, realizar, reproducir, publicar, licenciar, crear trabajos derivados, transferir o vender cualquier información, software, productos o servicios obtenidos de la Aplicación.'),
            Text('  - Utilizar la Aplicación para cualquier propósito ilegal o no autorizado.'),
            Text('  - Interferir o intentar interferir con el funcionamiento adecuado de la Aplicación.'),
            SizedBox(height: 10),
            Text('4. Contenido del Usuario',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text(
                'Al publicar contenido en la Aplicación, usted otorga a los operadores de la Aplicación el derecho no exclusivo, transferible, sublicenciable, libre de regalías y mundial para usar, distribuir, modificar, ejecutar y mostrar dicho contenido en relación con la operación de la Aplicación.'),
            SizedBox(height: 10),
            Text('5. Propiedad Intelectual',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text(
                'Todos los contenidos, incluyendo pero no limitado a texto, gráficos, logotipos, iconos de botones, imágenes, clips de audio y software, son propiedad de la Aplicación o de sus proveedores de contenido y están protegidos por leyes de derechos de autor y otras leyes de propiedad intelectual.'),
            SizedBox(height: 10),
            Text('6. Limitación de Responsabilidad',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text(
                'La información proporcionada en la Aplicación es de carácter general y no constituye asesoramiento profesional. Los operadores de la Aplicación no se hacen responsables de la exactitud, integridad o utilidad de la información ni de los daños que puedan surgir de su uso. El uso de la Aplicación es bajo su propio riesgo.'),
            SizedBox(height: 10),
            Text('7. Enlaces a Sitios de Terceros',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text(
                'La Aplicación puede contener enlaces a sitios web de terceros. Estos enlaces se proporcionan únicamente para su conveniencia. No tenemos control sobre el contenido de estos sitios y no asumimos ninguna responsabilidad por ellos.'),
            SizedBox(height: 10),
            Text('8. Cambios en los Términos de Uso',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text(
                'Nos reservamos el derecho de modificar estos Términos de Uso en cualquier momento. Las modificaciones serán efectivas inmediatamente después de su publicación en la Aplicación. Su uso continuado de la Aplicación después de cualquier cambio constituye su aceptación de los nuevos Términos de Uso.'),
            SizedBox(height: 10),
            Text('9. Ley Aplicable',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text(
                'Estos Términos de Uso se rigen e interpretan de acuerdo con las leyes de Nicaragua, sin dar efecto a sus disposiciones sobre conflictos de leyes.'),
            SizedBox(height: 10),
            Text('10. Contacto',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text(
                'Si tiene alguna pregunta o inquietud acerca de estos Términos de Uso, por favor contáctenos a través de nuestro correo electrónico: contacto@encantonica.com.'),
            SizedBox(height: 10),
            Text('Fecha de vigencia: 3 de julio de 2024.',
                style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic)),
          ],
        ),
      ),
    );
  }
}
