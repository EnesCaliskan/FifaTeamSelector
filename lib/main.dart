import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled1/screens/MainScreen.dart';

void main(){
  runApp(MainApplication());
}

class MainApplication extends StatefulWidget {
  const MainApplication({Key? key}) : super(key: key);

  @override
  State<MainApplication> createState() => _MainApplicationState();
}

class _MainApplicationState extends State<MainApplication> {

  int currentPage = 0;
  final screens = [
    MainScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        textTheme: GoogleFonts.oxygenTextTheme(
          Theme.of(context).textTheme
        ),
      ),
      home: Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: false,
        body: MainScreen(),

      ),
    );
  }
}
