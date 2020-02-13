import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseHelper {
  static Future<QuerySnapshot> getNotifications() {
    return Firestore.instance
        .collection('notification').getDocuments()
        .then((QuerySnapshot snapshot) {
      return snapshot;
    }).timeout(Duration(seconds: 5), onTimeout: () {
      throw FirebaseHelperException('FirebaseHelperException: Server timeout.');
    }).catchError((error) {
      throw FirebaseHelperException('FirebaseHelperException: $error');
    });
  }
}

class FirebaseHelperException implements Exception {
  String cause;
  FirebaseHelperException(this.cause);
}
