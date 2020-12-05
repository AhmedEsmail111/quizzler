import 'package:flutter/material.dart';
import 'package:quizes/widgets/dart/menu.dart';

import '../../data/dart/general_quiz_brain.dart';

GeneralQuizBrain _quizBrain = GeneralQuizBrain();

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  // a list of icons to keep track of the user score
  List<Icon> _scoreKeeper = [];

  // a boolean to check the answer of the user to determine which icon to print
  bool _rightOrWrong = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.brown[300],
        appBar: AppBar(
          title: Text('General Quiz'),
          backgroundColor: Colors.brown[600],
          centerTitle: true,
        ),
        drawer: MyDrawer(),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Center(
                      child: Text(
                        _quizBrain.getQuestion().questionText,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: FlatButton(
                      color: Colors.blueGrey[700],
                      child: Text(
                        'Correct',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                      onPressed: () {
                        //The user picked true.
                        setState(() {
                          checkAnswer(true);
                          _quizBrain.updateState(_scoreKeeper, context);
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: FlatButton(
                      color: Colors.yellow[800],
                      child: Text(
                        'Wrong',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        //The user picked false.
                        setState(() {
                          checkAnswer(false);
                          _quizBrain.updateState(_scoreKeeper, context);
                        });
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: _scoreKeeper,
                  ),
                )
              ],
            ),
          ),
        ));
  }

  // a method to check the answer if it's correct, we display a green check icon,
  // but if it's wrong, we display a red close icon
  void checkAnswer(bool answer) {
    bool _correctAnswer = _quizBrain.getQuestion().questionAnswer;
    if (_correctAnswer == answer) {
      _quizBrain.correctAnswers++;
      _rightOrWrong = true;
      createIcon();
    } else {
      _rightOrWrong = false;
      createIcon();
    }
  }

  void createIcon() {
    if (_rightOrWrong) {
      _scoreKeeper.add(
        Icon(
          Icons.check,
          color: Colors.green[700],
        ),
      );
    } else {
      _scoreKeeper.add(
        Icon(
          Icons.close,
          color: Colors.red[900],
        ),
      );
    }
  }
}
