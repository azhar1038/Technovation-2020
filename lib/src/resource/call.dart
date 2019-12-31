import 'package:flutter/services.dart';

class Call {
  static const platform =
      const MethodChannel('com.az.tizon.technovation2020/call');
  static call(String number) {
    try {
      platform.invokeMethod('callIntent', {'number': number});
    } on PlatformException catch (e) {
      throw CallException('Failed to make call. $e');
    }
  }
}

class CallException implements Exception{
  String cause;
  CallException(this.cause);
}


