import 'package:flutter/material.dart';
import 'package:sexel/src/models/question_model.dart';
import 'package:sexel/src/providers/question_provider.dart';

class CommunityPage extends StatefulWidget {
  @override
  _CommunityPageState createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  final questionProvider = new QuestionProvider();

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
      body: _createProductList(),
    );
  }

  Widget _createProductList() {
    return FutureBuilder(
      future: questionProvider.loadProducts(),
      builder:
          (BuildContext context, AsyncSnapshot<List<QuestionModel>> snapshot) {
        if (snapshot.hasData) {
          final questions = snapshot.data;

          return ListView.builder(
            itemCount: questions?.length,
            itemBuilder: (context, i) => _createItem(context, questions![i]),
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }

  Widget _createItem(BuildContext context, QuestionModel question) {
    return ListTile(
      title: Text(question.title),
      subtitle: Text(question.text),
      onTap: () => Navigator.pushNamed(context, 'question', arguments: question)
          .then((value) => setState(() {})),
    );
  }
}
