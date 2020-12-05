import 'package:flutter/cupertino.dart';
import 'file:///G:/Flutter/Projects/quizes/lib/models/dart/questions.dart';
import 'package:flutter/material.dart';
import 'package:quizes/screens/dart/oop_quiz_screen.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class GeneralQuizBrain {
  // an integer to keep track of our position inside the list or the index
  // that we are displaying to the user now
  int _questionsNum = 0;

  // a variable to track the score of the user
  int correctAnswers = 0;

  // a list of Questions objects to store the question and its answer
  List<Question> _questions = [
    Question('Some cats are actually allergic to humans', true),
    Question('peoples\' personalities are divided into 16 types', true),
    Question('is Egypt in Europe', false),
    Question('is Trump a jerk', true),
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
    Question('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    Question('It is illegal to pee in the Ocean in Portugal.', true),
    Question(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Question(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    Question(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Question(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    Question('Google was originally called \"Backrub\".', true),
  ];

  // a function that return the question object associated
  // with the index we are giving it
  Question getQuestion() {
    return _questions[_questionsNum];
  }

  // a function to return the length of the list
  int getLength() => _questions.length - 1;

  // a method to check the answer of the user and move to the next question
  // and when the questions end to back to the beginning

  void updateState(List<Icon> myList, context) {
    int _length = getLength();
    _questionsNum++;
    if (_questionsNum > _length) {
      Alert(
        context: context,
        style: alertStyle,
        title: "Well Done",
        image: Image.asset('images/check_image.jpg'),
        desc: "You completed all the questions !\n"
            "Your Score: $correctAnswers ",
        buttons: [
          DialogButton(
            color: Colors.blueGrey,
            child: Text(
              "COOL",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          ),
          DialogButton(
            color: Colors.blueGrey,
            child: Text(
              "Next Quiz",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => OopQuizPage(),
                ),
              );
            },
            width: 120,
          ),
        ],
      ).show();
      _questionsNum = 0;
      myList.clear();
      correctAnswers = 0;
    }
  }

  var alertStyle = AlertStyle(
    animationType: AnimationType.grow,
    isCloseButton: false,
    isOverlayTapDismiss: false,
    descStyle: TextStyle(fontWeight: FontWeight.bold),
    descTextAlign: TextAlign.center,
    animationDuration: Duration(milliseconds: 400),
    alertBorder: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
      side: BorderSide(
        color: Colors.grey,
      ),
    ),
    titleStyle: TextStyle(
      color: Colors.teal,
    ),
    alertAlignment: Alignment.center,
  );
}
