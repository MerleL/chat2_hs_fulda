import 'package:flutter/material.dart';

bool valueTemp = false;

class SpracheScreen extends StatefulWidget {
  const SpracheScreen({Key? key}) : super(key: key);

  @override
  _SpracheScreenState createState() => _SpracheScreenState();
}

class _SpracheScreenState extends State<SpracheScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                buildHeader(context),
                buildCheck(
                    context,
                    "Deutsch",
                    true
                ),
                buildCheck(
                    context,
                    "English",
                    false
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget buildCheck(BuildContext context, String text, bool valueLT) {
    return Container(
        child: Card(
          child: CheckboxListTile(
            title: Text(
              text,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            controlAffinity: ListTileControlAffinity.leading,
            value: valueTemp,
            onChanged: (bool? value) {
              setState(() {
                valueTemp = value!;
              });
            },
            activeColor: Color.fromARGB(255, 78, 90, 92),
          ),
        )
    );
  }
}

Widget buildHeader(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5.0),
    child: Container(
      width: double.infinity,
      alignment: Alignment.center,
      decoration: styleContainer(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Text(
          'Sprache',
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
    ),
  );
}

BoxDecoration styleContainer() {
  return BoxDecoration(
    color: Color.fromARGB(200, 240, 240, 240),
    border: Border.all(
      color: Color.fromARGB(255, 200, 200, 200),
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(4.0),
    ),
  );
}
