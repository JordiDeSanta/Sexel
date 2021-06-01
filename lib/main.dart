import 'package:flutter/material.dart';
import 'package:sexel/src/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sexel',
      theme: ThemeData(
        primarySwatch: Colors.red,
        primaryColor: Colors.red.shade200,
      ),
      initialRoute: 'home',
      routes: {
        'home': (BuildContext context) => HomePage(),
      },
    );
  }
}
