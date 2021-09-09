// https://flutter.de/artikel/flutter-formulare.html

//import 'dart:convert';
//import 'package:chat2_hs_fulda/messaging/communication.dart';
import 'package:chat2_hs_fulda/screens/uebersicht_screen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool saveFD = false;

  void _launchURLBrowser() async {
    // URL, https://www.geeksforgeeks.org/urls-in-flutter/
    const _url =
        'https://doku.rz.hs-fulda.de/doku.php/docs:benutzeraccount:passwort_aendern';
    await launch(_url);
    /* Folgendes besser, funktioniert mit SDK aber nicht:
    if (await canLaunch(_url)) {
      await launch(_url);
    } else {
      throw 'Could not launch $_url';
    }
    */
  }

  @override
  void initState() {
    super.initState();
  }

  // zur Validierung der Formularfelder
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 1.0),
          child: Align(
            alignment: Alignment.bottomRight,
            child: Container(
              child: Image(
                image: AssetImage('assets/images/Logo.png'),
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: buildHeader(context),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: buildFrstContainer(context),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: buildScndContainer(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: Color.fromARGB(255, 102, 197, 48),
          radius: 45,
          child: Text(
            'CH',
            style: TextStyle(
              fontSize: 40,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          '@',
          style: TextStyle(
            fontSize: 38,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget buildFrstContainer(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: styleContainer(),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 0.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildTextField(context, 'FD Nummer', false),
                  buildTextField(context, 'Kennwort', true),
                  buildLoginBtn(context),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Text('''
Um sich anzumelden, benutzen Sie bitte Ihre Novell-Kennung (fd-Nummer). Nach erfolgter Erstanmeldung gelangen Sie in Ihr Profil, in dem Sie eigenverantwortlich Ihre persönlichen Daten anpassen und pflegen.
Wenn Sie neu an der Hochschule immatrikuliert sind, ändern Sie bitte zunächst Ihr Passwort.''',
                  style: Theme.of(context).textTheme.bodyText2),
            ),
            Container(
              // da TextButton grosse Hoehe hat
              height: 32,
              alignment: Alignment.centerLeft,
              //color: Colors.green,
              child: TextButton(
                style: TextButton.styleFrom(
                  // damit es kein Extra-Padding hat
                  padding: const EdgeInsets.all(0.0),
                ),
                onPressed: _launchURLBrowser,
                child: Text(
                  'Passwort ändern',
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        color: Color.fromARGB(255, 0, 0, 255),
                        decoration: TextDecoration.underline,
                      ),
                ),
              ),
            ),
            buildCookieAlert(context),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(BuildContext context, String text, bool notVisible) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Container(
        width: double.infinity,
        height: 35,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(3)),
        ),
        child: TextFormField(
          // Default-Tastatur = für Text und Zahlen
          // keyboardType: TextInputType.text,
          // Autocorrectur ausstellen
          autocorrect: false,
          obscureText: notVisible,
          style: Theme.of(context).textTheme.bodyText1,
          decoration: InputDecoration(
            labelText: text,
            labelStyle: Theme.of(context).textTheme.bodyText2,
            border: OutlineInputBorder(),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              if (text == 'FD Nummer') {
                return 'Bitte geben Sie eine gültige FD Nummer ein';
              } else {
                return 'Bitte geben Sie ein gültiges Passwort ein';
              }
            }
            return null;
          },
        ),
      ),
    );
  }

  Widget buildLoginBtn(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Container(
        width: double.infinity,
        child: ElevatedButton(
          style: TextButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 78, 90, 92),
            elevation: 0, // entfernt Shadow
          ),
          onPressed: () {
            //Communication.accSearch().then((String value) {
              //print(value.split(',')[4].split(':')[0]);
                // ?: bei "," an Index 4 splitten dort an Index 0 bei ":" splitten
              //print(value);
                //value = komplettes Array
              //var myJson = json.decode(value);
              //print(myJson[1]['fd-Nummer']);
              // vom ersten array fd-Nummer ausgeben
            //});
            //if (_formKey.currentState!.validate()) {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => UebersichtScreen()));
            //}
            /* wenn Login-Daten richtig, aber Ladefehler
            else {
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  content: const Text(
                    '''
Login fehlgeschlagen.
Bitte versuchen Sie es erneut!''',
                    style: TextStyle(color: Colors.black, fontSize: 17),
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'OK'),
                      child: const Text(
                        'OK',
                        style: TextStyle(color: Colors.black, fontSize: 17),
                      ),
                    ),
                  ],
                ),
              );
            }
            */
          },
          child: Text(
            'Login',
            style: TextStyle(
              fontSize: 17,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCookieAlert(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('Cookies müssen aktiviert sein!',
              style: Theme.of(context).textTheme.bodyText1),
          IconButton(
            icon: Icon(
              Icons.help,
              color: Color.fromARGB(255, 78, 90, 92),
            ),
            onPressed: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                content: const Text(
                  '''
Diese App benötigt zwei Cookies:

Das wichtige Cookie heißt ChatSession. Dieses Cookie muss erlaubt sein, damit Sie beim Wechsel von Seite zu Seite angemeldet bleiben. Beim Abmelden oder beim Schließen der App wird das Cookie automatisch gelöscht.

Das andere Cookie dient der Bequemlichkeit und heißt ChatID. Dieses Cookie speichert Ihren Anmeldenamen auf dem Server und bleibt auch nach dem Abmelden erhalten. Beim nächsten Öffnen der App ist Ihr Anmeldename bereits für die Anmeldung eingetragen. Dieses Cookie können Sie verbieten, müssen dann aber Ihren Anmeldenamen immer neu eingeben.''',
                  style: TextStyle(color: Colors.black, fontSize: 17),
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'OK'),
                    child: const Text(
                      'OK',
                      style: TextStyle(color: Colors.black, fontSize: 17),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildScndContainer(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: styleContainer(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Herzlich Willkommen,',
              style: TextStyle(
                fontSize: 30,
                color: Colors.black,
              ),
            ),
            Text(
              '''
            
Sie befinden sich auf der Messenger-Startseite der Hochschule Fulda. Dieses System steht allen Lehrenden und Studierenden zur Verfügung. Lehrende und Lernende können innerhalb Gruppen- bzw. Einzelchats Fachbereich-unspezifisch miteinander kommunizieren. Der Zugriff auf die App ist von überall möglich, die einzige Voraussetzung ist eine Internetverbindung.''',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
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
        Radius.circular(10),
      ),
    );
  }
}
