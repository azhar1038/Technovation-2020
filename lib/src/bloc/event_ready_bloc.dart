import 'package:rxdart/rxdart.dart';

class EventReadyBloc{
  bool eventReady = false;
  BehaviorSubject<bool> _eventReadyDetector;

  static EventReadyBloc _eventReadyBloc;

  factory EventReadyBloc(){
    if(_eventReadyBloc == null)
      _eventReadyBloc = EventReadyBloc._();
    return _eventReadyBloc;
  }

  EventReadyBloc._(){
    _eventReadyDetector = BehaviorSubject<bool>();
  }

  Stream<bool> get eventReadyStream => _eventReadyDetector.stream;

  void yes(){
    eventReady = true;
    _eventReadyDetector.add(eventReady);
  }

  void no(){
    eventReady = false;
    _eventReadyDetector.add(eventReady);
  }

  void error(Exception e){
    _eventReadyDetector.addError(e);
  }

  void dispose(){
    _eventReadyDetector.close();
  }
}