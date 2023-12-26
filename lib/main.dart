import 'package:flutter/material.dart';
import 'Screens/HomeScreens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(
      //     primaryColor: Color(0xFF075E54),
      //     hintColor: Color(0xFF128C7E)
      // ),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          hintColor: Color(0xFF128C7E),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Color(0xFF128C7E),
        ),
        appBarTheme: AppBarTheme(
          color: Color(0xFF075E54),
        )
      ),
      home: Homescreen(),
    );
  }
}

