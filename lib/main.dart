import 'package:flutter/material.dart';
import 'package:flutter_app22/screens/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

import 'const.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: KBackgroundColor ),
        scaffoldBackgroundColor: KBackgroundColor,
        primaryColor: Colors.white,
        accentColor: KAccentColor,
        iconTheme: IconThemeData(color: Colors.black),
        fontFamily: GoogleFonts.montserrat().fontFamily,
        textTheme: GoogleFonts.montserratTextTheme(),
      ),
      home: MyHome(),
    );
  }
}



