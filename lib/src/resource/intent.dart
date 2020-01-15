import 'package:flutter/services.dart';

class IntentHelper {
  static const platform = const MethodChannel('com.az.tizon.technovation2020');
  static call(String number) {
    try {
      platform.invokeMethod('callIntent', {'number': number});
    } on PlatformException catch (e) {
      throw IntentException('Failed to make call. $e');
    }
  }

  static Future<void> web(String url) async {
    try {
      return await platform.invokeMethod('webIntent', {'url': url});
    } on PlatformException catch (e) {
      throw IntentException('Failed to open. $e');
    }
  }
}

class IntentException implements Exception {
  String cause;
  IntentException(this.cause);
}
