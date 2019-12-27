import 'package:flutter/material.dart';
import 'package:technovation2020/src/bloc/notification_bloc.dart';
import 'package:technovation2020/src/custom_widget/fade_in.dart';
import 'package:technovation2020/src/custom_widget/notched_sliverappbar.dart';
import 'package:technovation2020/src/model/notification_model.dart';
import 'package:technovation2020/src/resource/notification_provider.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  NotificationBloc _notificationBloc;

  @override
  void initState() {
    _notificationBloc = NotificationBloc();
    _notificationBloc.no();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            delegate: NotchedSliverAppBar(
              title: Text(
                'Notifications',
                style: Theme.of(context).textTheme.title,
              ),
              expandedHeight: 150,
            ),
            pinned: true,
          ),
          FutureBuilder(
            future: NotificationProvider().getNotifications(),
            builder: (context, AsyncSnapshot<List<NotificationModel>> snapshot) {
              if (snapshot.hasData) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return FadeIn(
                        child: Container(
                          padding: EdgeInsets.all(16),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Container(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  snapshot.data[index].body,
                                  style: Theme.of(context).textTheme.title,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                alignment: Alignment.bottomRight,
                                child: Text(
                                  snapshot.data[index].time,
                                  style: Theme.of(context).textTheme.subtitle.copyWith(color: Colors.white38),
                                ),
                              ),
                              Divider(color: Colors.white24,),
                            ],
                          ),
                        ),
                      );
                    },
                    childCount: snapshot.data.length,
                  ),
                );
              }else
              return SliverFillRemaining(
                child: Container(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
