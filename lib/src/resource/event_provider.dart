import 'dart:async';
import 'package:technovation2020/src/model/event_model.dart';
import 'package:firebase_database/firebase_database.dart';

enum EventProviderType { CATEGORY, DAY }

class EventProvider {
  Future<List<List<EventModel>>> getEvents(EventProviderType type) async {
    final DatabaseReference databaseReference =
        FirebaseDatabase.instance.reference();
    return databaseReference
        .child('events')
        .once()
        .then((DataSnapshot snapshot) {
      List<List<EventModel>> res = [[], [], []];
      if (type == EventProviderType.CATEGORY) {
        snapshot.value.forEach((event) {
          res[event['id'] ~/ 100]
              .add(EventModel.fromJson(Map<String, dynamic>.from(event)));
        });
      } else if (type == EventProviderType.DAY) {
        snapshot.value.forEach((event) {
          if (event['day'] != 0)
            res[event['day'] - 1]
                .add(EventModel.fromJson(Map<String, dynamic>.from(event)));
        });
      }
      return res;
    });
  }
}
