import 'package:bikesafer/components/buttons/primaryButton.dart';
import 'package:bikesafer/components/forms/primaryForm.dart';
import 'package:bikesafer/helper/preferences.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatelessWidget {
  TextEditingController login = TextEditingController();
  TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        backgroundColor: secondColor,
        body: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            Lottie.asset('assets/login.json', height: 240.0),
            Text("BikeSafer",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: white, fontSize: 32.0, fontWeight: FontWeight.bold)),
            PrimaryForm(
              "Login",
              login,
              false,
              white,
            ),
            PrimaryForm(
              "Password",
              pass,
              true,
              white,
            ),
            PrimaryButton("Logar", "/transition"),
            SizedBox(height: 40.0),
            Text(
              "© 2021 Sety Tecnologias Ltd. All copyrights reserved.",
              textAlign: TextAlign.center,
            )
          ],
        ));
  }
}
