import 'package:bikesafer/components/template.dart';
import 'package:bikesafer/helper/preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:qr_flutter/qr_flutter.dart';

class PersonalInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Template([
      Text(
        "Informações Pessoais",
        style: const TextStyle(color: white, fontSize: 32.0),
      ),
      Divider(
        color: mainColor,
      ),
      SizedBox(height: 24.0),
      PersonalInfoItems('Nome', 'Luís Felipe Camargo'),
      PersonalInfoItems('Idade', '22 anos'),
      PersonalInfoItems('Endereço', 'Rua Ruy Barbosa, 31'),
      PersonalInfoItems('Cidade', 'Caçapava'),
      PersonalInfoItems('Estado', 'São Paulo'),
      PersonalInfoItems('Telefone', '(12) 98280-5314'),
      PersonalInfoItems('Emergência', '(12) 98299-58911 \n(Marco Camargo)'),
      Padding(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: QrImage(
            backgroundColor: white,
            data: "Seu último Registro",
            version: QrVersions.auto,
            size: 160.0,
          ),
        ),
      ),
    ]);
  }
}

class PersonalInfoItems extends StatelessWidget {
  String label;
  String value;
  PersonalInfoItems(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                flex: 4,
                child: Text(
                  "$label: ",
                  style: TextStyle(
                      color: white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0),
                ),
              ),
              Expanded(
                  flex: 7,
                  child: Text(value,
                      style: TextStyle(color: white, fontSize: 16.0)))
            ],
          ),
        ),
        Divider(
          color: white.withOpacity(0.2),
        )
      ],
    );
  }
}
