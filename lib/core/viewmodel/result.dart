sealed class Result<T extends Object> {
  const Result([this.value]);

  final T? value;

  const factory Result.success(T value) = Success._;

  const factory Result.error(Exception error) = Error._;

  const factory Result.init([T? value]) = Initial._;

  bool get isInitial => this is Initial<T>;
  bool get isError => this is Error<T>;
  bool get isExecuting => this is Executing<T>;
  bool get isSuccess => this is Success<T>;
}

final class Initial<T extends Object> extends Result<T> {
  const Initial._([super.value]);

  @override
  String toString() => value != null
      ? 'Result<$T>.initial(value: $value)'
      : 'Result<$T>.initial()';
}

final class Success<T extends Object> extends Result<T> {
  const Success._(super.value);

  @override
  String toString() => 'Result<$T>.Success($value)';
}

final class Executing<T extends Object> extends Result<T> {
  const Executing();

  @override
  String toString() => 'Result<$T>.Executing()';
}

final class Error<T extends Object> extends Result<T> {
  const Error._(this.error);

  final Exception error;

  @override
  String toString() => 'Result<$T>.error($error)';
}
