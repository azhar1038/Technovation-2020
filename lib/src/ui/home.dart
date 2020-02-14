import 'dart:convert';

import 'package:technovation2020/src/custom_widget/floating_dots.dart';
import 'package:flutter/material.dart';
import 'package:technovation2020/src/custom_widget/fade_in.dart';
import 'package:technovation2020/src/custom_widget/slideshow.dart';
import 'package:technovation2020/src/bloc/fancy_line_bloc.dart';
import 'package:technovation2020/src/model/event_model.dart';
import 'package:technovation2020/src/resource/intent.dart';
import 'package:technovation2020/src/ui/event_detail.dart';
import 'package:http/http.dart' as http;

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
      "We are live now!",
      "Unsolved mystery with Usual Suspects",
      "Guess, who is comming to meet you!",
      "Hunt for the best talent begins",
      "Jump, duck and evade the Lasers"
    ];
    _fancyLineBloc = FancyLineBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff122e4d),
                Color(0xff122c3d),
                Color(0xff121e2d),
                Color(0xff09131d),
                Color(0xff09131a),
                Colors.black
              ]),
        ),
        child: Stack(
          children: <Widget>[
            FloatingDotGroup(
              number: 16,
              colors: <Color>[
                Colors.white,
                Colors.lightBlueAccent,
              ],
              opacity: 0.5,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  height: 136,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        'Technovation',
                        style: TextStyle(
                          fontFamily: 'JustInTheFireStorm',
                          fontSize: 26,
                        ),
                      ),
                      Text(
                        '13 - 15 March',
                        style: TextStyle(
                          fontFamily: 'JustInTheFireStorm',
                        ),
                      ),
                    ],
                  ),
                  //),
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    '\" A Saga of the Arcane \"',
                    style: TextStyle(
                      fontSize: 20,
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
                        onImageClick: (EventModel em) {
                          if (em.id == 300) {
                            IntentHelper.web('http://igittechnovation.co.in');
                          } else
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    SpecialEventDetail(event: em),
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
          ],
        ),
      ),
    );
  }
}

class SpecialEventDetail extends StatelessWidget {
  final EventModel event;

  SpecialEventDetail({
    this.event,
  });

  Future<EventModel> getEventById() async {
    EventModel e = event;
    try {
      http.Response res = await http.get(
          'https://omega.pythonanywhere.com/android_api/get_event_by_id/?event_id=${event.id}');
      if (res.statusCode == 200) {
        Map<String, dynamic> eventDynamic = json.decode(res.body)['event'];
        e.time = int.parse(eventDynamic['time']);
        e.location = eventDynamic['location'];
        return e;
      } else {
        throw Exception("Failed to load");
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getEventById(),
        builder: (context, AsyncSnapshot<EventModel> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData && !snapshot.hasError) {
              return EventDetail(event: snapshot.data, tag: 'image');
            } else {
              return Center(
                child: Text(
                  'Server Timeout.\nPlease try again.',
                  style: Theme.of(context).textTheme.subtitle1.copyWith(
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
