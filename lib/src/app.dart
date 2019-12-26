import 'package:flutter/material.dart';
import 'package:technovation2020/src/bloc/notification_bloc.dart';
import 'package:technovation2020/src/ui/tabs.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class Technovation extends StatefulWidget {
  @override
  _TechnovationState createState() => _TechnovationState();
}

class _TechnovationState extends State<Technovation> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  NotificationBloc _notificationBloc;

  @override
  void initState() {
    _notificationBloc = NotificationBloc();
    _firebaseMessaging.subscribeToTopic('all');
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> notification) async =>
          _notificationBloc.yes(),
      onLaunch: (Map<String, dynamic> notification) async =>
          _notificationBloc.yes(),
      onResume: (Map<String, dynamic> notification) async =>
          _notificationBloc.yes(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Technovation',
      theme: ThemeData(
        accentColor: Colors.white,
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        primaryColor: Colors.blue[200],
        bottomAppBarColor: Color(0xff122c3d),
        scaffoldBackgroundColor: Color(0xff09131d),
        cardColor: Color(0xff122c3d),
        appBarTheme: AppBarTheme(
          brightness: Brightness.dark,
          color: Color(0xff122c3d),
          textTheme: TextTheme(),
        ),
      ),
      home: Tabs(),
    );
  }
}
