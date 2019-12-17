import 'package:flutter/material.dart';
import 'package:technovation2020/src/ui/home.dart';

class Technovation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Technovation',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: Home(),
    );
  }
}