import 'package:flutter/material.dart';
import 'package:quizes/screens/dart/oop_quiz_screen.dart';

class MyMenuItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
      child: Column(
        children: <Widget>[
          Card(
            elevation: 5,
            child: ListTile(
              title: Text(
                "General Quiz",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                ),
              ),
              onTap: () {
                Navigator.of(context).pushNamed('/');
              },
            ),
          ),
          Card(
            elevation: 5,
            child: ListTile(
              title: Text(
                "OOP Quiz",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                ),
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => OopQuizPage(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
