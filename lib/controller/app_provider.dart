import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/model/question_answer_model.dart';
import 'package:http/http.dart' as http;

class AppProvider with ChangeNotifier {
  List<QA> qalist = [];

  List<QA> get getlist {
    return [...qalist];
  }

  Future<void> getQuestions() async {
    var url = Uri.parse(
        "https://adeo.app/api/questions/get?level_id=1&course_id=1&limit=20");
    try {
      var post = await http.get(
        url,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
        },
      ).timeout(const Duration(seconds: 20), onTimeout: () {
        throw TimeoutException(
            'The connection has timed out, Check your internet and try again!');
      });

      var response = json.decode(post.body);
      //print(response);

      if (post.statusCode != 200) {
        throw Exception("Something went wrong");
      } else {
        var data = response["data"] as List<dynamic>;
        data.forEach(
          (element) {
            List<Answers> answers = [];
            var ans = element["answers"] as List<dynamic>;
            ans.forEach((element) {
              answers.add(Answers(
                  id: element["id"].toString(),
                  text: element["text"],
                  value: element["value"].toString()));
            });

            qalist.add(
              QA(
                id: element["id"].toString(),
                qustion: element["text"],
                answers: answers,
              ),
            );
          },
        );
      }
    } on Exception catch (e) {
      throw e;
    }
  }
}
