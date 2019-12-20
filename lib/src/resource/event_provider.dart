
import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:technovation2020/src/model/event_model.dart';
List<Map<String, dynamic>> timing = [
    {
      "id": 0,
      "day": 1,
      "time": "10:00 AM"
    },
    {
      "id": 1,
      "day": 2,
      "time": "12:30 PM"
    },
    {
      "id": 100,
      "day": 1,
      "time": ""
    },
    {
      "id": 101,
      "day": 0,
      "time": "12:31 PM"
    },
    {
      "id": 200,
      "day": 1,
      "time": "10:02 AM"
    },
    {
      "id": 201,
      "day": 2,
      "time": "12:32 PM"
    }
  ];

class EventProvider{
  Future<List<Map<String, dynamic>>> getTime(){
    return Future.delayed(Duration(seconds: 3)).then((_){
      return timing;
    });
  }

  Future<Map<String, dynamic>> getJson(){
    return rootBundle.loadString('json/events.json').then((String jsonData){
      return json.decode(jsonData);
    });
  }

  Future<List<List<EventModel>>> getEvents() async {
    Map<String, dynamic> eventsDetails = await getJson();
    print(eventsDetails.length.toString());
    List<Map<String, dynamic>> timing = await getTime();
    List<List<EventModel>> events = [[], [], []];
    timing.forEach((map){
      int type = map['id']~/100;
      int index = map['id']%100;
      String sType;
      if(type == 0) sType = 'technical';
      else if(type == 1) sType = 'cultural';
      else sType = 'fun';
      events[type].add(EventModel.fromJson(eventsDetails[sType][index], map));
    });
    return events;
  }
}