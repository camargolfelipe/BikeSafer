import 'package:bikesafer/helper/preferences.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCodePage extends StatelessWidget {
  String location;
  String doing;
  String emergency;
  QRCodePage(this.location, this.doing, this.emergency);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: secondColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        body: Column(
          children: [
            Expanded(
              flex: 8,
              child: Center(
                child: QrImage(
                  backgroundColor: white,
                  data:
                      "Estou indo para $location, fazer $doing. Por favor, contate $emergency.",
                  version: QrVersions.auto,
                  size: 240.0,
                ),
              ),
            ),
            Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Estou indo para $location, fazer $doing. Por favor, contate $emergency.",
                    style: TextStyle(color: white, fontStyle: FontStyle.italic),
                  ),
                ))
          ],
        ));
  }
}
