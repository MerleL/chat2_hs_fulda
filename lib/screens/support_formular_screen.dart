import 'package:flutter/material.dart';

class SupportFormularScreen extends StatelessWidget {
  const SupportFormularScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SafeArea(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                buildHeader(context),
                buildTextField(context),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 78, 90, 92),
                      elevation: 0, // entfernt Shadow
                    ),
                    onPressed: () {},
                    child: Text(
                      'Absenden',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                      ),
                    ),
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

AppBar buildAppBar() {
  return AppBar(
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
          'Support',
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
    ),
  );
}

Widget buildTextField(context) {
  return Flexible(
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        height: MediaQuery.of(context).size.height * (1 / 2),
        decoration: new BoxDecoration(
          border: new Border.all(
            color: Color.fromARGB(255, 200, 200, 200),
          ),
          borderRadius: new BorderRadius.all(Radius.circular(8.0)),
          color: Color.fromARGB(255, 115, 132, 136),
        ),
        child: TextField(
          decoration: InputDecoration.collapsed(
            hintText: 'Ihre Nachricht',
            hintStyle: Theme.of(context).textTheme.subtitle2,
          ),
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
