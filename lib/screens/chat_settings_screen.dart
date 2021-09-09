import 'package:flutter/material.dart';

bool valueTemp = false;

class ChatSettingsScreen extends StatefulWidget {
  const ChatSettingsScreen({Key? key}) : super(key: key);

  @override
  _ChatSettingsScreenState createState() => _ChatSettingsScreenState();
}

class _ChatSettingsScreenState extends State<ChatSettingsScreen> {
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
                /*buildListTile(
                  context,
                  'Theme',
                  Switch(value: val, onChanged: (changed){

                  }),
                ),*/
                buildListTile(
                  context,
                  'Hintergrundbild ändern',
                  Icon(
                    Icons.wallpaper,
                    color: Color.fromARGB(255, 78, 90, 92),
                  ),
                  ChatSettingsScreen()
                ),
                buildListTile(
                  context,
                  'Schriftgröße',
                  Icon(
                    Icons.text_fields,
                    color: Color.fromARGB(255, 78, 90, 92),
                  ),
                    ChatSettingsScreen()
                ),
                buildCheck(
                  context,
                  "Chat speichern",
                  true
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
          'Chats',
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
