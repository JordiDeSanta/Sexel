import 'package:flutter/material.dart';
import 'package:sexel/src/widgets/notification.dart';

class BotPage extends StatefulWidget {
  @override
  _BotPageState createState() => _BotPageState();
}

class _BotPageState extends State<BotPage> {
  @override
  Widget build(BuildContext context) {
    print('xelvooo');
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Card(
          clipBehavior: Clip.antiAlias,
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            padding: EdgeInsets.all(10),
            color: Colors.red[50],
            height: 200,
            width: 300,
            child: ListView(
              children: [
                Text(
                  'Notificaciones',
                  style: Theme.of(context).primaryTextTheme.headline3,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                AppNotification(),
                AppNotification(),
                AppNotification(),
                AppNotification(),
              ],
            ),
          ),
        ),
        Container(
          height: 300,
          child: Image(
            image: AssetImage('assets/img/xelbot.png'),
          ),
        ),
        Container(height: 50),
      ],
    );
  }
}
