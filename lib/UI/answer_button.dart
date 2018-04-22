import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final bool _answer;

  AnswerButton(this._answer);

  @override
  Widget build(BuildContext context) {
    return new Expanded( // True Button
        child: new Material(
          color: _answer == true ? Colors.greenAccent:Colors.redAccent,
          child: new InkWell(
            onTap: () => _answer == true ? print("You answered true") : print("You answered false"),
            child: new Center(
              child: new Container(
                padding: new EdgeInsets.all(30.0),
                decoration: new BoxDecoration(
                  border: new Border.all(color: Colors.white, width: 5.0),
                ),
                child: new Text(_answer == true ? "True" : "False",
                style: new TextStyle(color: Colors.white, fontSize: 40.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic )),
              ),
            ),
          ),
        )
    );
  }
}

