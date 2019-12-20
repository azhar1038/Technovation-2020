import 'package:rxdart/rxdart.dart';

class _BottomSelectBloc{
  int index = 0;
  BehaviorSubject<int> _indexSubject;
  
  _BottomSelectBloc(){
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

final _BottomSelectBloc bottomSelectBloc = _BottomSelectBloc();