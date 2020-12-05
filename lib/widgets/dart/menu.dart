import 'package:flutter/material.dart';
import 'package:quizes/widgets/dart/menu_items.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.brown[500],
        child: ListView(
          children: <Widget>[
            MyMenuItems(),
          ],
        ),
      ),
    );
  }
}
