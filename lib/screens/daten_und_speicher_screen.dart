import 'package:flutter/material.dart';

bool valueTemp = false;

class DatenUndSpeicherScreen extends StatefulWidget {
  const DatenUndSpeicherScreen({Key? key}) : super(key: key);

  @override
  _DatenUndSpeicherScreenState createState() => _DatenUndSpeicherScreenState();
}

class _DatenUndSpeicherScreenState extends State<DatenUndSpeicherScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  buildHeader(context),
                  buildListTile(
                    context,
                    'Daten verwalten',
                    Icon(
                      Icons.folder,
                      color: Color.fromARGB(255, 78, 90, 92),
                    ),
                      DatenUndSpeicherScreen()
                  ),
                  buildListTile(
                    context,
                    'Netzwerknutzung',
                    Icon(
                      Icons.cloud_circle,
                      color: Color.fromARGB(255, 78, 90, 92),
                    ),
                    DatenUndSpeicherScreen()
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(200, 240, 240, 240),
                        border: Border.all(
                          color: Color.fromARGB(255, 200, 200, 200),
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(4.0),
                        ),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Text('Medien automatisch downloaden'),
                          ),
                          buildCheck(
                              context,
                              "Bei mobiler Datenverbindung",
                              false
                          ),
                          buildCheck(
                              context,
                              "Bei Wlan-Verbindung",
                              false
                          ),
                          buildCheck(
                              context,
                              "Bei Roaming",
                              false
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

          ),
        )
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
          'Daten und Speicher',
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
    ),
  );
}

Widget buildListTile(BuildContext context, String text, Widget icon, screen) {
  return Card(
    child: ListTile(
      title: Text(
        text,
        style: Theme.of(context).textTheme.bodyText1,
      ),
      leading: icon,
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => screen));
      },
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
