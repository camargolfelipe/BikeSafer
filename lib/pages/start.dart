import 'package:bikesafer/components/buttons/primaryButton.dart';
import 'package:bikesafer/helper/preferences.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: secondColor,
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              const Expanded(flex: 1, child: SizedBox()),
              Expanded(
                flex: 5,
                child: Lottie.asset(
                  'assets/initial.json',
                ),
              ),
              Expanded(
                flex: 4,
                child: Row(
                  children: [
                    Expanded(child: PrimaryButton("Entrar", "/login")),
                    Expanded(child: PrimaryButton("Cadastrar QRCode", "/scan")),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
