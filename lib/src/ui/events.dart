import 'package:flutter/material.dart';
import 'package:technovation2020/src/custom_widget/slide_in_list.dart';
import 'package:technovation2020/src/custom_widget/top_bar.dart';
import 'package:technovation2020/src/model/event_model.dart';
import 'package:technovation2020/src/resource/event_provider.dart';

class Events extends StatefulWidget {
  @override
  _EventsState createState() => _EventsState();
}

class _EventsState extends State<Events> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(
        title: 'Technovation',
        bottom: TabBar(
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          tabs: <Widget>[
            Tab(
              text: 'Technical',
            ),
            Tab(
              text: 'Cultural',
            ),
            Tab(
              text: 'Fun',
            ),
          ],
          controller: _tabController,
        ),
      ),
      body: FutureBuilder(
        future: EventProvider().getEvents(),
        builder: (context, AsyncSnapshot<List<List<EventModel>>> snapshot) {
          if (snapshot.hasData) {
            return TabBarView(
              controller: _tabController,
              children: <Widget>[
                SlideInList(
                  children: getCategoryEventList(0, snapshot.data),
                  duration: Duration(milliseconds: 800),
                  delay: Duration(milliseconds: 300),
                ),
                SlideInList(
                  children: getCategoryEventList(1, snapshot.data),
                  duration: Duration(milliseconds: 800),
                  delay: Duration(milliseconds: 300),
                ),
                SlideInList(
                  children: getCategoryEventList(2, snapshot.data),
                  duration: Duration(milliseconds: 800),
                  delay: Duration(milliseconds: 300),
                ),
              ],
            );
          } else
            return Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            );
        },
      ),
    );
  }

  List<Widget> getCategoryEventList(int index, List<List<EventModel>> events) {
    List<Widget> res = [];
    events[index].forEach((EventModel em) {
      String time;
      if (em.day == 0 || em.time.isEmpty)
        time = "Will be Updated";
      else
        time = "Day ${em.day} | ${em.time}";
      res.add(Container(
        margin: EdgeInsets.all(10),
        decoration: ShapeDecoration(
          shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
              ),
              side: BorderSide(
                color: Colors.white,
                width: 0.5,
              )),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.asset(
              'images/${em.image}',
              width: 100,
              height: 80,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 10,),
            Container(
              height: 80,
              padding: EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    em.name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.access_time,
                        size: 15,
                      ),
                      SizedBox(width: 10,),
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
                      SizedBox(width: 10,),
                      Text(
                        em.location,
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
      ));
    });
    return res;
  }
}
