import 'package:flutter/foundation.dart';
import 'package:flutter_fundamentals_app/core/viewmodel/result.dart';

class CounterState with ChangeNotifier {
  Result<int> _result = Result.success(0);

  Result? get result => _result;

  int get _value => (_result as Success<int>).value;

  void increment() {
    _result = Result.success(_value + 1);
    notifyListeners();
  }

  void decrement() {
    if (_value == 0) {
      _result = Result.success(0);
      notifyListeners();
      return;
    }
    _result = Result.success(_value - 1);
    notifyListeners();
  }
}
