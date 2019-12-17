import 'package:flutter/material.dart';
import 'package:technovation_2020/src/custom_widget/top_bar.dart';

class Technovation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Technovation',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: Scaffold(
        appBar: TopBar(
          title: 'Test',
        ),
        body: Center(
          child: Text('Hello'),
        ),
      ),
    );
  }
}