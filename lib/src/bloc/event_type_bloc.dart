import 'package:rxdart/rxdart.dart';

class EventTypeBloc{
  bool isDay = false;
  BehaviorSubject<bool> _isDayDetector;

  static EventTypeBloc _eventTypeBloc;

  factory EventTypeBloc(){
    if(_eventTypeBloc == null)
      _eventTypeBloc = EventTypeBloc._();
    return _eventTypeBloc;
  }

  EventTypeBloc._(){
    _isDayDetector = BehaviorSubject<bool>();
  }

  Stream<bool> get isDayStream => _isDayDetector.stream;

  void yes(){
    isDay = true;
    _isDayDetector.add(isDay);
  }

  void no(){
    isDay = false;
    _isDayDetector.add(isDay);
  }

  void dispose(){
    _isDayDetector.close();
  }
}