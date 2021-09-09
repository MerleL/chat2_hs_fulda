import 'package:flutter/material.dart';

class SingleChatScreen extends StatefulWidget {
  @override
  _SingleChatScreenState createState() => _SingleChatScreenState();
}

/* YT
class ViewMessages {
  final String text, showTime;

  ViewMessages(this.text, this.showTime);
}
*/

class ViewMessage {
  String phonenr;
  String text;
  String time;

  ViewMessage(this.phonenr, this.text, this.time);
}

class _SingleChatScreenState extends State<SingleChatScreen> {
  /* YT
  Future getMessages() async {
    var response = await get(Uri.http('localhost:3000', '/chats/1'));
    var jsonData = jsonDecode(response.body);
    List<ViewMessages> messages = [];
    // snapshot.data == null

    for (var u in jsonData) {
      ViewMessages aMessage = ViewMessages(u["text"], u["showTime"]);
      messages.add(aMessage);
      // snapshot.data != null, da Liste mit Daten von der Uri gefuellt wird
    }
    print(messages.length);
    return messages;
  }
*/

  List<ViewMessage> messages = [
    ViewMessage('0123456789',
        'Meine erste Nachricht an dich ist bla bla bla bla bla bla', '11:00'),
    ViewMessage('0987654321',
        'Deine erste Nachricht an mich ist bla bla bla bla bla bla', '11:00'),
    ViewMessage('0123456789',
        'Meine zweite Nachricht an dich ist bla bla bla bla bla bla', '11:05'),
    ViewMessage('0123456789',
        'Meine dritte Nachricht an dich ist bla bla bla bla bla bla', '11:10'),
    ViewMessage('0987654321',
        'Deine zweite Nachricht an mich ist bla bla bla bla bla bla', '11:13'),
    ViewMessage('0123456789',
        'Meine vierte Nachricht an dich ist bla bla bla bla bla bla', '11:14'),
    ViewMessage('0987654321',
        'Deine dritte Nachricht an mich ist bla bla bla bla bla bla', '11:20'),
    ViewMessage('0987654321',
        'Deine vierte Nachricht an mich ist bla bla bla bla bla bla', '11:20'),
    ViewMessage('0123456789',
        'Meine fünfte Nachricht an dich ist bla bla bla bla bla bla', '11:22'),
    ViewMessage('0987654321',
        'Deine fünfte Nachricht an mich ist bla bla bla bla bla bla', '11:45'),
    ViewMessage('0987654321',
        'Deine sechste Nachricht an mich ist bla bla bla bla bla bla', '12:00'),
  ];

  Object get mynr => '0123456789';

  late bool isShowEmoji;

  @override
  void initState() {
    super.initState();
    isShowEmoji = false;
  }

  Future<bool> onBackPress() {
    if (isShowEmoji) {
      setState(() {
        isShowEmoji = false;
      });
    } else {
      Navigator.pop(context);
    }
    return Future.value(false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Padding(
          padding: const EdgeInsets.fromLTRB(40.0, 1.0, 15.0, 1.0),
          child: Container(
            alignment: Alignment.bottomLeft,
            child: SingleChildScrollView(
              child: Row(
                children: [
                  Image(
                    image: AssetImage('assets/images/Logo.png'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Text(
                      'ChatName',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              buildMessage(context),
              buildWriting(context),
              /* YT Test
              ElevatedButton(
                  onPressed: () {
                    getMessages();
                  },
                  child: Text('Click me')),
              Container(
                child: Card(
                  child: FutureBuilder(
                    future: getMessages(),
                    builder: (context, snapshot) {
                      if (snapshot.data == null) {
                        return Container(
                          child: Center(
                            child: Text('Loading'),
                          ),
                        );
                      } else
                        return ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, i) {
                              return ListTile(
                                title: Text(snapshot.data[i].text),
                              );
                            });
                    },
                  ),
                ),


              ),
          */
            ],
          ),
        ),
      ),
    );
  }

  /* YT
  Widget buildMessage(BuildContext context) {
    return Container(
      child: Card(
        child: FutureBuilder(
          future: getMessages(),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return Container(
                child: Center(
                  child: Text('Loading'),
                ),
              );
            } else
              return Expanded(
                child: ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, i) {
                      return ListTile(
                        title: Text(snapshot.data[i].text),
                      );
                    }),
              );
          },
        ),
      ),
    );
  }
 */

  Widget buildMessage(BuildContext context) {
    var align = Alignment.topLeft;
    var boxColor = styleContainer(1);
    return Expanded(
      child: ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index) {
          align = Alignment.topLeft;
          boxColor = styleContainer(1);
          if (messages[index].phonenr == mynr) {
            align = Alignment.topRight;
            boxColor = styleContainer(0);
          }
          return Align(
            alignment: align,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 3.0, horizontal: 10.0),
              child: Container(
                width: MediaQuery.of(context).size.width * (4 / 5),
                // 4/5 der Screen-Breite
                decoration: boxColor,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 8.0, 5.0, 5.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          messages[index].text,
                          style: Theme.of(context).textTheme.headline4,

                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          messages[index].time,
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildWriting(BuildContext context) {
    return WillPopScope(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: double.infinity,
                  height: 70.0,
                  decoration: new BoxDecoration(
                    border: new Border.all(
                      color: Color.fromARGB(255, 200, 200, 200),
                    ),
                    borderRadius: new BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        topRight: Radius.circular(8.0)),
                    color: Color.fromARGB(255, 115, 132, 136),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Material(
                        color: Color.fromARGB(255, 115, 132, 136),
                        child: new Container(
                          child: new IconButton(
                            icon: new Icon(Icons.emoji_emotions),
                            onPressed: () {
                              setState(() {
                                isShowEmoji = !isShowEmoji;
                              });
                            },
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                      ),

                      // Edit text
                      Flexible(
                        child: Container(
                          color: Color.fromARGB(255, 115, 132, 136),
                          child: TextField(
                            decoration: InputDecoration.collapsed(
                              hintText: 'Nachricht',
                              hintStyle: Theme.of(context).textTheme.subtitle2,
                            ),
                          ),
                        ),
                      ),
                      Material(
                        color: Color.fromARGB(255, 115, 132, 136),
                        child: new Container(
                          child: new IconButton(
                            icon: new Icon(Icons.attach_file_outlined),
                            color: Theme.of(context).accentColor,
                            onPressed: () {},
                          ),
                        ),
                      ),
                      Material(
                        color: Color.fromARGB(255, 115, 132, 136),
                        child: new Container(
                          child: new IconButton(
                            icon: new Icon(Icons.mic_rounded),
                            color: Theme.of(context).accentColor,
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Sticker
                (isShowEmoji ? buildEmoji() : Container()),
              ],
            ),
          ],
        ),
        onWillPop: onBackPress);
  }

  Widget buildEmoji() {
    return Column(
      children: [
        /*
        EmojiPicker(
          //rows: 3,
          //columns: 7,
          buttonMode: ButtonMode.MATERIAL,
          onEmojiSelected: (emoji, category) {
            print(emoji);
          },
        ),

         */
        Container(
          child: Row(
            children: [
              Material(
                color: Color.fromARGB(255, 115, 132, 136),
                child: new Container(
                  child: new IconButton(
                    icon: new Icon(Icons.search_outlined),
                    onPressed: () {},
                    color: Theme.of(context).accentColor,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Color.fromARGB(255, 115, 132, 136),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Material(
                        color: Color.fromARGB(255, 115, 132, 136),
                        child: new Container(
                          child: new IconButton(
                            icon: new Icon(Icons.emoji_emotions),
                            onPressed: () {},
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Material(
                        color: Color.fromARGB(255, 115, 132, 136),
                        child: new Container(
                          child: new IconButton(
                            icon: new Icon(Icons.gif, size: 35),
                            onPressed: () {},
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                      ),
                      Material(
                        color: Color.fromARGB(255, 115, 132, 136),
                        child: new Container(
                          child: new IconButton(
                            icon: new Icon(
                              Icons.ac_unit,
                              size: 20,
                            ),
                            onPressed: () {},
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Material(
                color: Color.fromARGB(255, 115, 132, 136),
                child: new Container(
                  child: new IconButton(
                    icon: new Icon(
                      Icons.ac_unit,
                      size: 20,
                    ),
                    onPressed: () {},
                    color: Theme.of(context).accentColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /* Pfeil zum Absenden
  Widget checkTextFieldEmptyOrNot() {
    if (TextEditingController() == '') {
      return Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Icon(
              Icons.attach_file_outlined,
              color: Theme.of(context).accentColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Icon(
              Icons.mic_rounded,
              color: Theme.of(context).accentColor,
            ),
          ),
        ],
      );
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Icon(
          Icons.send,
          color: Theme.of(context).accentColor,
        ),
      );
    }
  }
*/

  BoxDecoration styleContainer(int boxColor) {
    var getColor = Color.fromARGB(255, 200, 200, 200);
    if (boxColor == 0) {
      getColor = Color.fromARGB(150, 102, 197, 48);
    }
    return BoxDecoration(
      color: getColor,
      borderRadius: BorderRadius.all(
        Radius.circular(8.0),
      ),
    );
  }
}
