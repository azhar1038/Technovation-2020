import 'package:rxdart/rxdart.dart';

class _FancyLineBloc{
  int index = 0;
  BehaviorSubject<int> _indexSubject;
  
  _FancyLineBloc(){
    _indexSubject = BehaviorSubject<int>.seeded(0);
  }

  Stream<int> get indexStream => _indexSubject.stream;

  void change(int i){
    index = i;
    _indexSubject.add(index);
  }

  void close(){
    _indexSubject.close();
  }
}

final _FancyLineBloc fancyLineBloc = _FancyLineBloc();