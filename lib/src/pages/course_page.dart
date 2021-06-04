import 'package:flutter/material.dart';
import 'package:sexel/src/widgets/circle_button.dart';

class CoursePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          CircleButton(
            iconRoute: 'assets/icons/humans.png',
            name: 'Humanos',
          ),
        ],
      ),
    );
  }
}
