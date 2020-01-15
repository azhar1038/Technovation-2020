import 'package:flutter/material.dart';
import 'package:technovation2020/src/model/event_model.dart';
import 'package:technovation2020/src/resource/intent.dart';

class EventDetail extends StatefulWidget {
  final EventModel event;
  final String tag;

  EventDetail({@required this.event, @required this.tag});

  @override
  _EventDetailState createState() => _EventDetailState();
}

class _EventDetailState extends State<EventDetail> {
  @override
  Widget build(BuildContext context) {
    String time;
    if (widget.event.day == 0 || widget.event.time.isEmpty)
      time = "Will be Updated";
    else
      time = "Day ${widget.event.day} | ${widget.event.time}";
    TextStyle header = Theme.of(context).textTheme.headline;
    TextStyle body = Theme.of(context).textTheme.subhead;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Icon(
          Icons.call,
          size: 18,
        ),
        onPressed: () => onCallPressed(),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            leading: IconButton(
              color: Colors.white,
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () => Navigator.of(context).pop(),
            ),
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                widget.event.name,
                style: Theme.of(context).textTheme.title,
              ),
              background: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Hero(
                    tag: widget.tag,
                    child: Image.asset(
                      'images/${widget.event.image}',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xaa000000),
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
              [
                Container(
                  height: MediaQuery.of(context).size.height,
                  padding: EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(
                            Icons.access_time,
                            size: 16,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            time,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8,),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(
                            Icons.location_on,
                            size: 16,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            widget.event.location.isEmpty
                                ? 'Will be updated'
                                : widget.event.location,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16,),
                      Text(
                        'Description: ',
                        style: header,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        widget.event.description,
                        style: body,
                      ),

                      //----------------Rules-------------------
                      widget.event.rules.length > 0
                          ? Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  height: 32,
                                ),
                                Text(
                                  'Rules: ',
                                  style: header,
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: List.generate(
                                    widget.event.rules.length,
                                    (int index) {
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 8.0),
                                        child: Text(
                                          '${index + 1}) ${widget.event.rules[index]}',
                                          style: body,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            )
                          : Container(),
                      //--------------------Judgement-----------------
                      widget.event.judgement.length > 0
                          ? Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  height: 24,
                                ),
                                Text(
                                  'Judgement: ',
                                  style: header,
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: List.generate(
                                    widget.event.judgement.length,
                                    (int index) {
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 8.0),
                                        child: Text(
                                          '${index + 1}) ${widget.event.judgement[index]}',
                                          style: body,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            )
                          : Container(),

                      SizedBox(
                        height: 24,
                      ),
                      Text(
                        'Coordinators: ',
                        style: header,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(
                          widget.event.coordinators.length,
                          (int index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                '${index + 1}) ${widget.event.coordinators[index]}',
                                style: body,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onCallPressed() {
    showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text('Call Coordinators'),
            contentPadding: EdgeInsets.all(16),
            children:
                List.generate(widget.event.coordinators.length, (int index) {
              return FlatButton(
                onPressed: () => call(widget.event.coordinatorsNumber[index]),
                child: Container(
                  width: double.infinity,
                  child: Text(
                    widget.event.coordinators[index],
                    style: Theme.of(context).textTheme.subhead,
                  ),
                ),
              );
            }),
          );
        });
  }

  void call(String num) {
    print('Calling $num ...');
    try {
      IntentHelper.call(num);
    } catch (e) {
      createSnackBar('Failed to make call');
    }
  }

  void createSnackBar(String message) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }
}
