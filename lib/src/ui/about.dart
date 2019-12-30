import 'package:flutter/material.dart';
import 'package:technovation2020/src/custom_widget/fade_in.dart';
import 'package:technovation2020/src/custom_widget/slide_in.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    TextStyle body = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w200,
      wordSpacing: 3,
      letterSpacing: 1,
    );

    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: 200,
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: EdgeInsets.only(bottom: 20, left: 20),
            title: Text(
              'Technovation',
              style: Theme.of(context).textTheme.title,
            ),
            background: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Image.asset(
                  'images/event1.jpg',
                  fit: BoxFit.cover,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0x00000000),
                          Color(0xcc000000)
                        ]),
                  ),
                ),
              ],
            ),
          ),
          pinned: true,
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            <Widget>[
              header('Technovation', -1),
              FadeIn(
                duration: Duration(seconds: 2),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                  child: Text(
                    'The Techno-Cultural fest of the department of CSEA, IGIT, Sarang is back again with a bang to provide a platform to the young ubiquotous talents to give them a new direction, and showcase their innovative and competitive skills',
                    textAlign: TextAlign.left,
                    style: body,
                  ),
                ),
              ),
              header('CSEA', 1),
              FadeIn(
                duration: Duration(seconds: 2),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                  child: Text(
                    'Recognised by the Computer Society of India, due to it\'s advanced technical laboratories, cyber club, diversity of courses offered, numerous achievements and recruitment policy. It is one of the best departments of IGIT emerged over the years.',
                    textAlign: TextAlign.right,
                    style: body,
                  ),
                ),
              ),
              header('IGIT', -1),
              FadeIn(
                duration: Duration(seconds: 2),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                  child: Text(
                    'IGIT was established directly by the Govt. of Odisha in the name of OCE. Prior to this, under the name of MPT, it offered cources in Diploma. Later MPT was merged and the management was transfered to an autonomous society.',
                    textAlign: TextAlign.left,
                    style: body,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget header(String title, double startX) {
    List<Color> gradient;
    Alignment alignment;
    if (startX < 0) {
      gradient = [
        Color(0xff005dea),
        Colors.transparent,
      ];
      alignment = Alignment.centerLeft;
    } else if (startX > 0) {
      gradient = [
        Colors.transparent,
        Color(0xff005dea),
      ];
      alignment = Alignment.centerRight;
    }
    return SlideIn(
      startX: startX,
      startY: 0,
      duration: Duration(seconds: 1),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: gradient,
          ),
        ),
        alignment: alignment,
        padding: EdgeInsets.all(16),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
