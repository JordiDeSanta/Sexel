import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sexel/src/models/question_model.dart';

class QuestionProvider {
  final String _url = 'https://sexel-5cbc5-default-rtdb.firebaseio.com';

  Future<bool> createProduct(QuestionModel question) async {
    final url = Uri.https(_url, 'question.json');
    final resp = await http.post(url, body: questionModelToJson(question));

    final decodedData = json.decode(resp.body);

    print(decodedData);

    return true;
  }
}
