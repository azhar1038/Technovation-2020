import 'package:intl/intl.dart' show DateFormat;

class NotificationModel {
  String _title;
  String _body;
  String _time;

  NotificationModel.fromJson(Map<String, dynamic> notification) {
    _title = notification['title'];
    _body = notification['body'];
    _time = DateFormat("MMM d, hh:mm a")
        .format(DateTime.fromMillisecondsSinceEpoch(notification['time']))
        .toString();
  }

  NotificationModel.fromData(int time, String body){
    _body = body;
    _time = DateFormat("MMM d, hh:mm a")
        .format(DateTime.fromMillisecondsSinceEpoch(time))
        .toString();
  }

  String get title => _title;
  String get body => _body;
  String get time => _time;
}
