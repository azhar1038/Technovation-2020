import 'package:flutter/material.dart';
import 'package:technovation2020/src/custom_widget/bottom_bar.dart';
import 'package:technovation2020/src/ui/home.dart';

class Tabs extends StatefulWidget {
  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomBar(),
      body: Home(),
    );
  }
}