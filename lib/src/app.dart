import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:technovation2020/src/bloc/notification_bloc.dart';
import 'package:technovation2020/src/ui/first_time.dart';
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
        dialogTheme: DialogTheme(
          backgroundColor: Color(0xff122c3d),
        ),
        appBarTheme: AppBarTheme(
          brightness: Brightness.dark,
          color: Color(0xff122c3d),
          textTheme: TextTheme(),
        ),
        textTheme: TextTheme(
          title: TextStyle(
            fontFamily: 'IMFellGreatPrimerSC',
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: _NoGlowBehavior(),
          child: child,
        );
      },
      home: _SplashScreen(),
    );
  }
}

class _SplashScreen extends StatefulWidget {
  @override
  __SplashScreenState createState() => __SplashScreenState();
}

class __SplashScreenState extends State<_SplashScreen> {
  Timer t;

  Future checkFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = prefs.getBool('firstTime') ?? false;
    if (_seen) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => Tabs(),
        ),
      );
    } else {
      await prefs.setBool('firstTime', true);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => FirstTime(),
        ),
      );
    }
  }

  @override
  void initState() {
    t = Timer(Duration(milliseconds: 1000), () {
      checkFirstTime();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('android/app/src/main/res/drawable/logo.png'),
      ),
    );
  }
}

class _NoGlowBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
