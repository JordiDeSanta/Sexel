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
          _createButton(context, true, Icons.android, 'Xelbot'),
        ],
      ),
    );
  }

  Widget _createButton(
      BuildContext context, bool bInPage, IconData icon, String title) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: ElevatedButton(
        onPressed: () {},
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          height: 80,
          child: Row(
            children: [
              Icon(icon),
              if (bInPage)
                Container(
                  padding: EdgeInsets.only(left: 5),
                  child: Text(
                    title,
                    style: Theme.of(context).primaryTextTheme.button,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
