import 'package:flutter/material.dart';
import 'package:technovation2020/src/custom_widget/bottom_bar.dart';
import 'package:technovation2020/src/ui/events.dart';
import 'package:technovation2020/src/ui/home.dart';

class Tabs extends StatefulWidget {
  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = new PageController(initialPage: 0);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomBar(
        onItemPressed: (int i){
          _pageController.jumpToPage(i);
        },
      ),
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          Home(),
          Events(),
          Container(color: Colors.green,),
          Container(color: Colors.blue,),
        ],
      ),
    );
  }
}