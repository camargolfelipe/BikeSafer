import 'package:bikesafer/components/forms/secondaryForm.dart';
import 'package:bikesafer/components/template.dart';
import 'package:bikesafer/helper/preferences.dart';
import 'package:bikesafer/helper/routes.dart';
import 'package:bikesafer/pages/QrCode.dart';
import 'package:flutter/material.dart';

class RidePage extends StatelessWidget {
  TextEditingController locationController = TextEditingController();
  TextEditingController doController = TextEditingController();
  TextEditingController contactController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Template([
      Text(
        "Vamos lá!",
        style: const TextStyle(color: white, fontSize: 32.0),
      ),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          "Descreva abaixo o que você fará hoje...",
          style: const TextStyle(
              color: white, fontSize: 16.0, fontStyle: FontStyle.italic),
        ),
      ),
      Divider(
        color: mainColor,
      ),
      SecondaryForm(
          'Eu irei para...', locationController, 1, Icons.location_on),
      SecondaryForm('Eu farei..', doController, 5, Icons.pedal_bike_rounded),
      SecondaryForm(
          'Meu contato de emergência é...', contactController, 1, Icons.phone),
      GestureDetector(
        onTap: () {
          constructRoute(
              context,
              QRCodePage(
                locationController.text,
                doController.text,
                contactController.text,
              ));
        },
        child: Container(
          height: 48.0,
          alignment: Alignment.center,
          margin: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0), color: mainColor),
          child: Text(
            "PRONTO",
            style: const TextStyle(color: white, fontSize: 16.0),
          ),
        ),
      )
    ]);
  }
}
