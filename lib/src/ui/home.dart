import 'package:flutter/material.dart';
import 'package:technovation2020/src/custom_widget/fade_in.dart';
import 'package:technovation2020/src/custom_widget/slideshow.dart';
import 'package:technovation2020/src/bloc/fancy_line_bloc.dart';
import 'package:technovation2020/src/model/event_model.dart';
import 'package:technovation2020/src/resource/firebase_helper.dart';
import 'package:technovation2020/src/ui/event_detail.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> fancyLine;
  FancyLineBloc _fancyLineBloc;

  @override
  void initState() {
    super.initState();
    fancyLine = [
      "Get ready for the best Music Party",
      "Guess who is coming to meet you!",
      "Rock and Roll !",
      "It's Never late to learn new things.",
      "What the heck a Sale poster is doing here!"
    ];
    _fancyLineBloc = FancyLineBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff122e4d),
                Color(0xff122c3d),
                Color(0xff09131d),
                Color(0xff09131a),
              ]),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.only(top: 30),
              height: 180,
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
                  Slideshow(
                    onImageClick: (String id) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => SpecialEventDetail(id: id),
                        ),
                      );
                    },
                  ),
                  StreamBuilder(
                    stream: _fancyLineBloc.indexStream,
                    initialData: 0,
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
      ),
    );
  }
}

class SpecialEventDetail extends StatelessWidget {
  final String id;

  SpecialEventDetail({
    this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: FirebaseHelper.getEvent(id),
        builder: (context, AsyncSnapshot<EventModel> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData && !snapshot.hasError) {
              return EventDetail(event: snapshot.data, tag: 'image');
            } else {
              return Center(
                child: Text(
                  'Server Timeout.\nPlease try again.',
                  style: Theme.of(context).textTheme.subhead.copyWith(
                        color: Colors.white60,
                        fontWeight: FontWeight.w300,
                      ),
                ),
              );
            }
          } else {
            return Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            );
          }
        },
      ),
    );
  }
}
