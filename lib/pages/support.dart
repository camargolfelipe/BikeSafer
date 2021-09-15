import 'package:bikesafer/components/template.dart';
import 'package:bikesafer/helper/preferences.dart';
import 'package:bikesafer/helper/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Support extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Template([
      Text(
        "Contate-nos",
        style: const TextStyle(color: white, fontSize: 32.0),
      ),
      Divider(
        color: mainColor,
      ),
      SizedBox(height: 24.0),
      Text(
        "Nosso horário de funcionamento é:",
        style: TextStyle(color: white, fontStyle: FontStyle.italic),
      ),
      Text(
        "\nSegunda a Sexta: 08:00 - 17:00\nSábado, Domingo e Feriados: 09:00 - 13:00",
        style: TextStyle(color: white, fontWeight: FontWeight.bold),
      ),
      Text(
        "\nTelefone: $phoneEmpresa\nEmail: $emailEmpresa",
        style: TextStyle(color: white),
      ),
      Text(
        "\nSiga-nos também nas Redes Sociais!!",
        style: TextStyle(color: white, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 32.0),
      Padding(
        padding: const EdgeInsets.all(24.0),
        child: Row(
          children: [
            Expanded(
                child: FloatingActionButton(
              heroTag: null,
              backgroundColor: Colors.blue[800],
              onPressed: () {
                webRoute(facebookEmpresa);
              },
              child: Icon(
                FontAwesomeIcons.facebook,
                size: 32.0,
                color: white,
              ),
            )),
            Expanded(
                child: FloatingActionButton(
              heroTag: null,
              backgroundColor: Colors.red[400],
              onPressed: () {
                webRoute(InstagramEmpresa);
              },
              child: Icon(
                FontAwesomeIcons.instagram,
                size: 32.0,
                color: white,
              ),
            )),
            Expanded(
                child: FloatingActionButton(
              heroTag: null,
              backgroundColor: Colors.blue[700],
              onPressed: () {
                webRoute(linkedInEmpresa);
              },
              child: Icon(
                FontAwesomeIcons.linkedin,
                size: 32.0,
                color: white,
              ),
            )),
          ],
        ),
      ),
    ]);
  }
}
