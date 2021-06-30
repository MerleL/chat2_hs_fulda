import 'package:chat2_hs_fulda/screens/benachrichtigungen_screen.dart';
import 'package:chat2_hs_fulda/screens/chat_settings_screen.dart';
import 'package:chat2_hs_fulda/screens/daten_und_speicher_screen.dart';
import 'package:chat2_hs_fulda/screens/datenschutz_screen.dart';
import 'package:chat2_hs_fulda/screens/hilfe_screen.dart';
import 'package:flutter/material.dart';

import 'profil_screen.dart';
import 'sprache_screen.dart';

// ToDo: Unterseiten verlinken

class SettingsScreen extends StatelessWidget {
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
                buildSettings(context),
              ],
            ),
          ),
        ),
      ),
    );
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
            'Einstellungen',
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
      ),
    );
  }

  Widget buildSettings(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Column(
          children: [
            buildListTile(
              context,
              'Profil',
              Icon(
                Icons.account_circle_rounded,
                color: Color.fromARGB(255, 78, 90, 92),
              ),
              ProfilScreen(),
            ),
            buildListTile(
              context,
              'Benachrichtigungen',
              Icon(
                Icons.ac_unit,
                color: Color.fromARGB(255, 78, 90, 92),
              ),
              BenachrichtigungenScreen(),
            ),
            buildListTile(
              context,
              'Datenschutz',
              Icon(
                Icons.lock,
                color: Color.fromARGB(255, 78, 90, 92),
              ),
              DatenschutzScreen(),
            ),
            buildListTile(
              context,
              'Daten und Speicher',
              Icon(
                Icons.data_usage,
                color: Color.fromARGB(255, 78, 90, 92),
              ),
              DatenUndSpeicherScreen(),
            ),
            buildListTile(
              context,
              'Chats',
              Icon(
                Icons.speaker_notes,
                color: Color.fromARGB(255, 78, 90, 92),
              ),
              ChatSettingsScreen(),
            ),
            buildListTile(
              context,
              'Sprache',
              Icon(
                Icons.language,
                color: Color.fromARGB(255, 78, 90, 92),
              ),
              SpracheScreen(),
            ),
            buildListTile(
              context,
              'Hilfe',
              Icon(
                Icons.help,
                color: Color.fromARGB(255, 78, 90, 92),
              ),
              HilfeScreen(),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('Einstellungen zurücksetzen'),
            ),
          ],
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
}
