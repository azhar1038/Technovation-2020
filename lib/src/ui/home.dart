import 'package:flutter/material.dart';
import 'package:technovation2020/src/custom_widget/fade_in.dart';
import 'package:technovation2020/src/custom_widget/slideshow.dart';
import 'package:technovation2020/src/bloc/fancy_line_bloc.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> fancyLine = [
    "Get ready for the best Music Party",
    "Guess who is coming to meet you!",
    "Rock and Roll !",
    "It's Never late to learn new things.",
    "What the heck a Sale \nposter is doing here!"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.only(top: 30),
            child: Image.asset(
              'images/logo.png',
              width: 250.0,
            ),
            //),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              '\" The Tag Line \"', //TODO: Add the tag line.
              style: TextStyle(
                fontSize: 25,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Slideshow(),
                StreamBuilder(
                  stream: fancyLineBloc.indexStream,
                  builder: (context, AsyncSnapshot<int> snapshot) {
                    String text = '';
                    if (snapshot.hasData) {
                      text = fancyLine[snapshot.data];
                    }
                    return FadeIn(
                      child: Text(
                        text,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
