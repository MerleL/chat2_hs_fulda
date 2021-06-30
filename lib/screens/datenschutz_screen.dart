import 'package:flutter/material.dart';

class DatenschutzScreen extends StatelessWidget {
  const DatenschutzScreen({Key? key}) : super(key: key);

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
                buildListTile(
                  context,
                  'blockierte Nutzer',
                  Icon(
                    Icons.check_box,
                    color: Color.fromARGB(255, 78, 90, 92),
                  ),
                ),
                buildListTile(
                  context,
                  'Login-Namen speichern',
                  Icon(
                    Icons.check_box,
                    color: Color.fromARGB(255, 78, 90, 92),
                  ),
                ),
                buildListTile(
                  context,
                  'aktive Sitzungen',
                  Icon(
                    Icons.check_box,
                    color: Color.fromARGB(255, 78, 90, 92),
                  ),
                ),
                buildListTile(
                  context,
                  'Lesebestätigungen',
                  Icon(
                    Icons.check_box,
                    color: Color.fromARGB(255, 78, 90, 92),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
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
          'Datenschutz',
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
    ),
  );
}

Widget buildListTile(BuildContext context, String text, Widget icon) {
  return Card(
    child: ListTile(
      title: Text(
        text,
        style: Theme.of(context).textTheme.bodyText1,
      ),
      leading: icon,
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
