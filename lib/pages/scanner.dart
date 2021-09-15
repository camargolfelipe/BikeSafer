import 'package:bikesafer/helper/preferences.dart';
import 'package:flutter/material.dart';
import 'package:scan/scan.dart';

class Scanner extends StatefulWidget {
  @override
  State<Scanner> createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
  ScanController controller = ScanController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ScanView(
        controller: controller,
        scanAreaScale: .7,
        scanLineColor: secondColor,
        onCapture: (data) {
          showDialog(
              context: context,
              builder: (BuildContext context) =>
                  const AlertDialog(title: Text('QRCode Scaneado!')));
        },
      ),
    ));
  }
}
