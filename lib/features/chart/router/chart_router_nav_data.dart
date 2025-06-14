sealed class ChartRouterNavData extends Object {}

final class ChartRouterNavDataDetail extends ChartRouterNavData {
  final String item;

  ChartRouterNavDataDetail(
    this.item,
  );

  factory ChartRouterNavDataDetail.fromArguments(Object? arguments) {
    if (arguments is String) {
      return ChartRouterNavDataDetail(arguments);
    } else {
      throw ArgumentError('Invalid arguments for ChartRouterNavDataDetail');
    }
  }

  @override
  String toString() => 'ChartRouterNavDataDetail(item: $item)';
}
