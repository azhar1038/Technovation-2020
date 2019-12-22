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
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            delegate: OverlappingSliverAppBar(
                expandedHeight: 150, tabController: _tabController),
            pinned: true,
          ),
          SliverFillRemaining(
            child: FutureBuilder(
              future: EventProvider().getEvents(),
              builder:
                  (context, AsyncSnapshot<List<List<EventModel>>> snapshot) {
                if (snapshot.hasData) {
                  return TabBarView(
                    controller: _tabController,
                    children: <Widget>[
                      SlideInList(
                        children: getCategoryEventList(snapshot.data[0]),
                        duration: Duration(milliseconds: 600),
                        delay: Duration(milliseconds: 300),
                      ),
                      SlideInList(
                        children: getCategoryEventList(snapshot.data[1]),
                        duration: Duration(milliseconds: 600),
                        delay: Duration(milliseconds: 300),
                      ),
                      SlideInList(
                        children: getCategoryEventList(snapshot.data[2]),
                        duration: Duration(milliseconds: 600),
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
          ),
        ],
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
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
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
                        em.location.isEmpty ? 'Will be updated' : em.location,
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

class OverlappingSliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final TabController tabController;

  OverlappingSliverAppBar({this.expandedHeight, this.tabController});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    double top = expandedHeight - shrinkOffset - 50;
    return Stack(
      fit: StackFit.loose,
      overflow: Overflow.visible,
      children: <Widget>[
        Container(
          color: Color(0xff122c3d),
          height: expandedHeight - 25,
        ),
        Container(
          alignment: Alignment.centerLeft,
          child: Opacity(
            opacity: 1 - (shrinkOffset / expandedHeight),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Technovation',
                style: Theme.of(context).textTheme.title,
              ),
            ),
          ),
        ),
        Positioned(
          top: top > 40 ? top : 40,
          left: (MediaQuery.of(context).size.width - 250) / 2,
          child: Card(
            elevation: 24,
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              height: 50,
              width: 250,
              decoration: ShapeDecoration(
                color: Color(0x24ffffff),
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: TabBar(
                indicatorPadding: EdgeInsets.all(4),
                labelPadding: EdgeInsets.zero,
                labelColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.label,
                controller: tabController,
                tabs: <Widget>[
                  Tab(text: 'Technical'),
                  Tab(text: 'Cultural'),
                  Tab(text: 'Fun'),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => 70;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
