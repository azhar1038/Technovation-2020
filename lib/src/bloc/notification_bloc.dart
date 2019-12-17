import 'package:rxdart/rxdart.dart';

class _NotificationBloc{
  bool notification = false;
  BehaviorSubject<bool> _notificationDetector;

  _NotificationBloc(){
    _notificationDetector = BehaviorSubject<bool>.seeded(false);
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

final _NotificationBloc notificationBloc = _NotificationBloc();