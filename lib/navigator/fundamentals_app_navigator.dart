import 'package:flutter/widgets.dart';
import 'package:flutter_fundamentals_app/core/navigator/fundamentals_nav_register.dart';
import 'package:flutter_fundamentals_app/core/navigator/fundamentals_nav_route.dart';
import 'package:flutter_fundamentals_app/navigator/fundamentals_app_navigator_factory.dart';

final class FundamentalsAppNavigator {
  final _FundamentalsNavRouterRegister _navRouterRegistry =
      _FundamentalsNavRouterRegister();

  RouteSettings? routeSettings;

  FundamentalsAppNavigator._internal();

  static FundamentalsAppNavigator get instance => _instance;

  static final FundamentalsAppNavigator _instance =
      FundamentalsAppNavigator._internal();

  Route Function(RouteSettings nextRoute) _registerAllRoutes() {
    if (routeSettings != null) {
      _navRouterRegistry.setNavRegisters(routeSettings!);
    }
    return _onSetRoute();
  }

  Route Function(RouteSettings nextRoute) _onSetRoute() {
    assert(routeSettings != null, 'RouteSettings must not be null');
    assert(routeSettings?.name != null, 'RouteSettings.name must not be null');
    final routeName = routeSettings!.name!;
    final route = _navRouterRegistry.navRegisters[routeName];
    if (route != null) {
      _navRouterRegistry.routes[routeName] = (RouteSettings settings) => route;
    }
    return _navRouterRegistry.routes[routeName] ??
        (RouteSettings settings) {
          throw Exception('Route not found: $routeName');
        };
  }

  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    routeSettings = settings;
    final routeBuilder = _registerAllRoutes();
    return routeBuilder(settings);
  }
}

final class _FundamentalsNavRouterRegister {
  @protected
  final Map<String, FundamentalsNavRoute<Object?>> _navRegisters = {};
  @protected
  final Map<String, Route<dynamic> Function(RouteSettings)> _routes = {};

  Map<String, FundamentalsNavRoute<Object?>> get navRegisters => _navRegisters;
  Map<String, Route<dynamic> Function(RouteSettings)> get routes => _routes;

  void setNavRegisters(RouteSettings settings) {
    if (_navRegisters.isNotEmpty) {
      _navRegisters.clear();
    }

    final List<BaseFundamentalsNavRegister<Object>> routers =
        FundamentalsRouterFactory.createRouters(settings);
    for (final router in routers) {
      _navRegisters.addAll(router.routes);
    }
  }
}
