import 'package:rxdart/rxdart.dart';

class ListBloc {
  // static ListBloc _listBloc;

  // factory ListBloc() {
  //   if (_listBloc == null) _listBloc = ListBloc();
  //   return _listBloc;
  // }

  // PublishSubject<int> _listSubject;

  // ListBloc._() {
  //   _listSubject = PublishSubject<int>();
  // }

  PublishSubject<int> _listSubject;

  ListBloc(){
    _listSubject = PublishSubject<int>();
  }
  Stream<int> get listStream => _listSubject.stream;

  void startAnimation(int limit, Duration duration) async {
    for (var i = 0; i < limit; i++) {
      await Future.delayed(duration, () {
        _updatePosition(i);
      });
    }
  }

  void _updatePosition(int i) {
    _listSubject.add(i);
  }

  void dispose(){
    _listSubject.close();
  }
}
