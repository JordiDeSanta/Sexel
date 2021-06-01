import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sexel/src/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarDividerColor: Colors.transparent,
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sexel',
      theme: ThemeData(
        primarySwatch: Colors.red,
        primaryColor: Colors.red.shade200,
        primaryTextTheme: TextTheme(
          headline6: TextStyle(
            color: Colors.white,
            fontSize: 50,
            fontFamily: 'Sweet',
          ),
          caption: TextStyle(
            color: Colors.black,
            fontSize: 12,
            fontFamily: 'Coolvetica',
          ),
        ),
      ),
      initialRoute: 'home',
      routes: {
        'home': (BuildContext context) => HomePage(),
      },
    );
  }
}
