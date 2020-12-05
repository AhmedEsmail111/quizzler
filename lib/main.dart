import 'package:flutter/material.dart';
import 'package:quizes/widgets/dart/menu.dart';
import 'screens/dart/general_quiz_screen.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuizPage(),
    );
  }
}
