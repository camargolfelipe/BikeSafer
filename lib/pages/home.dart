import 'package:bikesafer/components/template.dart';
import 'package:bikesafer/helper/functions.dart';
import 'package:bikesafer/helper/preferences.dart';
import 'package:bikesafer/helper/routes.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class HomePage extends StatelessWidget {
  TextEditingController locationController = TextEditingController();
  TextEditingController doController = TextEditingController();
  TextEditingController contactController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Random random = new Random();

    return Template([
      Text(
        "Olá Luís Felipe!",
        style: const TextStyle(color: white, fontSize: 32.0),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          '"${motivacional[random.nextInt(motivacional.length - 1)]}"',
          style: const TextStyle(
              color: white, fontSize: 14.0, fontStyle: FontStyle.italic),
        ),
      ),
      Divider(
        color: mainColor,
      ),
      SizedBox(height: 24.0),
      Row(
        children: [
          Expanded(
            child: HomeItems("Editar Dados", Icons.edit, '/editUser'),
          ),
          Expanded(
            child: HomeItems("Visite nosso site", Icons.web, 'web'),
          )
        ],
      ),
      Row(
        children: [
          Expanded(
            child: HomeItems(
                "Nossos Parceiros", Icons.local_cafe_rounded, '/partners'),
          ),
          Expanded(
            child: HomeItems("Suporte", Icons.support_agent, '/support'),
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Divider(color: secondColor),
      ),
      HomeCard(),
      HomeCard(),
    ]);
  }
}

class HomeItems extends StatelessWidget {
  String label;
  IconData icon;
  String route;
  HomeItems(this.label, this.icon, this.route);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (route == "web") {
          webRoute(siteEmpresa);
        } else {
          simpleRoute(context, route);
        }
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.2,
        child: Card(
          color: white.withOpacity(0.9),
          child: Column(
            children: [
              Expanded(
                  flex: 7,
                  child: Icon(
                    icon,
                    color: secondColor,
                    size: 56.0,
                  )),
              Expanded(
                  flex: 3,
                  child: Text(
                    label,
                    style: TextStyle(fontSize: 16.0, color: black),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class HomeCard extends StatelessWidget {
  const HomeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      width: double.infinity,
      child: Card(
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.circular(2.0)),
                )),
            Expanded(
                flex: 9,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."),
                ))
          ],
        ),
      ),
    );
  }
}
