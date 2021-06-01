import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Sexel'),
        toolbarHeight: h * 0.1,
      ),
      body: Text(
        'Test Téxt',
        style: Theme.of(context).primaryTextTheme.headline2,
      ),
      bottomNavigationBar: Row(
        children: [
          ElevatedButton(
            onPressed: () {},
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: 80,
              child: Row(
                children: [
                  Icon(Icons.android),
                  Text(
                    'Xelbot',
                    style: Theme.of(context).primaryTextTheme.button,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
