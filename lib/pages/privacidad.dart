import 'package:flutter/material.dart';

class PrivacidadPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Política de Privacidad'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Introducción',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text(
                'En EncantoNica, respetamos su privacidad y nos comprometemos a proteger la información personal que usted comparte con nosotros. Esta Política de Privacidad describe cómo recopilamos, usamos y protegemos su información cuando utiliza nuestra aplicación informativa de lugares turísticos de Nicaragua.'),
            SizedBox(height: 10),
            Text('1. Información que Recopilamos',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text('Información que Usted Proporciona'),
            Text(
                'Al utilizar nuestra Aplicación, es posible que le solicitemos que nos proporcione cierta información personal, incluyendo, pero no limitado a:'),
            Text(
                '- Nombre y Apellido: Para personalizar su experiencia en la Aplicación.'),
            Text(
                '- Correo Electrónico: Para enviarle actualizaciones y responder a sus consultas.'),
            SizedBox(height: 10),
            Text('2. Uso de la Información',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text(
                'Utilizamos la información recopilada para los siguientes fines:'),
            Text(
                '- Proporcionar y Mejorar la Aplicación: Para asegurarnos de que la Aplicación funcione correctamente y para mejorar nuestras funcionalidades.'),
            Text(
                '- Personalizar su Experiencia: Para adaptar el contenido y las recomendaciones según sus preferencias y ubicación.'),
            Text(
                '- Comunicación: Para enviarle notificaciones importantes, actualizaciones y responder a sus consultas.'),
            SizedBox(height: 10),
            Text('3. Compartir su Información',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text(
                'No compartimos su información personal con terceros, excepto en los siguientes casos:'),
            Text(
                '- Con su Consentimiento: Podemos compartir su información con terceros cuando usted nos haya dado su consentimiento explícito para hacerlo.'),
            Text(
                '- Proveedores de Servicios: Podemos compartir su información con proveedores de servicios que nos ayudan a operar y mejorar la Aplicación, siempre y cuando estos proveedores cumplan con nuestras políticas de privacidad.'),
            Text(
                '- Requisitos Legales: Podemos divulgar su información cuando sea necesario para cumplir con la ley, reglamentos, procesos legales o solicitudes gubernamentales aplicables.'),
            SizedBox(height: 10),
            Text('4. Seguridad de la Información',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text(
                'Implementamos medidas de seguridad razonables para proteger su información personal contra el acceso no autorizado, la alteración, divulgación o destrucción. Sin embargo, tenga en cuenta que ningún método de transmisión por Internet o método de almacenamiento electrónico es 100% seguro y fiable.'),
            SizedBox(height: 10),
            Text('5. Retención de la Información',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text(
                'Conservaremos su información personal solo durante el tiempo que sea necesario para cumplir con los fines descritos en esta Política de Privacidad, a menos que una ley o regulación específica requiera o permita un período de retención más prolongado.'),
            SizedBox(height: 10),
            Text('6. Derechos de los Usuarios',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text('Usted tiene derecho a:'),
            Text(
                '- Acceder a su Información: Solicitar una copia de la información personal que tenemos sobre usted.'),
            Text(
                '- Rectificar su Información: Solicitar la corrección de cualquier información incorrecta o incompleta.'),
            Text(
                '- Eliminar su Información: Solicitar la eliminación de su información personal.'),
            Text(
                '- Oponerse al Tratamiento: Oponerse al tratamiento de su información personal en determinadas circunstancias.'),
            Text(
                'Para ejercer estos derechos, por favor, contáctenos a través de nuestro correo electrónico: privacidad@encantonica.com.'),
            SizedBox(height: 10),
            Text('7. Cambios en esta Política de Privacidad',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text(
                'Podemos actualizar esta Política de Privacidad periódicamente. Cualquier cambio será publicado en esta página y la fecha de vigencia será actualizada. Le recomendamos revisar esta Política de Privacidad regularmente para estar al tanto de cualquier cambio.'),
            SizedBox(height: 10),
            Text('8. Contacto',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text(
                'Si tiene alguna pregunta o inquietud acerca de esta Política de Privacidad, por favor contáctenos a través de nuestro correo electrónico: privacidad@encantonica.com.'),
            SizedBox(height: 10),
            Text('Fecha de vigencia: 3 de julio de 2024.',
                style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic)),
          ],
        ),
      ),
    );
  }
}
