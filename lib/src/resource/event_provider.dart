import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:technovation2020/src/model/event_model.dart';
//import 'package:firebase_database/firebase_database.dart';
//import 'package:technovation2020/src/resource/firebase_helper.dart';

enum EventProviderType { CATEGORY, DAY }

EventProvider eventProvider;

class EventProvider {
  List<dynamic> eventDynamic;
  List<List<EventModel>> eventDetails;

  static Future<EventProvider> create() async {
    if (eventProvider == null) {
      eventProvider = EventProvider();
      eventProvider.eventDetails = [
        [
          EventModel.fromJson({
            "id": 0,
            "image": "000.jpg",
            "name": "Internet Mystery",
            "description":
                "This is going to be the description of the event. It will be filled up later for you to know what this event is about.",
            "rules": ["How to play rule 1", "How to play rule 2"],
            "coordinators": ["Monkey D. Luffy", "Roronoa Zoro"],
            "coordinatorsNumber": ["9747897864", "6392785637"],
            "judgement": ["This is how you will get points"],
          }),
          EventModel.fromJson({
            "id": 1,
            "image": "001.jpg",
            "name": "Suspense Coding",
            "description":
                "This is going to be the description of the event. It will be filled up later for you to know what this event is about.",
            "rules": ["How to play rule 1", "How to play rule 2"],
            "coordinators": ["Monkey D. Luffy", "Roronoa Zoro"],
            "coordinatorsNumber": ["9747897864", "6392785637"],
            "judgement": [
              "This is how you will get points",
              "This is how you will loose points"
            ]
          }),
          EventModel.fromJson({
            "id": 2,
            "image": "002.jpg",
            "name": "Tech Fresh",
            "description":
                "This is going to be the description of the event. It will be filled up later for you to know what this event is about.",
            "rules": ["How to play rule 1", "How to play rule 2"],
            "coordinators": ["Monkey D. Luffy", "Roronoa Zoro"],
            "coordinatorsNumber": ["9747897864", "6392785637"],
            "judgement": ["This is how you will get points"]
          }),
          EventModel.fromJson({
            "id": 3,
            "image": "003.jpg",
            "name": "Debugger",
            "description":
                "This is going to be the description of the event. It will be filled up later for you to know what this event is about.",
            "rules": ["How to play rule 1", "How to play rule 2"],
            "coordinators": ["Monkey D. Luffy", "Roronoa Zoro"],
            "coordinatorsNumber": ["9747897864", "6392785637"],
            "judgement": ["This is how you will get points"]
          }),
          EventModel.fromJson({
            "id": 4,
            "image": "004.jpg",
            "name": "Blind Coding",
            "description":
                "This is going to be the description of the event. It will be filled up later for you to know what this event is about.",
            "rules": ["How to play rule 1", "How to play rule 2"],
            "coordinators": ["Monkey D. Luffy", "Roronoa Zoro"],
            "coordinatorsNumber": ["9747897864", "6392785637"],
            "judgement": ["This is how you will get points"]
          }),
          EventModel.fromJson({
            "id": 5,
            "image": "005.jpg",
            "name": "Paper Presentation",
            "description":
                "This is going to be the description of the event. It will be filled up later for you to know what this event is about.",
            "rules": ["How to play rule 1", "How to play rule 2"],
            "coordinators": ["Monkey D. Luffy", "Roronoa Zoro"],
            "coordinatorsNumber": ["9747897864", "6392785637"],
            "judgement": ["This is how you will get points"]
          }),
          EventModel.fromJson({
            "id": 6,
            "image": "006.jpg",
            "name": "Mock Interview",
            "description":
                "This is going to be the description of the event. It will be filled up later for you to know what this event is about.",
            "rules": ["How to play rule 1", "How to play rule 2"],
            "coordinators": ["Monkey D. Luffy", "Roronoa Zoro"],
            "coordinatorsNumber": ["9747897864", "6392785637"],
            "judgement": ["This is how you will get points"]
          }),
          EventModel.fromJson({
            "id": 7,
            "image": "007.jpg",
            "name": "Techno Cupid",
            "description":
                "This is going to be the description of the event. It will be filled up later for you to know what this event is about.",
            "rules": ["How to play rule 1", "How to play rule 2"],
            "coordinators": ["Monkey D. Luffy", "Roronoa Zoro"],
            "coordinatorsNumber": ["9747897864", "6392785637"],
            "judgement": ["This is how you will get points"]
          }),
          EventModel.fromJson({
            "id": 8,
            "image": "008.jpg",
            "name": "Chanakya Neeti",
            "description":
                "This is going to be the description of the event. It will be filled up later for you to know what this event is about.",
            "rules": ["How to play rule 1", "How to play rule 2"],
            "coordinators": ["Monkey D. Luffy", "Roronoa Zoro"],
            "coordinatorsNumber": ["9747897864", "6392785637"],
            "judgement": ["This is how you will get points"]
          }),
        ],
        [
          EventModel.fromJson({
            "id": 100,
            "image": "100.jpg",
            "name": "Encantador",
            "description":
                "This is going to be the description of the event. It will be filled up later for you to know what this event is about.",
            "rules": ["How to play rule 1", "How to play rule 2"],
            "coordinators": ["Monkey D. Luffy", "Roronoa Zoro"],
            "coordinatorsNumber": ["9747897864", "6392785637"],
            "judgement": ["This is how you will get points"]
          }),
          EventModel.fromJson({
            "id": 101,
            "image": "101.jpg",
            "name": "Star Night",
            "description":
                "This is going to be the description of the event. It will be filled up later for you to know what this event is about.",
            "rules": [],
            "coordinators": [
              "Monkey D. Luffy",
              "Roronoa Zoro",
              "Sanji Vinsmoke"
            ],
            "coordinatorsNumber": ["9747897864", "6392785637", "8976545678"],
            "judgement": []
          }),
          EventModel.fromJson({
            "id": 102,
            "image": "102.jpg",
            "name": "Spectacolo-di-Talenti",
            "description":
                "This is going to be the description of the event. It will be filled up later for you to know what this event is about.",
            "rules": ["How to play rule 1", "How to play rule 2"],
            "coordinators": ["Monkey D. Luffy", "Roronoa Zoro"],
            "coordinatorsNumber": ["9747897864", "6392785637"],
            "judgement": ["This is how you will get points"]
          }),
          EventModel.fromJson({
            "id": 103,
            "image": "103.jpg",
            "name": "Mr. & Mrs. Technovation",
            "description":
                "This is going to be the description of the event. It will be filled up later for you to know what this event is about.",
            "rules": ["How to play rule 1", "How to play rule 2"],
            "coordinators": ["Monkey D. Luffy", "Roronoa Zoro"],
            "coordinatorsNumber": ["9747897864", "6392785637"],
            "judgement": ["This is how you will get points"]
          }),
          EventModel.fromJson({
            "id": 104,
            "image": "104.jpg",
            "name": "EDM Night",
            "description":
                "This is going to be the description of the event. It will be filled up later for you to know what this event is about.",
            "rules": ["How to play rule 1", "How to play rule 2"],
            "coordinators": ["Monkey D. Luffy", "Roronoa Zoro"],
            "coordinatorsNumber": ["9747897864", "6392785637"],
            "judgement": ["This is how you will get points"]
          }),
          EventModel.fromJson({
            "id": 105,
            "image": "105.jpg",
            "name": "Nukkad Nattak",
            "description":
                "This is going to be the description of the event. It will be filled up later for you to know what this event is about.",
            "rules": ["How to play rule 1", "How to play rule 2"],
            "coordinators": ["Monkey D. Luffy", "Roronoa Zoro"],
            "coordinatorsNumber": ["9747897864", "6392785637"],
            "judgement": ["This is how you will get points"]
          }),
          EventModel.fromJson({
            "id": 106,
            "image": "106.jpg",
            "name": "Clash of Titans",
            "description":
                "This is going to be the description of the event. It will be filled up later for you to know what this event is about.",
            "rules": ["How to play rule 1", "How to play rule 2"],
            "coordinators": ["Monkey D. Luffy", "Roronoa Zoro"],
            "coordinatorsNumber": ["9747897864", "6392785637"],
            "judgement": ["This is how you will get points"]
          }),
          EventModel.fromJson({
            "id": 107,
            "image": "107.jpg",
            "name": "Fire and Ice",
            "description":
                "This is going to be the description of the event. It will be filled up later for you to know what this event is about.",
            "rules": ["How to play rule 1", "How to play rule 2"],
            "coordinators": ["Monkey D. Luffy", "Roronoa Zoro"],
            "coordinatorsNumber": ["9747897864", "6392785637"],
            "judgement": ["This is how you will get points"]
          }),
          EventModel.fromJson({
            "id": 108,
            "image": "108.jpg",
            "name": "Flashmob",
            "description":
                "This is going to be the description of the event. It will be filled up later for you to know what this event is about.",
            "rules": ["How to play rule 1", "How to play rule 2"],
            "coordinators": ["Monkey D. Luffy", "Roronoa Zoro"],
            "coordinatorsNumber": ["9747897864", "6392785637"],
            "judgement": ["This is how you will get points"]
          }),
        ],
        [
          EventModel.fromJson({
            "id": 200,
            "image": "200.jpg",
            "name": "Market-O-Mania",
            "description":
                "This is going to be the description of the event. It will be filled up later for you to know what this event is about.",
            "rules": [
              "How to play rule 1",
              "How to play rule 2",
              "How to play rule 3"
            ],
            "coordinators": ["Monkey D. Luffy"],
            "coordinatorsNumber": ["9747897864"],
            "judgement": ["This is how you will get points"]
          }),
          EventModel.fromJson({
            "id": 201,
            "image": "201.jpg",
            "name": "Ping-Tac-Toe",
            "description":
                "This is going to be the description of the event. It will be filled up later for you to know what this event is about.",
            "rules": ["How to play rule 1", "How to play rule 2"],
            "coordinators": ["Monkey D. Luffy", "Roronoa Zoro"],
            "coordinatorsNumber": ["9747897864", "6392785637"],
            "judgement": ["This is how you will get points"]
          }),
          EventModel.fromJson({
            "id": 202,
            "image": "202.jpg",
            "name": "Minute-to-Win-it",
            "description":
                "This is going to be the description of the event. It will be filled up later for you to know what this event is about.",
            "rules": [
              "How to play rule 1",
              "How to play rule 2",
              "How to play rule 3"
            ],
            "coordinators": ["Monkey D. Luffy"],
            "coordinatorsNumber": ["9747897864"],
            "judgement": ["This is how you will get points"]
          }),
          EventModel.fromJson({
            "id": 203,
            "image": "203.jpg",
            "name": "Blind Date",
            "description":
                "This is going to be the description of the event. It will be filled up later for you to know what this event is about.",
            "rules": [
              "How to play rule 1",
              "How to play rule 2",
              "How to play rule 3"
            ],
            "coordinators": ["Monkey D. Luffy"],
            "coordinatorsNumber": ["9747897864"],
            "judgement": ["This is how you will get points"]
          }),
          EventModel.fromJson({
            "id": 204,
            "image": "204.jpg",
            "name": "Treasure Hunt",
            "description":
                "This is going to be the description of the event. It will be filled up later for you to know what this event is about.",
            "rules": [
              "How to play rule 1",
              "How to play rule 2",
              "How to play rule 3"
            ],
            "coordinators": ["Monkey D. Luffy"],
            "coordinatorsNumber": ["9747897864"],
            "judgement": ["This is how you will get points"]
          }),
          EventModel.fromJson({
            "id": 205,
            "image": "205.jpg",
            "name": "Secret Event",
            "description":
                "This is going to be the description of the event. It will be filled up later for you to know what this event is about.",
            "rules": [
              "How to play rule 1",
              "How to play rule 2",
              "How to play rule 3"
            ],
            "coordinators": ["Monkey D. Luffy"],
            "coordinatorsNumber": ["9747897864"],
            "judgement": ["This is how you will get points"]
          }),
          EventModel.fromJson({
            "id": 206,
            "image": "206.jpg",
            "name": "E-Gaming",
            "description":
                "This is going to be the description of the event. It will be filled up later for you to know what this event is about.",
            "rules": [
              "How to play rule 1",
              "How to play rule 2",
              "How to play rule 3"
            ],
            "coordinators": ["Monkey D. Luffy"],
            "coordinatorsNumber": ["9747897864"],
            "judgement": ["This is how you will get points"]
          }),
          EventModel.fromJson({
            "id": 207,
            "image": "207.jpg",
            "name": "Scavenger Hunt",
            "description":
                "This is going to be the description of the event. It will be filled up later for you to know what this event is about.",
            "rules": [
              "How to play rule 1",
              "How to play rule 2",
              "How to play rule 3"
            ],
            "coordinators": ["Monkey D. Luffy"],
            "coordinatorsNumber": ["9747897864"],
            "judgement": ["This is how you will get points"]
          }),
          EventModel.fromJson({
            "id": 208,
            "image": "208.jpg",
            "name": "Gully Cricket",
            "description":
                "This is going to be the description of the event. It will be filled up later for you to know what this event is about.",
            "rules": [
              "How to play rule 1",
              "How to play rule 2",
              "How to play rule 3"
            ],
            "coordinators": ["Monkey D. Luffy"],
            "coordinatorsNumber": ["9747897864"],
            "judgement": ["This is how you will get points"]
          }),
          EventModel.fromJson({
            "id": 209,
            "image": "209.jpg",
            "name": "E-roadies",
            "description":
                "This is going to be the description of the event. It will be filled up later for you to know what this event is about.",
            "rules": [
              "How to play rule 1",
              "How to play rule 2",
              "How to play rule 3"
            ],
            "coordinators": ["Monkey D. Luffy"],
            "coordinatorsNumber": ["9747897864"],
            "judgement": ["This is how you will get points"]
          }),
        ],
      ];

      try {
        http.Response res = await http
            .get('https://omega.pythonanywhere.com/android_api/get_events/');
        eventProvider.eventDynamic = json.decode(res.body)['events'];

        // DataSnapshot ds = await FirebaseHelper.getEvents();
        // ds.value.forEach((key, event) {
        //   eventProvider.events
        //       .add(EventModel.fromJson(Map<String, dynamic>.from(event)));
        // });
      } catch (e) {
        print(e);
        throw Exception('$e');
      }
    }
    return eventProvider;
  }

  List<List<EventModel>> getEventsByType(EventProviderType type) {
    List<List<EventModel>> res = [[], [], []];
    if (type == EventProviderType.CATEGORY) {
      eventDynamic.forEach((event) {
        int id = event['event_id'];
        int i = id ~/ 100;
        int j = id % 100;
        EventModel e = eventDetails[i][j];
        e.location = event['location'];
        e.time = int.parse(event['time']);
        res[i].add(e);
      });
      // eventDynamic.forEach((event) {
      //   res[event['id'] ~/ 100].add(event);
      // });
      // res.forEach((List<EventModel> l) {
      //   l.sort((a, b) => a.day.compareTo(b.day));
      // });
    } else if (type == EventProviderType.DAY) {
      eventDynamic.forEach((event) {
        int id = event['event_id'];
        int i = id ~/ 100;
        int j = id % 100;
        int time = int.parse(event['time']);
        int p = -1;
        if (time >= 1578853800000 && time <= 1578940199000)
          p = 0;
        else if (time >= 1578940200000 && time <= 1579026599000)
          p = 1;
        else if (time >= 1579026600000 && time <= 1579112999000) p = 2;
        if (p != -1) {
          EventModel e = eventDetails[i][j];
          e.location = event['location'];
          e.time = time;
          res[p].add(e);
        }
      });
      // events.forEach((event) {
      //   if (event.day != 0) res[event.day - 1].add(event);
      // });
      // res.forEach((List<EventModel> l) {
      //   l.sort((a, b) => b.time.compareTo(a.time));
      // });
    }
    return res;
  }

  void close() {
    eventProvider = null;
  }
}
