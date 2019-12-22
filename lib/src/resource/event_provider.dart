import 'dart:async';
import 'package:technovation2020/src/model/event_model.dart';
import 'package:firebase_database/firebase_database.dart';
class EventProvider{
  Future<List<List<EventModel>>> getEvents() async {
    final DatabaseReference databaseReference = FirebaseDatabase.instance.reference();
    return databaseReference.child('events').once().then((DataSnapshot snapshot){
      List<List<EventModel>> res = [];
      snapshot.value.forEach((events){
        List<EventModel> inner = [];
        events.forEach((event){
          inner.add(EventModel.fromJson(Map<String, dynamic>.from(event)));
        });
        res.add(inner);
      });
      return res;
    });
  }
}