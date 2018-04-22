import 'package:flutter/material.dart';

import '../utils/question.dart';
import '../utils/quiz.dart';
import '../UI/answer_button.dart';
import '../UI/question_text.dart';

class QuizPage extends StatefulWidget{
  @override
  State createState() => new QuizPageState();
}

class QuizPageState extends State<QuizPage>{
  @override
  Widget build(BuildContext context){
    return new Stack(
      children: <Widget>[
        new Column(
          children: <Widget>[
            new AnswerButton(true),
            new QuestionText("Is Hawaiian pizza sacrilege?", 1),
            new AnswerButton(false)
          ],
        )
      ]
    );
  }
}