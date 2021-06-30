import 'package:chat2_hs_fulda/screens/support_formular_screen.dart';
import 'package:flutter/material.dart';

class HilfeScreen extends StatelessWidget {
  const HilfeScreen({Key? key}) : super(key: key);

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
                  'Support',
                  Icon(
                    Icons.support_agent,
                    color: Color.fromARGB(255, 78, 90, 92),
                  ),
                  SupportFormularScreen(),
                ),
                buildListTile(
                  context,
                  'FAQ',
                  Icon(
                    Icons.lightbulb,
                    color: Color.fromARGB(255, 78, 90, 92),
                  ),
                  HilfeScreen(),
                ),
                buildListTile(
                  context,
                  'Datenschutzerklärung',
                  Icon(
                    Icons.lock,
                    color: Color.fromARGB(255, 78, 90, 92),
                  ),
                  HilfeScreen(),
                ),
                buildListTile(
                  context,
                  'App-Version',
                  Icon(
                    Icons.phone_android,
                    color: Color.fromARGB(255, 78, 90, 92),
                  ),
                  HilfeScreen(),
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
          'Hilfe',
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
