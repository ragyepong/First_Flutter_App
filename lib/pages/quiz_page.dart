import 'package:flutter/material.dart';

import '../utils/question.dart';
import '../utils/quiz.dart';
import '../UI/answer_button.dart';
import '../UI/question_text.dart';
import '../UI/correct_wrong_overlay.dart';

class QuizPage extends StatefulWidget{
  @override
  State createState() => new QuizPageState();
}

class QuizPageState extends State<QuizPage>{

  Question currentQuestion;
  Quiz quiz = new Quiz([
    new Question("Is Elon Musk a human?", false),
    new Question("The antithesis of myopia is hypermetropia", true),
    new Question("Is Odin is the father of Loki?", false),
    new Question("Was Julie Andrews the leading lady in the film 'My Fair Lady?'", false),
    new Question("Was Shrek created as a movie to insult Disney culture?", true),
    new Question("Should Hawaiian pizza be considered sacrilege?", false)
  ]);

  String questionText;
  int questionNumber;
  bool isCorrect;
  bool overlayVisibility = false;

  @override
  void initState(){
    super.initState();
    currentQuestion = quiz.nextQuestion;
    questionText = currentQuestion.question;
    questionNumber = quiz.questionNumber;
  }

  void handleAnswer(bool answer){
    isCorrect = (currentQuestion.answer == answer);
    quiz.answer(isCorrect);
    this.setState((){
      overlayVisibility = true;
    });
  }

  @override
  Widget build(BuildContext context){
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Column(
          children: <Widget>[
            new AnswerButton(true, () => handleAnswer(true)),
            new QuestionText(questionText, questionNumber),
            new AnswerButton(false, () => handleAnswer(false))
          ],
        ),
        overlayVisibility == true ? new CorrectWrongOverlay(isCorrect, (){
          currentQuestion = quiz.nextQuestion;
          this.setState((){
            overlayVisibility = false;
            questionText = currentQuestion.question;
            questionNumber = quiz.questionNumber;
          });
        }) : new Container()
      ]
    );
  }
}