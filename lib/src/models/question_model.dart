import 'dart:convert';

QuestionModel questionModelFromJson(String str) =>
    QuestionModel.fromJson(json.decode(str));

String questionModelToJson(QuestionModel data) => json.encode(data.toJson());

class QuestionModel {
  QuestionModel({
    this.id = '',
    this.title = '',
    this.text = '',
  });

  String id;
  String title;
  String text;

  factory QuestionModel.fromJson(Map<String, dynamic> json) => QuestionModel(
        title: json["title"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "text": text,
      };
}
