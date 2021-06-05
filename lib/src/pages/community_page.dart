import 'package:flutter/material.dart';
import 'package:sexel/src/widgets/question_button.dart';

class CommunityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 0.0,
        onPressed: () {
          Navigator.pushNamed(context, 'question');
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.red[200],
      ),
      body: ListView(
        children: [
          QuestionTile(),
        ],
      ),
    );
  }
}
