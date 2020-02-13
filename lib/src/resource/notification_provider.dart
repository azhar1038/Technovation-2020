import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:technovation2020/src/model/notification_model.dart';
import 'dart:collection' show SplayTreeMap;
import 'package:technovation2020/src/resource/firebase_helper.dart';

class NotificationProvider {
  Future<List<NotificationModel>> getNotifications() async {
    try {
      QuerySnapshot snapshot = await FirebaseHelper.getNotifications();
      SplayTreeMap<String, dynamic> st = SplayTreeMap<String, dynamic>();
      st.addAll(Map<String, dynamic>.from(snapshot.documents[0].data));
      List<NotificationModel> res = [];
      st.forEach(
        (index, notification) {
          res.add(
            NotificationModel.fromData(int.parse(index), notification),
          );
        },
      );
      return res.reversed.toList();
    } catch (e) {
      print(e);
      throw FirebaseHelperException(e.cause);
    }
  }
}
