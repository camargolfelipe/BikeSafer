import 'package:bikesafer/components/transition.dart';
import 'package:bikesafer/pages/editUser.dart';
import 'package:bikesafer/pages/map.dart';
import 'package:bikesafer/pages/partners.dart';
import 'package:flutter/material.dart';
import 'package:bikesafer/pages/historic.dart';
import 'package:bikesafer/pages/home.dart';
import 'package:bikesafer/pages/ride.dart';
import 'package:bikesafer/pages/personalInfo.dart';
import 'package:bikesafer/pages/scanner.dart';
import 'package:bikesafer/pages/start.dart';
import 'package:bikesafer/pages/login.dart';
import 'package:bikesafer/pages/support.dart';
import 'package:url_launcher/url_launcher.dart';

final appRoutes = {
  '/': (context) => const StartPage(),
  '/editUser': (context) => EditUser(),
  '/history': (context) => HistoricPage(),
  '/home': (context) => HomePage(),
  '/login': (context) => LoginPage(),
  '/maps': (context) => MapSample(),
  '/partners': (context) => PartnersPage(),
  '/personalInfomation': (context) => PersonalInfo(),
  '/ride': (context) => RidePage(),
  '/scan': (context) => Scanner(),
  '/support': (context) => Support(),
  '/transition': (context) => TransitionPage(),
};

//FUNCTIONS

simpleRoute(context, String route) {
  return Navigator.pushNamed(context, route);
}

constructRoute(context, Widget route) {
  return Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => route),
  );
}

webRoute(url) async {
  return await canLaunch(url)
      ? await launch(url)
      : throw 'Could not launch $url';
}
