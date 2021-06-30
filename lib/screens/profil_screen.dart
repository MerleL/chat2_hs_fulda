import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ToDo: Loesung fuer lange Namen/Staden
// ToDo Datenbank: Name, FD, Bild; Bild/Status änderbar

class ProfilScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 1.0),
          child: Align(
            alignment: Alignment.bottomRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width * 0.50 - 40,
                    // die Hälfte des Screens - die Breite des Logos
                    child: Text(
                      'Profil',
                      style: Theme.of(context).textTheme.headline1,
                    )),
                Container(
                  child: Image(
                    image: AssetImage('assets/images/Logo.png'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 10.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 140,
                    height: 140,
                    //color: Colors.green,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: CircleAvatar(
                        radius: 140,
                        backgroundColor: Colors.black,
                        child: Image(
                          image: AssetImage('assets/images/defaultImage.png'),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              buildList(
                context,
                'Name:',
                'Mein Name',
                Icon(
                  Icons.person,
                  color: Color.fromARGB(255, 78, 90, 92),
                ),
              ),
              buildList(
                context,
                'FD Nummer:',
                'fdai1234',
                Icon(
                  Icons.vpn_key,
                  color: Color.fromARGB(255, 78, 90, 92),
                ),
              ),
              buildList(
                context,
                'Handynummer:',
                '0123456789',
                Icon(
                  Icons.phone,
                  color: Color.fromARGB(255, 78, 90, 92),
                ),
              ),
              buildList(
                context,
                'Status:',
                'suche Lerngruppe',
                Icon(
                  Icons.info,
                  color: Color.fromARGB(255, 78, 90, 92),
                ),
              ),
              buildList(
                context,
                'zuletzt online',
                'für jeden sichtbar',
                Icon(
                  Icons.remove_red_eye,
                  color: Color.fromARGB(255, 78, 90, 92),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildList(BuildContext context, String given, String get, icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color.fromARGB(200, 240, 240, 240),
          borderRadius: BorderRadius.all(
            Radius.circular(4.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Row(
                  children: [
                    icon,
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        given,
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: Text(
                  get,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
