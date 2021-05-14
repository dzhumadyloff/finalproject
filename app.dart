import 'package:flutter/material.dart';
import 'package:notes_app/screens/home.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes App',
      theme: ThemeData(
        primaryColor: Colors.lightBlueAccent,
      ),
      home: Home(),
    );
  }
}
