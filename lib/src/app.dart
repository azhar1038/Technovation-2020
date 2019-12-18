import 'package:flutter/material.dart';
import 'package:technovation2020/src/ui/tabs.dart';

class Technovation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Technovation',
      theme: ThemeData(
        backgroundColor: Colors.black,
        brightness: Brightness.dark,
        primarySwatch: Colors.purple,
        primaryColor: Colors.purple[200],
        bottomAppBarColor: Colors.purple[200].withOpacity(0.3),
        scaffoldBackgroundColor: Color(0xff121212),
      ),
      home: Tabs(),
    );
  }
}