import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:sexel/src/pages/home_page.dart';
import 'package:sexel/src/providers/ad_state.dart';
import 'package:sexel/src/providers/ui_state.dart';

void main() {
  runApp(MyApp());

  WidgetsFlutterBinding.ensureInitialized();
  final initFuture = MobileAds.instance.initialize();
  final adState = AdState(initFuture);
  runApp(
    Provider.value(
      value: adState,
      builder: (context, child) => MyApp(),
    ),
  );
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

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => new UiProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Sexel',
        theme: ThemeData(
          primarySwatch: Colors.red,
          primaryColor: Colors.red.shade200,
          iconTheme: IconThemeData(color: Colors.white, size: 25),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(0.0),
              backgroundColor: MaterialStateProperty.all(Colors.red[200]),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              ),
            ),
          ),
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.red[200],
            centerTitle: true,
            elevation: 0.0,
          ),
          primaryTextTheme: TextTheme(
            headline6: TextStyle(
              color: Colors.white,
              fontSize: 50,
              fontFamily: 'Sweet',
            ),
            headline2: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: 'Coolvetica',
            ),
            button: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: 'Uniflex',
            ),
          ),
        ),
        initialRoute: 'home',
        routes: {
          'home': (BuildContext context) => HomePage(),
        },
      ),
    );
  }
}
