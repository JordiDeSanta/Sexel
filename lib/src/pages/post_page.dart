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
    final prodData =
        ModalRoute.of(context)!.settings.arguments as QuestionModel;
    if (prodData != null) {
      question = prodData;
    }

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Question'),
        actions: [
          IconButton(
            icon: Icon(Icons.photo),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed: () {},
          ),
        ],
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
        return (v.toString().length < 3) ? 'Enter the title' : null;
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
        return (v.toString().length < 3) ? 'Enter the question' : null;
      },
    );
  }

  Widget _createButton() {
    return ElevatedButton.icon(
      onPressed: _submit,
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0.0),
        backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        )),
      ),
      icon: Icon(Icons.save),
      label: Text('Postear', style: TextStyle(fontWeight: FontWeight.w300)),
    );
  }

  void _submit() {
    final cS = formKey.currentState;

    if (cS != null && !cS.validate()) return;

    if (cS != null) cS.save();

    questionProvider.createProduct(question);
  }
}
