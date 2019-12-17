import 'package:flutter/material.dart';
import 'package:technovation2020/src/custom_widget/slideshow.dart';
import 'package:technovation2020/src/custom_widget/top_bar.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(
        title: 'Technovation',
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50),
        child: Slideshow(),
      ),
    );
  }
}
