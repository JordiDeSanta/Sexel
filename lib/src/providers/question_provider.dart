import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sexel/src/models/question_model.dart';

class QuestionProvider {
  final String _url = 'sexel-5cbc5-default-rtdb.firebaseio.com';

  Future<bool> createProduct(QuestionModel question) async {
    final url = Uri.https(_url, 'question.json');
    final resp = await http.post(url, body: questionModelToJson(question));

    final decodedData = json.decode(resp.body);

    print(decodedData);

    return true;
  }

  Future<bool> editProduct(QuestionModel product) async {
    final url = Uri.https(_url, 'question/${product.id}.json');
    final resp = await http.put(url, body: questionModelToJson(product));

    final decodedData = json.decode(resp.body);
    print(decodedData);

    return true;
  }

  Future<List<QuestionModel>> loadProducts() async {
    final url = Uri.https(_url, 'question.json');
    final resp = await http.get(url);

    final Map<String, dynamic> decodedData = json.decode(resp.body);
    final List<QuestionModel> questions = [];

    if (decodedData == null) return [];

    decodedData.forEach((id, question) {
      final qTemp = QuestionModel.fromJson(question);
      qTemp.id = id;

      questions.add(qTemp);
    });

    return questions;
  }

  Future<int> deleteProduct(String id) async {
    final url = Uri.https(_url, 'question/$id.json');
    final resp = await http.delete(url);

    final decodedData = json.decode(resp.body);

    print(decodedData);

    return 1;
  }
}
