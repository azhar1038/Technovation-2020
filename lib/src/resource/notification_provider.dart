import 'package:firebase_database/firebase_database.dart';
import 'package:technovation2020/src/model/notification_model.dart';
import 'dart:collection' show SplayTreeMap;

class NotificationProvider {
  Future<List<NotificationModel>> getNotifications() {
    DatabaseReference reference = FirebaseDatabase.instance.reference();
    return reference.child('notification').orderByKey().once().then(
      (DataSnapshot snapshot) {
        SplayTreeMap<String, dynamic> st = SplayTreeMap<String, dynamic>();
        st.addAll(Map<String, dynamic>.from(snapshot.value));
        List<NotificationModel> res = [];
        st.forEach(
          (index, notification) {
            res.add(
              NotificationModel.fromJson(
                  Map<String, dynamic>.from(notification)),
            );
          },
        );
        return res.reversed.toList();
      },
    );
  }
}
