import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sexel/src/models/question_model.dart';
import 'package:sexel/src/providers/question_provider.dart';

class PostPage extends StatefulWidget {
  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  QuestionModel question = new QuestionModel();
  final questionProvider = new QuestionProvider();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;

    final prodData =
        ModalRoute.of(context)!.settings.arguments as QuestionModel;
    if (prodData != null) {
      question = prodData;
    }

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Question'),
        toolbarHeight: h * 0.1,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                _insertTitle(),
                _insertQuestion(),
                SizedBox(height: 10),
                _createButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _insertTitle() {
    return TextFormField(
      initialValue: question.title,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Title',
      ),
      onSaved: (v) => question.title = v.toString(),
      validator: (v) {
        return (v.toString().length < 3)
            ? 'Enter the title'
            : (v.toString().length > 50)
                ? 'Less than 50 characters'
                : null;
      },
    );
  }

  Widget _insertQuestion() {
    return TextFormField(
      initialValue: question.text,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Question',
      ),
      onSaved: (v) => question.text = v.toString(),
      validator: (v) {
        return (v.toString().length < 50)
            ? 'Enter the question'
            : (v.toString().length > 1000)
                ? 'Less than 1000 characters'
                : null;
      },
      minLines: 2,
      maxLines: 40,
    );
  }

  Widget _createButton() {
    return ElevatedButton.icon(
      onPressed: _submit,
      style: ButtonStyle(
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        )),
      ),
      icon: Icon(Icons.question_answer),
      label: Text('Post', style: TextStyle(fontWeight: FontWeight.w300)),
    );
  }

  void _submit() {
    final cS = formKey.currentState;

    if (cS != null && !cS.validate()) return;

    if (cS != null) cS.save();

    if (question.id == null) {
      questionProvider.createProduct(question);
    } else {
      questionProvider.editProduct(question);
    }

    Navigator.pop(context);
  }
}
