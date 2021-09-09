import 'package:flutter/material.dart';

bool valueTemp = false;
final Map<String, bool> valueMap = {
  "Einzelchats" : false,
  "Gruppen-Chats" : false,
  "Fachbereiche" : false,
  "Pop-Up" : false,
  "In-App" : false,
  "Pop-Up " : false,
  "In-App " : false,
  "Rot" : false,
};

class BenachrichtigungenScreen extends StatefulWidget {
  const BenachrichtigungenScreen({Key? key}) : super(key: key);

  @override
  _BenachrichtigungenScreenState createState() => _BenachrichtigungenScreenState();
}

class _BenachrichtigungenScreenState extends State<BenachrichtigungenScreen> {
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
                            child: Text('Pop-Up-Benachrichtigungen'),
                          ),
                          buildCheck(
                              context,
                              "Einzelchats",
                              false
                          ),
                          buildCheck(
                              context,
                              'Gruppen-Chats',
                              false
                          ),
                          buildCheck(
                              context,
                              'Fachbereiche',
                              false
                          ),
                        ],
                      ),
                    ),
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
                            child: Text('Töne'),
                          ),
                          buildCheck(
                              context,
                              'Pop-Up',
                              false
                          ),
                          buildCheck(
                              context,
                              'In-App',
                              false
                          ),
                        ],
                      ),
                    ),
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
                            child: Text('Vibration'),
                          ),
                          buildCheck(
                              context,
                              'Pop-Up',
                              false
                          ),
                          buildCheck(
                              context,
                              'In-App',
                              false
                          ),
                        ],
                      ),
                    ),
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
                            child: Text('LED-Farbe'),
                          ),
                          buildCheck(
                              context,
                              'Rot',
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
          'Benachrichtigungen',
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

/*Widget buildListTile(BuildContext context, String text, Widget icon) {
  return Container(
    child: Card(
      child: ListTile(
        title: Text(
          text,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        leading: icon,
      ),
    ),
  );
} */

/*
CheckboxListTile(
              title: Text("Mit ListTile"),
              controlAffinity: ListTileControlAffinity.leading,
              value: _checkboxTileValue,
              onChanged: (bool value) {
                setState(() {
                  _checkboxTileValue = value;
                });
                if (_checkboxTileValue == true) {
                  _checkboxValue = false;
                  tempText = "CheckboxListTile!";
                }
                if (_checkboxTileValue == false) {
                  tempText = "Keine Checkbox";
                }
              },
              activeColor: Colors.red,
              checkColor: Colors.purple,
              tileColor: Colors.black12,
            )
 */