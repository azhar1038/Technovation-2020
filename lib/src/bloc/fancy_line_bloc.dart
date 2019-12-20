import 'package:rxdart/rxdart.dart';

class FancyLineBloc{
  int index = 0;
  PublishSubject<int> _indexSubject;

  static FancyLineBloc _fancyLineBloc;
  
  factory FancyLineBloc(){
    if(_fancyLineBloc == null) _fancyLineBloc = FancyLineBloc._();
    return _fancyLineBloc;
  }

  FancyLineBloc._(){
    _indexSubject = PublishSubject<int>();
  }

  Stream<int> get indexStream => _indexSubject.stream;

  void change(int i){
    index = i;
    _indexSubject.add(index);
  }

  void dispose(){
    _indexSubject.close();
  }
}