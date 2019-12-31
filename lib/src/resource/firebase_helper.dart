import 'package:firebase_database/firebase_database.dart';

class FirebaseHelper{
  static Future<DataSnapshot> getEvents(){
    return FirebaseDatabase.instance.reference().child('events').once().then((DataSnapshot snapshot){
      return snapshot;
    }).timeout(Duration(seconds: 5), onTimeout: (){
      throw FirebaseHelperException('FirebaseHelperException: Server timeout.');
    }).catchError((error){
      throw FirebaseHelperException('FirebaseHelperException: $error');
    });
  }

  static Future<DataSnapshot> getNotifications(){
    return FirebaseDatabase.instance.reference().child('notification').once().then((DataSnapshot snapshot){
      return snapshot;
    }).timeout(Duration(seconds: 5), onTimeout: (){
      throw FirebaseHelperException('FirebaseHelperException: Server timeout.');
    }).catchError((error){
      throw FirebaseHelperException('FirebaseHelperException: $error');
    });
  }
}

class FirebaseHelperException implements Exception{
  String cause;
  FirebaseHelperException(this.cause);
}