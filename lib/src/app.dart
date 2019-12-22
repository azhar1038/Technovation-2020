import 'package:flutter/material.dart';
import 'package:technovation2020/src/ui/tabs.dart';

class Technovation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Technovation',
      theme: ThemeData(
        //backgroundColor: Colors.black,
        accentColor: Colors.white,
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        primaryColor: Colors.blue[200],
        bottomAppBarColor: Color(0xff122c3d),
        scaffoldBackgroundColor: Color(0xff09131d),
        cardColor: Color(0xff122c3d),
        appBarTheme: AppBarTheme(
          brightness: Brightness.dark,
          color: Color(0xff122c3d),
          textTheme: TextTheme(
          ),
        ),
      ),
      home: Tabs(),
    );
  }
}