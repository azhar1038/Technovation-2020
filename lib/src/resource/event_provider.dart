import 'dart:async';
import 'package:technovation2020/src/model/event_model.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:technovation2020/src/resource/firebase_helper.dart';

enum EventProviderType { CATEGORY, DAY }

class EventProvider {
  List<EventModel> events;
  static EventProvider _eventProvider;

  static Future<EventProvider> create() async {
    if (_eventProvider == null) {
      _eventProvider = EventProvider();
      _eventProvider.events = [];
      try {
        DataSnapshot ds = await FirebaseHelper.getEvents();
        ds.value.forEach((key, event) {
          _eventProvider.events
              .add(EventModel.fromJson(Map<String, dynamic>.from(event)));
        });
      } catch (e) {
        throw FirebaseHelperException('$e');
      }
    }
    return _eventProvider;
  }

  List<List<EventModel>> getEventsByType(EventProviderType type) {
    List<List<EventModel>> res = [[], [], []];
    if (type == EventProviderType.CATEGORY) {
      events.forEach((event) {
        res[event.id ~/ 100].add(event);
      });
    } else if (type == EventProviderType.DAY) {
      events.forEach((event) {
        if (event.day != 0) res[event.day - 1].add(event);
      });
    }
    return res;
  }

  void close() {
    _eventProvider = null;
  }
}
