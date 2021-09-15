import 'package:bikesafer/components/template.dart';
import 'package:bikesafer/helper/functions.dart';
import 'package:bikesafer/helper/preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EditUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Template([
      Text(
        "Edição de informações pessoais",
        style: const TextStyle(color: white, fontSize: 24.0),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Clique nas informações que deseja modificar.',
          style: const TextStyle(
              color: white, fontSize: 14.0, fontStyle: FontStyle.italic),
        ),
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
    ]);
  }
}

class PersonalInfoItems extends StatelessWidget {
  String label;
  String value;
  PersonalInfoItems(this.label, this.value);
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextButton(
            onPressed: () {
              dialog(
                context,
                '$label: $value',
                TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: "Novo $label")),
              );
            },
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
        ),
        Divider(
          color: white.withOpacity(0.2),
        )
      ],
    );
  }
}
