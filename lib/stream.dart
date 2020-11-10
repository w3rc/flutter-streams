import 'dart:async';

class NumberStream {
  final StreamController<List<int>> _streamController = StreamController<List<int>>.broadcast();

  List<int> _numbers = [-2, -1];

  Stream get out => _streamController.stream;
  Sink get inData => _streamController.sink;

  void addNums(int a) {
    _numbers.add(a);
    inData.add(_numbers);
  }

  void addNumList(List<int> a) {
    // _numbers.add(a);
    // inData.add(_numbers);
    a.forEach((element) {
      addNums(element);
    });
  }

  void closeStream() {
    _streamController.close();
  }
}
