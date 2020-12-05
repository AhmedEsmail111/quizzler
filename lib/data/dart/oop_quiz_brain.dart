import 'package:flutter/cupertino.dart';
import 'file:///G:/Flutter/Projects/quizes/lib/models/dart/questions.dart';
import 'package:flutter/material.dart';
import 'package:quizes/screens/dart/general_quiz_screen.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class OopQuizBrain {
  // an integer to keep track of our position inside the list or the index
  // that we are displaying to the user now
  int _questionsNum = 0;

  // a variable to track the score of the user
  int correctAnswers = 0;

  // a list of Questions objects to store the question and its answer
  List<Question> _questions = [
    Question(
        'Abstraction means separating functionality between classes. ', true),
    Question(
        'Encapsulation means that every class is responsible for every thing related to it.',
        true),
    Question(
        'Encapsulation means that it\'s not allowed to any class to change the value of another  class\'s properties. ',
        true),
    Question('the class is the same as the object.', false),
    Question('constructors constructs objects from the class.', true),
    Question(
        'There is a limit to the number of Objects you can make out of a certain Class.',
        false),
    Question('a class is the blueprint of an object.', true),
    Question(
        'each class has properties like adjectives and methods like things he can do.',
        true),
    Question('there is a limit to the properties a class can have.', false),
    Question(
        'Inheritance means to inherit or have the same abilities your parent has',
        true),
    Question('Inheritance doesn\'t reduce boilerplate code.', false),
    Question(
        'Polymorphism is the ability to inherit from a parent class but also change some behavior of that parent class.',
        true),
    Question(
        'Opp is a way to make our code reusable and maintainable and can be tested easily',
        true),
    Question(
        'the modifier \"final\" means you can change the value of this property later on.',
        false),
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
              "Go Back",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => QuizPage(),
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

  // a style to the alert
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
