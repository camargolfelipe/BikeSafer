import 'package:bikesafer/components/template.dart';
import 'package:bikesafer/helper/preferences.dart';
import 'package:flutter/material.dart';

class HistoricPage extends StatelessWidget {
  const HistoricPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Template([
      Text(
        "Histórico",
        style: const TextStyle(color: white, fontSize: 32.0),
      ),
      Divider(
        color: mainColor,
      ),
      SizedBox(height: 24.0),
      ListView.builder(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        itemCount: 6,
        itemBuilder: (context, i) {
          return HistoricItems();
        },
      ),
    ]);
  }
}

class HistoricItems extends StatelessWidget {
  const HistoricItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color: white.withOpacity(0.8),
            borderRadius: BorderRadius.circular(10.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "01/01/2021 | 09:00",
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 10.0),
            ),
            Text(
              "Tatuapé - São Paulo",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            ),
            Divider(),
            Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
              style: TextStyle(fontSize: 12.0, color: grey),
            )
          ],
        ),
      ),
    );
  }
}
