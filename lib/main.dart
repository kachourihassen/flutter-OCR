import 'package:flutter/material.dart';
import 'Screen/HomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Checks verification',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen()
        );
  }
}
