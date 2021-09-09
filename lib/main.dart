
import 'package:chat2_hs_fulda/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CH@',
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 0, 0, 0),
        accentColor: Color.fromARGB(255, 220, 220, 220),
        // AppBar
        appBarTheme: AppBarTheme(
          backgroundColor: Color.fromARGB(255, 102, 197, 48),
        ),
        textTheme: TextTheme(
          // schwarzer Text
          bodyText1: GoogleFonts.blinker(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
            color: Colors.black,
          ),
          // grauer Text
          bodyText2: GoogleFonts.blinker(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
            color: Color.fromARGB(255, 78, 90, 92),
          ),
          // Zeit
          subtitle1: GoogleFonts.blinker(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
            color: Colors.white,
          ),
          // Default-Nachricht
          subtitle2: GoogleFonts.blinker(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
            color: Color.fromARGB(255, 220, 220, 220),
          ),
          headline1: GoogleFonts.blinker(
            fontSize: 23,
            letterSpacing: 0.5,
            color: Colors.white,
          ),
          headline2: GoogleFonts.blinker(
            fontSize: 23,
            letterSpacing: 0.5,
            color: Colors.black,
          ),
          headline3: GoogleFonts.blinker(
            fontSize: 20,
            letterSpacing: 0.5,
            color: Colors.black,
          ),
          headline4: GoogleFonts.blinker(
            fontSize: 17,
            letterSpacing: 0.5,
            color: Colors.black,
          ),
        ),
      ),
      home: LoginScreen(),
    );
  }
}
