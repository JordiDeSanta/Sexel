import 'dart:ui';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Sexel'),
        elevation: 0.0,
        centerTitle: true,
        toolbarHeight: h * 0.1,
      ),
      body: Text(
        'Wena po ctm',
        style: Theme.of(context).textTheme.caption,
      ),
    );
  }
}
