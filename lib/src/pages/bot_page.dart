import 'package:flutter/material.dart';

class BotPage extends StatefulWidget {
  @override
  _BotPageState createState() => _BotPageState();
}

class _BotPageState extends State<BotPage> {
  @override
  Widget build(BuildContext context) {
    print('xelvooo');
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {},
          child: Container(
            height: 100,
            width: 100,
          ),
        )
      ],
    );
  }
}
