import 'dart:convert';
import 'package:http/http.dart' as http;

import '/models/category.dart';
import '/models/question.dart';

const String baseUrl = "https://opentdb.com/api.php";

Future<List<Question>> getQuestions(Category category, int total, String difficulty) async {
  // String url = "$baseUrl?amount=$total&category=${category.id}";
  // if(difficulty != null) {
  //   url = "$url&difficulty=$difficulty";
  // }
  // http.Response res = await http.get(url);
  String baseUrl = "https://6176781003178d00173dac6b.mockapi.io/question";
  // String baseUrl = "http://api.myfeel.me/question/questionArr";

  http.Response res = await http.get(Uri.parse(baseUrl));
  List<Map<String, dynamic>> questions = List<Map<String,dynamic>>.from(json.decode(res.body));
  return Question.fromData(questions);
}