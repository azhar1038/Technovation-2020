import 'package:firebase_database/firebase_database.dart';
import 'package:technovation2020/src/model/notification_model.dart';
import 'dart:collection' show SplayTreeMap;
import 'package:technovation2020/src/resource/firebase_helper.dart';

class NotificationProvider {
  Future<List<NotificationModel>> getNotifications() async {
    try {
      DataSnapshot snapshot = await FirebaseHelper.getNotifications();
      SplayTreeMap<String, dynamic> st = SplayTreeMap<String, dynamic>();
      st.addAll(Map<String, dynamic>.from(snapshot.value));
      List<NotificationModel> res = [];
      st.forEach(
        (index, notification) {
          res.add(
            NotificationModel.fromJson(Map<String, dynamic>.from(notification)),
          );
        },
      );
      return res.reversed.toList();
    } catch (e) {
      throw FirebaseHelperException(e.cause);
    }
  }
}
