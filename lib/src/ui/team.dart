import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:technovation2020/src/custom_widget/floating_dots.dart';
import 'package:technovation2020/src/model/team_model.dart';
import 'package:technovation2020/src/resource/team_provider.dart';

class Team extends StatefulWidget {
  @override
  _TeamState createState() => _TeamState();
}

class _TeamState extends State<Team> {
  PageController _pageController;
  TeamProvider tp = TeamProvider();

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0,
      keepPage: true,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          FloatingDotGroup(
            number: 16,
            colors: <Color>[
              Colors.white,
              Colors.lightBlueAccent,
            ],
            opacity: 0.5,
          ),
          PageView(
            controller: _pageController,
            scrollDirection: Axis.vertical,
            children: <Widget>[
              _TeamPage(
                key: PageStorageKey(0),
                type: TeamType.BTECH,
              ),
              _TeamPage(
                key: PageStorageKey(1),
                type: TeamType.MCA,
              )
            ],
          ),
        ],
      ),
    );
  }
}

class _TeamPage extends StatefulWidget {
  final TeamType type;
  final List<TeamModel> data;
  final int initialPage;

  _TeamPage({
    Key key,
    @required this.type,
    this.initialPage = 0,
  })  : data = TeamProvider().getTeamDetails(type),
        super(key: key);

  @override
  __TeamPageState createState() => __TeamPageState();
}

class __TeamPageState extends State<_TeamPage> {
  int _current;
  PageController _teamController;
  PageStorageBucket _pageStorageBucket;

  @override
  void initState() {
    _pageStorageBucket = PageStorageBucket();
    _current = PageStorage.of(context)?.readState(context) as int ??
        widget.initialPage;
    _teamController =
        PageController(initialPage: _current, viewportFraction: 0.8);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageStorage(
      key: widget.key,
      bucket: _pageStorageBucket,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 24),
            alignment: Alignment.centerLeft,
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          Text(
            widget.type == TeamType.BTECH ? 'B.Tech' : 'MCA',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w100,
            ),
          ),
          Expanded(
            child: PageView(
              controller: _teamController,
              onPageChanged: (i) {
                PageStorage.of(context).writeState(context, i);
              },
              children: widget.data.map((TeamModel m) => getItem(m)).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget getItem(TeamModel m) {
    String image = m.image ?? 'anonymous.jpg';
    return Align(
      alignment: Alignment.center,
      child: AspectRatio(
        aspectRatio: 9 / 16,
        child: Container(
          margin: EdgeInsets.all(16),
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Color.fromRGBO(68, 75, 93, 0.8),
          ),
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Expanded(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: AspectRatio(
                    aspectRatio: 9 / 16,
                    child: Material(
                      elevation: 8,
                      child: Image.asset(
                        'images/$image',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                m.name,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                m.post,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Icon getIcon() {
  //   if (widget.type == TeamType.BTECH)
  //     return Icon(Icons.keyboard_arrow_up);
  //   else
  //     return Icon(Icons.keyboard_arrow_down);
  // }
}
