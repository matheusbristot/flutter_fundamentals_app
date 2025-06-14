import 'package:flutter/widgets.dart';
import 'package:flutter_fundamentals_app/core/navigator/fundamentals_nav_register.dart';
import 'package:flutter_fundamentals_app/features/chart/router/chart_router.dart';

abstract class FundamentalsRouterFactory {
  // Add other concrete routes here, for example:
  // AnotherFeatureRouter(settings),
  // YetAnotherRouter(settings),
  static List<BaseFundamentalsNavRegister<Object>> createRouters(
      RouteSettings settings) {
    return [
      ChartRouter(settings),
    ];
  }
}
