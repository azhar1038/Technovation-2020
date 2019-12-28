import 'package:flutter/material.dart';
import 'package:technovation2020/src/bloc/event_type_bloc.dart';
import 'package:technovation2020/src/custom_widget/notched_sliverappbar.dart';
import 'package:technovation2020/src/custom_widget/slide_in.dart';
import 'package:technovation2020/src/model/event_model.dart';
import 'package:technovation2020/src/resource/event_provider.dart';
import 'package:technovation2020/src/resource/events_search_delegate.dart';
import 'package:technovation2020/src/ui/event_detail.dart';

class Events extends StatefulWidget {
  @override
  _EventsState createState() => _EventsState();
}

class _EventsState extends State<Events> {
  EventTypeBloc etb;
  EventProvider eventProvider;

  @override
  void initState() {
    etb = EventTypeBloc();
    EventProvider.create().then((EventProvider ep) {
      setState(() {
        eventProvider = ep;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    eventProvider.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: etb.isDayStream,
      initialData: false,
      builder: (context, snapshot) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            //mini: true,
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: Icon(
              snapshot.data ? Icons.category : Icons.schedule,
              size: 18,
            ),
            onPressed: () {
              if (snapshot.data)
                etb.no();
              else
                etb.yes();
            },
          ),
          body: DefaultTabController(
            length: 3,
            child: NestedScrollView(
              headerSliverBuilder: (context, innerScrolled) {
                return [
                  SliverOverlapAbsorber(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                        context),
                    child: SliverPersistentHeader(
                      delegate: NotchedSliverAppBar(
                          expandedHeight: 150,
                          title: Text(
                            'Events',
                            style: Theme.of(context).textTheme.title,
                          ),
                          tabBar: TabBar(
                            indicatorPadding: EdgeInsets.all(4),
                            labelPadding: EdgeInsets.zero,
                            labelColor: Colors.white,
                            indicatorSize: TabBarIndicatorSize.label,
                            tabs: snapshot.data
                                ? [
                                    Tab(text: 'Day 1'),
                                    Tab(text: 'Day 2'),
                                    Tab(text: 'Day 3'),
                                  ]
                                : [
                                    Tab(text: 'Technical'),
                                    Tab(text: 'Cultural'),
                                    Tab(text: 'Fun'),
                                  ],
                          ),
                          icon: Icons.search,
                          onAction: () async {
                            EventModel result = await showSearch(
                              context: context,
                              delegate: EventsSearchDelegate(
                                events: eventProvider.events,
                              ),
                            );
                            if (result != null)
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => EventDetail(
                                    event: result,
                                    tag: 'image',
                                  ),
                                ),
                              );
                          }),
                      pinned: true,
                    ),
                  ),
                ];
              },
              body: eventProvider != null
                  ? Builder(
                      builder: (context) {
                        List<List<EventModel>> eventsByType;
                        if (snapshot.data)
                          eventsByType = eventProvider
                              .getEventsByType(EventProviderType.DAY);
                        else
                          eventsByType = eventProvider
                              .getEventsByType(EventProviderType.CATEGORY);
                        return TabBarView(
                          children: <Widget>[
                            getPage('first', eventsByType[0]),
                            getPage('second', eventsByType[1]),
                            getPage('third', eventsByType[2]),
                          ],
                        );
                      },
                    )
                  : Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                      ),
                    ),
            ),
          ),
        );
      },
    );
  }

  Widget getPage(String name, List data) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Builder(
        builder: (context) {
          return CustomScrollView(
            key: PageStorageKey<String>(name),
            slivers: <Widget>[
              SliverOverlapInjector(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              ),
              SliverPadding(
                padding: EdgeInsets.all(8),
                sliver: SliverList(
                  delegate: SliverChildListDelegate(
                    getCategoryEventList(data),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  List<Widget> getCategoryEventList(List<EventModel> events) {
    List<Widget> res = [];
    events.forEach((EventModel em) {
      String time;
      if (em.day == 0 || em.time.isEmpty)
        time = "Will be Updated";
      else
        time = "Day ${em.day} | ${em.time}";
      res.add(
        SlideIn(
          duration: Duration(seconds: 1),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => EventDetail(
                    event: em,
                    tag: em.image,
                  ),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white30,
                ),
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [
                    Color(0xff50407c),
                    Color(0xff123c5a),
                  ],
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      border: Border(right: BorderSide(color: Colors.white30)),
                    ),
                    child: Hero(
                      tag: em.image,
                      child: Image.asset(
                        'images/${em.image}',
                        width: 100,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 80,
                    padding: EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          em.name,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Icon(
                              Icons.access_time,
                              size: 15,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              time,
                              style: TextStyle(
                                fontSize: 14,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Icon(
                              Icons.location_on,
                              size: 15,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              em.location.isEmpty
                                  ? 'Will be updated'
                                  : em.location,
                              style: TextStyle(
                                fontSize: 14,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
    return res;
  }
}
