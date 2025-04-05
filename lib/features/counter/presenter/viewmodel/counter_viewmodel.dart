import 'package:flutter_fundamentals_app/core/viewmodel/result.dart';
import 'package:flutter_fundamentals_app/features/counter/presenter/viewmodel/counter_state.dart';

final class CounterViewmodel extends CounterState {
  CounterViewmodel();

  int get number => (result as Success).value;

  void inc() {
    increment();
  }

  void dec() {
    decrement();
  }
}
