import 'package:bikesafer/helper/preferences.dart';
import 'package:bikesafer/helper/routes.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class TransitionPage extends StatelessWidget {
  const TransitionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(
        const Duration(seconds: 3),
        () {
          simpleRoute(context, '/home');
        },
      ),
      builder: (context, snapshot) {
        return Container(
          height: double.infinity,
          width: double.infinity,
          color: mainColor,
          child: Lottie.asset('assets/transition.json', height: 240.0),
        );
      },
    );
  }
}
