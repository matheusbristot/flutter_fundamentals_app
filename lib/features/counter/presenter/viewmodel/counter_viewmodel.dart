import 'package:flutter/widgets.dart';
import 'package:flutter_fundamentals_app/core/viewmodel/command.dart';
import 'package:flutter_fundamentals_app/core/viewmodel/result.dart';
import 'package:flutter_fundamentals_app/features/counter/presenter/viewmodel/counter_action.dart';

final class CounterViewmodel extends InheritedWidget {
  CounterViewmodel({
    super.key,
    required super.child,
  });

  static CounterViewmodel of(BuildContext context) {
    final viewmodel =
        context.dependOnInheritedWidgetOfExactType<CounterViewmodel>();
    if (viewmodel == null) {
      throw FlutterError(
        'CounterViewmodel not found in context.\n'
        'Make sure CounterViewmodel is an ancestor of the calling widget.',
      );
    }
    return viewmodel;
  }

  late final counterData = Command1Sync(
    counterExecOpt,
    0,
  );

  int get count => counterData.lastSuccessValue ?? 0;

  Result<int> counterExecOpt(CounterAction counterAction) {
    final value = count;
    switch (counterAction) {
      case CounterAction.increment:
        return Result.success(value + 1);
      case CounterAction.decrement:
        return Result.success(value > 0 ? value - 1 : 0);
    }
  }

  @override
  bool updateShouldNotify(covariant CounterViewmodel oldWidget) {
    return counterData.value != oldWidget.counterData.value;
  }
}
