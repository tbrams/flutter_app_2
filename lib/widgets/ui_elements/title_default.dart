import 'package:flutter/material.dart';

class TitleDefault extends StatelessWidget {
  final String myTitle;
  TitleDefault(this.myTitle);

  @override
  Widget build(BuildContext context) {
    return Text(
      myTitle,
      style: TextStyle(
          fontSize: 26.0, fontWeight: FontWeight.bold, fontFamily: 'Oswald'),
    );
  }
}
