import 'package:bikesafer/helper/preferences.dart';
import 'package:bikesafer/helper/routes.dart';
import 'package:flutter/material.dart';

class DrawerComponent extends StatelessWidget {
  const DrawerComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(color: black.withOpacity(0.8)),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: mainColor),
              child: Center(
                  child: CircleAvatar(
                backgroundColor: secondColor,
                radius: 48.0,
                child: Text(
                  "L",
                  style: TextStyle(color: white, fontSize: 40.0),
                ),
              )),
            ),
            DrawerItems("Home", Icons.home_filled, "/home"),
            DrawerItems("Histórico", Icons.history, "/history"),
            DrawerItems(
                "Informações Pessoais", Icons.person, "/personalInfomation"),
            DrawerItems("Localização atual", Icons.map_sharp, "/maps"),
            DrawerItems("Sair", Icons.power_settings_new_rounded, "/login"),
          ],
        ),
      ),
    );
  }
}

class DrawerItems extends StatelessWidget {
  String title;
  IconData icon;
  String route;
  DrawerItems(this.title, this.icon, this.route);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: white),
      title: Text(title, style: TextStyle(color: white, fontSize: 16.0)),
      onTap: () {
        simpleRoute(context, route);
      },
    );
  }
}
