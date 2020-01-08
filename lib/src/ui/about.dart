import 'package:flutter/material.dart';
import 'package:technovation2020/src/custom_widget/fade_in.dart';
import 'package:technovation2020/src/custom_widget/notched_sliverappbar.dart';
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
        SliverPersistentHeader(
          pinned: true,
          delegate: NotchedSliverAppBar(
            expandedHeight: 200,
            minHeight: 64,
            background: Container(
              alignment: Alignment.center,
              color: Theme.of(context).scaffoldBackgroundColor,
              padding: const EdgeInsets.all(32.0),
              child: Image.asset(
                'android/app/src/main/res/drawable/logo.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            <Widget>[
              SizedBox(height: 32),
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
    BorderRadiusGeometry borderRadius;
    if (startX < 0) {
      gradient = [
        Color(0xff005bea),
        Color(0xff00a6fb),
      ];
      alignment = Alignment.centerLeft;
      borderRadius = BorderRadius.only(
        topRight: Radius.circular(16),
        bottomRight: Radius.circular(16),
      );
    } else if (startX > 0) {
      gradient = [
        Color(0xff00a6fb),
        Color(0xff005bea),
      ];
      alignment = Alignment.centerRight;
      borderRadius = BorderRadius.only(
        topLeft: Radius.circular(16),
        bottomLeft: Radius.circular(16),
      );
    }
    return SlideIn(
      startX: startX,
      startY: 0,
      duration: Duration(seconds: 1),
      child: Container(
        height: 56,
        alignment: alignment,
        child: Container(
          width: MediaQuery.of(context).size.width / 1.3,
          decoration: ShapeDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: gradient,
            ),
            shape: BeveledRectangleBorder(
              borderRadius: borderRadius,
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
      ),
    );
  }
}
