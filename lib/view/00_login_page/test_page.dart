import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  String text;
  TestPage({
    Key? key,
    required this.text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text(text),
        ),
      ),
    );
  }
}
