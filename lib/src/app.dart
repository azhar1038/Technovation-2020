import 'package:flutter/material.dart';
import 'package:technovation2020/src/bloc/notification_bloc.dart';
import 'package:technovation2020/src/custom_widget/top_bar.dart';

class Technovation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Technovation',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: Scaffold(
        appBar: TopBar(
          title: 'Technovation',
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text('New Notification'),
                onPressed: notificationBloc.yes,
              ),
              SizedBox(width: 20,),
              RaisedButton(
                child: Text('No Notification'),
                onPressed: notificationBloc.no,
              ),
            ],
          ),
        ),
      ),
    );
  }
}