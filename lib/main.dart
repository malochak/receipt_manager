import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const _backgroundColor = Color.fromRGBO(37, 49, 70, 1.0);
  static const _textColor = Color.fromRGBO(135, 169, 227, 1.0);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: _backgroundColor,
        body: Center(
          child: Text('Paragonik', style: TextStyle(color: _textColor, fontSize: 24.0)),
        ),
      ),
    );
  }
}

