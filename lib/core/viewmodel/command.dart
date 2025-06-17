import 'package:flutter/foundation.dart';
import 'package:flutter_fundamentals_app/core/viewmodel/result.dart';

typedef AsyncResult<S extends Object> = Future<Result<S>>;

/// Base sealed class for command pattern with result handling and notification.
///
/// [T] is the type of the result value. This class manages the command state,
/// notifies listeners on changes, and caches the last success and error.
sealed class Command<T extends Object> extends ChangeNotifier
    implements ValueListenable<Result<T>> {
  Result<T> _value;

  /// Creates a [Command] with an optional initial value.
  Command([T? initialValue]) : _value = Result.init(initialValue);

  @override
  Result<T> get value => _value;

  Success<T>? _currentSuccess;
  Error<T>? _currentError;

  /// Updates the command value and notifies listeners if changed.
  void setValue(Result<T> value) {
    if (_value == value) return;
    _value = value;
    _updateCache(_value);
    notifyListeners();
  }

  /// Resets the command to its initial state and clears cached results.
  void reset([T? initialValue]) {
    _value = Result.init(initialValue);
    _currentSuccess = null;
    _currentError = null;
    notifyListeners();
  }

  /// Returns the last successful value, if any.
  T? get lastSuccessValue => _currentSuccess?.value;

  /// Returns the last error, if any.
  Exception? get lastError => _currentError?.error;

  /// Updates the cached success or error based on the new value.
  void _updateCache(Result<T> newValue) {
    if (newValue is Success<T>) {
      _currentSuccess = newValue;
    } else if (newValue is Error<T>) {
      _currentError = newValue;
    }
  }
}

/// Command0: Command with no arguments.
///
/// [T] is the type of the result value.
class Command0<T extends Object> extends Command<T> {
  final AsyncResult<T> Function() action;

  /// Creates a [Command0] with the given action and optional initial value.
  Command0(this.action, [T? initialValue]) : super(initialValue);

  /// Executes the command, updating state and handling errors.
  Future<void> execute() async {
    setValue(Executing<T>());
    try {
      final result = await action();
      setValue(result);
    } on Exception catch (e, _) {
      setValue(Result.error(e));
    }
  }
}

/// Command1: Command with one argument.
///
/// [T] is the type of the result value.
/// [P1] is the type of the argument.
class Command1<T extends Object, P1> extends Command<T> {
  final AsyncResult<T> Function(P1) action;

  /// Creates a [Command1] with the given action and optional initial value.
  Command1(this.action, [T? initialValue]) : super(initialValue);

  /// Executes the command with one argument, updating state and handling errors.
  Future<void> execute(P1 param1) async {
    setValue(Executing<T>());
    try {
      final result = await action(param1);
      setValue(result);
    } on Exception catch (e, _) {
      setValue(Result.error(e));
    }
  }
}

/// Command2: Command with two arguments.
///
/// [T] is the type of the result value.
/// [P1] and [P2] are the types of the arguments.
class Command2<T extends Object, P1, P2> extends Command<T> {
  final AsyncResult<T> Function(P1, P2) action;

  /// Creates a [Command2] with the given action and optional initial value.
  Command2(this.action, [T? initialValue]) : super(initialValue);

  /// Executes the command with two arguments, updating state and handling errors.
  Future<void> execute(P1 param1, P2 param2) async {
    setValue(Executing<T>());
    try {
      final result = await action(param1, param2);
      setValue(result);
    } on Exception catch (e, _) {
      setValue(Result.error(e));
    }
  }
}

/// Command0Sync: Command with no arguments and synchronous action.
///
/// [T] is the type of the result value.
class Command0Sync<T extends Object> extends Command<T> {
  final Result<T> Function() action;

  /// Creates a [Command0Sync] with the given action and optional initial value.
  Command0Sync(this.action, [T? initialValue]) : super(initialValue);

  /// Executes the command synchronously, updating state and handling errors.
  void execute() {
    setValue(Executing<T>());
    try {
      final result = action();
      setValue(result);
    } on Exception catch (e, _) {
      setValue(Result.error(e));
    }
  }
}

/// Command1Sync: Command with one argument and synchronous action.
///
/// [T] is the type of the result value.
/// [P1] is the type of the argument.
class Command1Sync<T extends Object, P1> extends Command<T> {
  final Result<T> Function(P1) action;

  /// Creates a [Command1Sync] with the given action and optional initial value.
  Command1Sync(this.action, [T? initialValue]) : super(initialValue);

  /// Executes the command synchronously with one argument, updating state and handling errors.
  void execute(P1 param1) {
    setValue(Executing<T>());
    try {
      final result = action(param1);
      setValue(result);
    } on Exception catch (e, _) {
      setValue(Result.error(e));
    }
  }
}

/// Command2Sync: Command with two arguments and synchronous action.
///
/// [T] is the type of the result value.
/// [P1] and [P2] are the types of the arguments.
class Command2Sync<T extends Object, P1, P2> extends Command<T> {
  final Result<T> Function(P1, P2) action;

  /// Creates a [Command2Sync] with the given action and optional initial value.
  Command2Sync(this.action, [T? initialValue]) : super(initialValue);

  /// Executes the command synchronously with two arguments, updating state and handling errors.
  void execute(P1 param1, P2 param2) {
    setValue(Executing<T>());
    try {
      final result = action(param1, param2);
      setValue(result);
    } on Exception catch (e, _) {
      setValue(Result.error(e));
    }
  }
}
