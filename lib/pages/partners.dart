import 'package:bikesafer/components/template.dart';
import 'package:bikesafer/helper/preferences.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PartnersPage extends StatelessWidget {
  const PartnersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Template([
      Text(
        "Parceiros",
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
          return PartnersItems();
        },
      ),
    ]);
  }
}

class PartnersItems extends StatelessWidget {
  const PartnersItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  flex: 2,
                  child: CircleAvatar(
                    radius: 40.0,
                    backgroundColor: secondColor,
                    child: Icon(FontAwesomeIcons.dumbbell),
                  )),
              Expanded(
                flex: 7,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Jd. Aquarius - São José dos Campos",
                        style: TextStyle(
                            color: white.withOpacity(0.8),
                            fontStyle: FontStyle.italic,
                            fontSize: 12.0),
                      ),
                      Text(
                        "Academia SmartFit - Aquarius",
                        style: TextStyle(
                            color: white.withOpacity(0.7),
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Divider(
            color: secondColor,
          )
        ],
      ),
    );
  }
}
