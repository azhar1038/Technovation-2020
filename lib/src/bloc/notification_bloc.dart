import 'package:rxdart/rxdart.dart';

class NotificationBloc{
  bool notification = false;
  BehaviorSubject<bool> _notificationDetector;

  static NotificationBloc _notificationBloc;

  factory NotificationBloc(){
    if(_notificationBloc == null)
      _notificationBloc = NotificationBloc._();
    return _notificationBloc;
  }

  NotificationBloc._(){
    _notificationDetector = BehaviorSubject<bool>();
  }

  Stream<bool> get notificationStream => _notificationDetector.stream;

  void yes(){
    notification = true;
    _notificationDetector.add(notification);
  }

  void no(){
    notification = false;
    _notificationDetector.add(notification);
  }

  void dispose(){
    _notificationDetector.close();
  }
}