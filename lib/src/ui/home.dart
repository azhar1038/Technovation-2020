import 'package:flutter/material.dart';
import 'package:technovation2020/src/custom_widget/slideshow.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                "TECHNOVATION 2020",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: Slideshow(),
            ),
          ),
        ],
      ),
    );
  }
}
